import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:image/image.dart' as img;
import 'package:nephroscan/base/base.dart';
import 'package:nephroscan/base/utils/ct_scan_model.dart';
import 'package:nephroscan/core_ui/custom_loading.dart';
import 'package:nephroscan/features/ct_scan_screen/data/models/gemini_response_model.dart';
import 'package:nephroscan/features/dashboard_screen/presentation/cubit/user_info_cubit/user_info_cubit.dart';

import '../../../../core/media_picker/media_picker_config.dart';
import '../../../../core/media_picker/media_picker_service.dart';
import '../../../../core/media_picker/media_source.dart';
import '../../../../core/media_picker/media_type.dart';
import '../../../dashboard_screen/presentation/cubit/user_info_cubit/user_info_cubit.dart';
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
  final ValueNotifier<bool> _isProcessing = ValueNotifier<bool>(false);
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
    _isProcessing.dispose();
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

        try {
          _isProcessing.value = true;

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
        } catch (e) {
          _isProcessing.value = false;
          if (!context.mounted) return;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error processing image: ${e.toString()}')),
          );
        }
      },
      onError: (p0) {
        _isProcessing.value = false;
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
                _isProcessing.value = false;
                CustomLoading().hide();
                context.read<UserInfoCubit>().getUserInfo();

                // context.router.push(ReportsRoute());
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('CT Scan uploaded successfully'),
                  ),
                );
                context.read<UserInfoCubit>().getUserInfo();
              },
              error: (message) {
                _isProcessing.value = false;
                CustomLoading().hide();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Failed to upload CT Scan')),
                );
              },
            );
          },
          child: ValueListenableBuilder<bool>(
            valueListenable: _isProcessing,
            builder: (context, isProcessing, child) {
              if (isProcessing) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const CircularProgressIndicator(),
                    16.verticalBox,
                    Text(
                      'Processing CT Scan...',
                      style: AppTextStyles.bodyMediumPoppins.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    8.verticalBox,
                    Text(
                      'Please wait while we analyze the image',
                      style: AppTextStyles.bodySmallPoppins.copyWith(
                        color: Theme.of(
                          context,
                        ).colorScheme.onSurface.withValues(alpha: 0.7),
                      ),
                    ),
                  ],
                );
              }

              return Column(
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
                          onTap: () =>
                              _handleImagePick(context, MediaSource.files),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
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
You are a medical assistant designed to provide detailed explanations for predicted medical conditions from images. Based on the model's output, you will generate a structured response in **English** in JSON format with findings, impression, title, and description.

The predicted class is: $predictedClass  
Where: 
  - 0 = Cyst, 
  - 1 = Normal, 
  - 2 = Stone, 
  - 3 = Tumor

### Instructions:
Your task is to generate a comprehensive explanation for the detected condition based on the class prediction provided above. Please ensure the explanation is suitable for a medical report, with the following components:

1. **Title**:  
   Generate a short and informative title for the condition. The title should be descriptive, concise, and relevant to the predicted condition. It should accurately represent the condition detected based on the provided information. The title can include terms like "Benign", "Malignant", "Abnormal", etc., depending on the nature of the condition.

2. **Findings**:  
   Provide a detailed description of the detected condition. This should be a clear interpretation of what is observed in the image. You can mention the shape, size, location, and any other relevant features of the detected condition. The findings should be based on the class prediction but can be more specific to the image’s features.

3. **Impression**:  
   Give a brief medical diagnosis or conclusion based on the findings. The impression should provide a quick overview, such as whether the condition is benign, malignant, or normal. This is the medical conclusion that will guide further actions or observation.

4. **Description**:  
   Provide a comprehensive narrative about the condition. This should include:
   - A deeper explanation of what the condition is.
   - Potential risks or complications associated with the condition (if applicable).
   - Treatment or management options, including recommendations or lifestyle changes that may help manage the condition.
   - The description should go beyond the findings and provide a fuller understanding of the condition, its impact, and medical implications.

### Conditions and Their Explanations (Class Prediction Reference):
- **0: Cyst (Benign)**:  
  The AI is free to generate a description that explains what a cyst is, how it behaves, and what medical action, if any, is required.

- **1: Normal Kidney**:  
  The AI should generate a positive report with a clear confirmation that the kidney is healthy and normal. This may include the absence of abnormal conditions like cysts, stones, or tumors.

- **2: Kidney Stone**:  
  The AI should describe what a kidney stone is, its size, and how it affects kidney function. The description may include treatment options such as hydration or surgical interventions.

- **3: Kidney Tumor**:  
  The AI should generate a more detailed report, explaining the potential implications of a kidney tumor, including the need for additional tests, biopsy, or possible treatments.


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
    return null;
  }
}
