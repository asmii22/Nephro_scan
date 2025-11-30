import 'dart:developer';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image/image.dart' as img;
import 'package:nephroscan/base/base.dart';
import 'package:nephroscan/base/utils/ct_scan_model.dart';
import 'package:nephroscan/core_ui/custom_loading.dart';
import 'package:nephroscan/routes/auto_router.gr.dart';

import '../../../../core/media_picker/media_picker_config.dart';
import '../../../../core/media_picker/media_picker_service.dart';
import '../../../../core/media_picker/media_source.dart';
import '../../../../core/media_picker/media_type.dart';
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

  @override
  void initState() {
    super.initState();
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

        log("Predicted class: $predictedClass");

        // final report = ReportModel(
        //   id: '',
        //   patientId: '',
        //   doctorId: '',
        //   title: AppStrings.reportTitle,
        //   description: AppStrings.reportDescription,
        //   date: DateTime.now(),
        //   ctScanImageUrl: '',
        // );
        // context.read<CtScanUploadCubit>().uploadCtScanData(
        //   report: report,
        //   ctScanFile: selectedFile,
        // );
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
}
