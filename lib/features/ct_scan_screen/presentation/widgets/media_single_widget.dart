import 'package:flutter/material.dart';
import 'package:nephroscan/base/utils/app_text_styles.dart';
import 'package:nephroscan/base/utils/colors.dart';

class MediaSingleWidget extends StatelessWidget {
  const MediaSingleWidget({super.key, this.media, this.iconData, this.onTap});
  final String? media;
  final IconData? iconData;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.widthOf(context);
    return InkWell(
      onTap: onTap,
      splashColor: AppColors.transparent,
      child: Container(
        width: width * 0.25,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColors.grey.withValues(alpha: 0.3),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            Icon(
              iconData ?? Icons.camera_alt_outlined,
              size: 50,
              color: Colors.grey[600],
            ),
            Text(
              media ?? '',
              style: AppTextStyles.bodyLargePoppins.copyWith(
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
