import 'package:flutter/material.dart';
import 'package:nephroscan/base/base.dart';

class DoctorSingleWidget extends StatefulWidget {
  const DoctorSingleWidget({super.key});

  @override
  State<DoctorSingleWidget> createState() => _DoctorSingleWidgetState();
}

class _DoctorSingleWidgetState extends State<DoctorSingleWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onPrimary.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              PNGImages.dummy,
              width: 70,
              height: 70,
              fit: BoxFit.cover,
            ),
          ),
          8.horizontalBox,
          Expanded(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Dr. Jane Smith',
                          style: AppTextStyles.bodyMediumPoppins.copyWith(
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                        ),
                        Text(
                          'Nephrologist',
                          style: AppTextStyles.bodySmallPoppins.copyWith(
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                        ),
                      ],
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.bookmark_border_outlined),
                    ),
                  ],
                ),
                8.verticalBox,
                Row(
                  children: [
                    Icon(Icons.star, size: 16, color: AppColors.accentDark),
                    4.horizontalBox,
                    Text(
                      '4.8',
                      style: AppTextStyles.bodySmallPoppins.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                    SizedBox(
                      height: 12,
                      child: VerticalDivider(
                        color: Theme.of(
                          context,
                        ).colorScheme.onPrimary.withValues(alpha: 0.2),
                      ),
                    ),
                    Text(
                      '250 Reviews',
                      style: AppTextStyles.bodySmallPoppins.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
