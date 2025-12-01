import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nephroscan/base/base.dart';
import 'package:nephroscan/base/utils/date_extentions.dart';
import 'package:nephroscan/features/ct_scan_screen/domain/entities/report_entity.dart';

@RoutePage()
class SingleReportScreen extends StatelessWidget {
  const SingleReportScreen({super.key, this.report});
  final ReportEntity? report;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomTopNavBar(title: 'Report'),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: CachedNetworkImage(
                  imageUrl: report?.ctScanImageUrl ?? '',
                  width: 280,
                  height: 280,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Container(
                    width: 280,
                    height: 280,
                    color: Colors.grey[200],
                    child: const Center(child: CircularProgressIndicator()),
                  ),
                  errorWidget: (context, url, error) => Container(
                    width: 280,
                    height: 280,
                    color: Colors.grey[200],
                    child: const Center(
                      child: Icon(
                        Icons.error_outline,
                        size: 48,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          10.verticalBox,
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    report?.date?.formatDate('MMM dd, yyyy') ??
                        'January 15 2025',
                    style: AppTextStyles.bodyMediumPoppins.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
                  16.verticalBox,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 100,
                        child: Text(
                          'Title:',
                          style: AppTextStyles.bodyMediumPoppins.copyWith(
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          report?.title ?? 'Swollen kidney with stones',
                          style: AppTextStyles.bodyMediumPoppins.copyWith(
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                        ),
                      ),
                    ],
                  ),
                  16.verticalBox,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 100,
                        child: Text(
                          'Findings:',
                          style: AppTextStyles.bodyMediumPoppins.copyWith(
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          report?.findings ??
                              'No description available for this report.',
                          style: AppTextStyles.bodyMediumPoppins.copyWith(
                            color: Theme.of(context).colorScheme.onBackground,
                          ),
                        ),
                      ),
                    ],
                  ),
                  16.verticalBox,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 100,
                        child: Text(
                          'Impression:',
                          style: AppTextStyles.bodyMediumPoppins.copyWith(
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).colorScheme.onBackground,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          report?.impression ??
                              'No description available for this report.',
                          style: AppTextStyles.bodyMediumPoppins.copyWith(
                            color: Theme.of(context).colorScheme.onBackground,
                          ),
                        ),
                      ),
                    ],
                  ),
                  16.verticalBox,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 100,
                        child: Text(
                          'Description:',
                          style: AppTextStyles.bodyMediumPoppins.copyWith(
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).colorScheme.onBackground,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          report?.description ??
                              'No description available for this report.',
                          style: AppTextStyles.bodyMediumPoppins.copyWith(
                            color: Theme.of(context).colorScheme.onBackground,
                          ),
                        ),
                      ),
                    ],
                  ),
                  16.verticalBox,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
