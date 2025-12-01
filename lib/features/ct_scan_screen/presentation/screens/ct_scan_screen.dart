import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:image/image.dart' as img;
import 'package:nephroscan/base/base.dart';
import 'package:nephroscan/base/utils/ct_scan_model.dart';
import 'package:nephroscan/core_ui/custom_loading.dart';
import 'package:nephroscan/features/ct_scan_screen/data/models/gemini_response_model.dart';
import 'package:nephroscan/routes/auto_router.gr.dart';

import '../../../../core/media_picker/media_picker_config.dart';
import '../../../../core/media_picker/media_picker_service.dart';
import '../../../../core/media_picker/media_source.dart';
import '../../../../core/media_picker/media_type.dart';
import '../../data/models/report_model.dart';
import '../cubit/ct_scan_upload_cubit/ct_scan_upload_cubit.dart';
import '../widgets/media_single_widget.dart';

class CtScanScreen extends StatefulWidget {
  const CtScanScreen({super.key});

  @override
  State<CtScanScreen> createState() => _CtScanScreenState();
}

class _CtScanScreenState extends State<CtScanScreen> {
  final ValueNotifier<File?> _pickedImageNotifier = ValueNotifier<File?>(null);
  final model = CtScanModel();

  late final GenerativeModel _model;
  late final CtScanUploadCubit _ctScanUploadCubit;

  @override
  void initState() {
    super.initState();

    _ctScanUploadCubit = context.read<CtScanUploadCubit>();
    _model = GenerativeModel(
      model: 'gemini-2.5-flash',
      apiKey: GoogleCredentials.apiKey,
      generationConfig: GenerationConfig(
        responseMimeType: 'application/json',
        responseSchema: jsonSchema,
      ),
    );
  }

  @override
  void dispose() {
    _pickedImageNotifier.dispose();
    super.dispose();
  }

