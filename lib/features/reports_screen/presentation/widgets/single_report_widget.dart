import 'package:flutter/material.dart';
import 'package:nephroscan/base/base.dart';
import 'package:nephroscan/base/utils/date_extentions.dart';

class SingleReportWidget extends StatelessWidget {
  const SingleReportWidget({
    super.key,
    this.date,
    this.reportTitle,
    this.reportDescription,
    this.onTap,
  });
  final String? date;
  final String? reportTitle;
  final String? reportDescription;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: AppColors.transparent,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Theme.of(
                context,
              ).colorScheme.onPrimary.withValues(alpha: 0.7),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  date?.formatDate('MMM dd, yyyy') ?? 'January 15 2025',
                  style: AppTextStyles.bodyMediumPoppins.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                Text(
                  reportTitle ?? 'Swollen kidney with stones',
                  style: AppTextStyles.bodyMediumPoppins.copyWith(
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ],
            ),
          ),
          Material(
            elevation: 6,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(16),
              bottomRight: Radius.circular(16),
            ),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Theme.of(
                  context,
                ).colorScheme.onPrimary.withValues(alpha: 0.05),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
              ),
              child: Text(
                reportDescription ??
                    'A swollen kidney with three stones indicates kidney enlargement due to blockage or irritation caused by the stones.',
                style: AppTextStyles.bodySmallPoppins,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
