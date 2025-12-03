import 'package:flutter/material.dart';
import 'package:nephroscan/base/base.dart';

import '../../../../base/app_common_widget/custom_top_nav_bar/user_avatar_widget.dart';
import '../../../../core_ui/title_view_all_widget.dart';
import '../widgets/doctor_single_widget.dart';
import '../widgets/upcoming_appointments_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, this.username, this.email});
  final String? username;
  final String? email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomTopNavBar(
        leftWidget: SizedBox.shrink(),
        title: 'Home',
        backgroundColor: AppColors.transparent,
        rightWidget: UserAvatarWidget(username: username, email: email),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome, ${username ?? 'User'}!',
                    style: AppTextStyles.headlineMediumPoppins.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  20.verticalBox,
                  TitleViewAllWidget(
                    title: 'Upcoming Appointments',
                    onViewAllTap: () {},
                  ),
                  10.verticalBox,
                  UpcomingAppointmentsWidget(),
                  10.verticalBox,
                ],
              ),
            ),
            TitleViewAllWidget(
              title: 'Popular Doctors',
              horizontalPadding: 10,
              onViewAllTap: () {},
              keywords: [
                'Nephrologist',
                'Urologist',
                'Transplant Specialists',
                'Nephrologists',
                'Urologists',
                'Transplant Specialist',
              ],
            ),
            10.verticalBox,
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 3,
              itemBuilder: (context, index) => DoctorSingleWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