  Future<void> _handleImagePick(
    BuildContext context,
    MediaSource source,
  ) async {
    MediaPickerService().initiateMediaPick(
      context: context,
      types: [MediaType.image],
      sources: [source],
      config: MediaPickerConfig(
        cropsImage: false, // Disable cropping to avoid UCrop issues
      ),
      onSuccess: (p0) async {
        if (p0.isEmpty) {
          return;
        }
        final selectedFile = File(p0.first.file.path);
        _pickedImageNotifier.value = selectedFile;
        await model.loadModel();

        final fileImage = img.decodeImage(await selectedFile.readAsBytes())!;
        final prediction = model.predict(fileImage);
        log('the prediction is $prediction');

        int predictedClass = prediction.indexWhere(
          (val) => val == prediction.reduce((a, b) => a > b ? a : b),
        );

        var data = await _generateMedicalExplanation(predictedClass);
        log('here is the data from gemini ${data?.response?.title}');

        final report = ReportModel(
          id: '',
          patientId: '',
          doctorId: '',
          title: data?.response?.title,
          findings: data?.response?.findings,
          impression: data?.response?.impression,
          description: data?.response?.description,
          date: DateTime.now().toIso8601String(),
          ctScanImageUrl: '',
        );
        _ctScanUploadCubit.uploadCtScanData(
          report: report,
          ctScanFile: selectedFile,
        );
      },
      onError: (p0) {
        if (!context.mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to pick image: ${p0.toString()}')),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocListener<CtScanUploadCubit, CtScanUploadState>(
          listener: (context, state) {
            state.when(
              initial: () {},
              loading: () => CustomLoading().show(context),
              success: () {
                CustomLoading().hide();
                context.router.push(ReportsRoute());
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('CT Scan uploaded successfully'),
                  ),
                );
              },
              error: (message) {
                CustomLoading().hide();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Failed to upload CT Scan')),
                );
              },
            );
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(PNGImages.uploadImage, width: 200, height: 200),
              Text(
                'Upload CT Scan',
                style: AppTextStyles.titleLargeMontserrat.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              Container(
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.only(
                  top: 24.0,
                  left: 12.0,
                  right: 12.0,
                  bottom: 18.0,
                ),
                decoration: BoxDecoration(
                  color: Theme.of(
                    context,
                  ).disabledColor.withValues(alpha: 0.04),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    MediaSingleWidget(
                      media: 'Camera',
                      iconData: Icons.camera_alt_outlined,
                      onTap: () =>
                          _handleImagePick(context, MediaSource.camera),
                    ),
                    MediaSingleWidget(
                      media: 'Photos',
                      iconData: Icons.photo_library_outlined,
                      onTap: () =>
                          _handleImagePick(context, MediaSource.gallery),
                    ),
                    MediaSingleWidget(
                      media: 'Files',
                      iconData: Icons.folder_outlined,
                      onTap: () => _handleImagePick(context, MediaSource.files),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  final jsonSchema = Schema.object(
    properties: {
      'message':
          Schema.string(), // General message like "Model Prediction and Findings"
      'response': Schema.object(
        properties: {
          'title':
              Schema.string(), // The title of the medical condition (e.g., "Cyst", "Kidney Tumor")
          'findings':
              Schema.string(), // Detailed description of the findings detected in the image
          'impression':
              Schema.string(), // Brief medical impression or diagnosis
          'description':
              Schema.string(), // Detailed description about the condition
        },
      ),
    },
    requiredProperties: ['message', 'response'],
  );

  Future<GeminiResponse?> _generateMedicalExplanation(
    int predictedClass,
  ) async {
    try {
      final prompt =
          """
You are a medical assistant designed to provide detailed explanations for predicted medical conditions from images. Based on the model's output, you will generate a structured response in JSON format with findings, impression, title, and description.

The predicted class is: $predictedClass
Where: 0 = Cyst, 1 = Normal, 2 = Stone, 3 = Tumor

#### Instructions:
- Your task is to interpret the class prediction (as an integer) and generate a comprehensive explanation for the detected condition.
- The explanation should be suitable for a medical report, providing the following:
  - **Findings**: A detailed description of the detected condition based on the class prediction. This should cover specific features observed in the image (e.g., shape, location, or size of abnormalities).
  - **Impression**: A brief medical diagnosis or conclusion based on the condition detected by the model. This section should provide a general overview, such as whether the condition is benign, malignant, or normal.
  - **Title**: A short label for the condition detected, such as "Cyst", "Tumor", "Normal Kidney", or "Kidney Stone".
  - **Description**: A detailed narrative about the condition, explaining its characteristics, potential health risks, and treatment options (if applicable). Provide a general medical understanding of the condition, including common management strategies.

### Conditions and Their Explanations:
1. **Cyst (Benign)**:
    - **Findings**: The model has detected a cyst in the kidney. The cyst appears as a smooth, fluid-filled sac with regular edges. It is located near the upper part of the kidney with no significant irregularities in surrounding tissues.
    - **Impression**: The condition is classified as a benign cyst, which is non-cancerous. The cyst is likely stable and may not require immediate intervention. However, periodic monitoring is recommended to ensure no changes in size or structure.
    - **Title**: Cyst (Benign)
    - **Description**: A kidney cyst is typically a benign, fluid-filled sac that forms within the kidney. Most kidney cysts are asymptomatic and do not require treatment, but monitoring for growth is advised. While the majority of kidney cysts are harmless, it is important to differentiate them from other conditions like tumors, which may require further investigation.

2. **Normal Kidney**:
    - **Findings**: The model detected no abnormalities in the kidney. The kidney appears to be of normal size and structure with no visible cysts, stones, or tumors.
    - **Impression**: The kidney is normal with no visible signs of disease or abnormality. No further action is needed.
    - **Title**: Normal Kidney
    - **Description**: The kidney appears healthy with no visible signs of any medical conditions. It is functioning well and no intervention is needed. Maintaining a healthy lifestyle and regular medical check-ups are recommended to ensure continued kidney health.

3. **Kidney Stone**:
    - **Findings**: The model detected a kidney stone within the kidney. The stone appears as a dense, calcified mass within the renal parenchyma. The stone is of medium size and is located near the renal pelvis.
    - **Impression**: The kidney stone is detected, and depending on its size and location, it may cause pain or blockage. If the stone is small, it may pass naturally, but larger stones may require medical intervention such as lithotripsy or surgical removal.
    - **Title**: Kidney Stone
    - **Description**: Kidney stones are hard mineral deposits that form in the kidneys. They can cause pain when moving through the urinary tract, especially during urination. Treatment may involve hydration, pain management, and in some cases, surgical procedures like lithotripsy or nephrolithotomy. Stones larger than a certain size may require medical intervention to prevent complications.

4. **Kidney Tumor**:
    - **Findings**: The model detected an abnormal mass in the kidney, which could be indicative of a tumor. The tumor appears irregular in shape with some distortion of the surrounding renal tissue.
    - **Impression**: A kidney tumor is suspected. This condition requires further investigation, including imaging studies (e.g., CT scan) and possibly a biopsy to determine whether the tumor is benign or malignant.
    - **Title**: Kidney Tumor
    - **Description**: Kidney tumors can be benign or malignant. Malignant tumors, like renal cell carcinoma, require prompt medical attention, often including surgery, chemotherapy, or radiation therapy. A biopsy is necessary to determine the exact nature of the tumor. Early diagnosis and treatment are critical for better outcomes.

### Example of Output:

{
  "message": "success",
  "response": {
    "findings": "The input image shows a smooth, circular cyst located near the upper part of the kidney. The surrounding tissue appears unaffected, and no other abnormalities are present.",
    "impression": "The image is classified as a benign cyst. This is a non-cancerous condition that typically requires no treatment but should be monitored periodically for any changes.",
    "title": "Cyst (Benign)",
    "description": "A kidney cyst is a fluid-filled sac that is generally harmless. Most cysts are asymptomatic, but larger cysts may cause discomfort or affect kidney function. Regular monitoring is recommended to ensure no changes in size or other complications arise."
  }
}

dont use any other language other than English.

### End of Prompt
  """;

      log(
        'Attempting to generate medical explanation for class: $predictedClass',
      );
      final response = await _model.generateContent([Content.text(prompt)]);
      log('Gemini response: ${response.text}');

      final GeminiResponse jsonMap = GeminiResponse.fromJson(
        jsonDecode(response.text ?? '{}'),
      );

      return jsonMap;
    } on Exception catch (e, stackTrace) {
      // Handle known blocking error message specially
      final errorMessage = e.toString();
      log('Generate content failed: $errorMessage\n$stackTrace');

      String userMessage;
      if (errorMessage.contains('Requests to this API') ||
          errorMessage.contains('firebasevertexai.googleapis.com') ||
          errorMessage.contains('blocked')) {
        userMessage =
            'AI model requests are currently blocked. Please enable the Vertex AI API in Firebase Console, ensure billing is enabled, or contact support.';
        log(
          'ERROR: Vertex AI API is blocked. Enable it in Firebase Console and ensure billing is enabled.',
        );
      } else if (errorMessage.contains('API key')) {
        userMessage =
            'Invalid API key. Please check your Firebase configuration.';
      } else if (errorMessage.contains('quota') ||
          errorMessage.contains('limit')) {
        userMessage = 'API quota exceeded. Please try again later.';
      } else {
        userMessage = 'Failed to generate medical explanation: $errorMessage';
      }

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(userMessage),
            duration: const Duration(seconds: 5),
            backgroundColor: Colors.red.shade700,
          ),
        );
      }
    }
  }
}
