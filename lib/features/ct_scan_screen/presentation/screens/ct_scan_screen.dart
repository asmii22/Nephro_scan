import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:nephroscan/base/assets/assets.dart';
import 'package:nephroscan/base/utils/app_text_styles.dart';
import 'package:nephroscan/routes/auto_router.gr.dart';

import '../widgets/media_single_widget.dart';

class CtScanScreen extends StatefulWidget {
  const CtScanScreen({super.key});

  @override
  State<CtScanScreen> createState() => _CtScanScreenState();
}

class _CtScanScreenState extends State<CtScanScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
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
                color: Theme.of(context).disabledColor.withValues(alpha: 0.04),
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
                    onTap: () {
                      log('it is pressed');
                      context.router.push(ReportsRoute());
                    },
                  ),
                  MediaSingleWidget(
                    media: 'Photos',
                    iconData: Icons.photo_library_outlined,
                  ),
                  MediaSingleWidget(
                    media: 'files',
                    iconData: Icons.folder_outlined,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
