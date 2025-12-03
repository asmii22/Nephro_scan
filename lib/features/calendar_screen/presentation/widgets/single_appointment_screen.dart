import 'package:flutter/material.dart';
import 'package:nephroscan/base/base.dart';

class SingleAppointmentScreen extends StatelessWidget {
  const SingleAppointmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onPrimary.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Date', style: AppTextStyles.bodyMediumMontserrat),
                    Text(
                      'Aug 25, 2025',
                      style: AppTextStyles.bodyMediumMontserrat.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Time', style: AppTextStyles.bodyMediumMontserrat),
                    Text(
                      '10:00 AM',
                      style: AppTextStyles.bodyMediumMontserrat.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Doctor', style: AppTextStyles.bodyMediumMontserrat),
                    Text(
                      'Dr. John Doe',
                      style: AppTextStyles.bodyMediumMontserrat.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          10.verticalBox,
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Appointment',
                      style: AppTextStyles.bodyMediumMontserrat,
                    ),
                    Text(
                      'General Checkup',
                      style: AppTextStyles.bodyMediumMontserrat.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Location', style: AppTextStyles.bodyMediumMontserrat),
                    Text(
                      'Room 101, Main Hospital',
                      style: AppTextStyles.bodyMediumMontserrat.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: AppButton(
                  title: 'Re-Schedule',
                  onClick: () {},
                  margin: EdgeInsets.symmetric(vertical: 10),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
