import 'package:flutter/material.dart';

import '../../../base/utils/app_text_styles.dart';

class ProfileContainerWidget extends StatelessWidget {
  const ProfileContainerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return Center(
      child: Container(
        width: width * 0.8,
        padding: EdgeInsets.all(30),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Text('50+', style: AppTextStyles.bodyLargeInter),
                Text('Tests', style: AppTextStyles.bodySmallInter),
              ],
            ),
            SizedBox(
              height: 30,
              child: VerticalDivider(
                thickness: 2,
                width: 2,
                color: Theme.of(context).dividerColor.withValues(alpha: 0.3),
                radius: BorderRadius.circular(10),
              ),
            ),
            Column(
              children: [
                Text('120', style: AppTextStyles.bodyLargeInter),
                Text('Reports', style: AppTextStyles.bodySmallInter),
              ],
            ),
            SizedBox(
              height: 30,
              child: VerticalDivider(
                thickness: 2,
                width: 2,
                color: Theme.of(context).dividerColor.withValues(alpha: 0.3),
                radius: BorderRadius.circular(10),
              ),
            ),
            Column(
              children: [
                Text('5', style: AppTextStyles.bodyLargeInter),
                Text('Doctors', style: AppTextStyles.bodySmallInter),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
