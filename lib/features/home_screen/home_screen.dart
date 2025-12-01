import 'package:flutter/material.dart';
import 'package:nephroscan/base/base.dart';

import '../../base/app_common_widget/custom_top_nav_bar/user_avatar_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, this.username, this.email});
  final String? username;
  final String? email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomTopNavBar(
        backgroundColor: AppColors.transparent,
        rightWidget: UserAvatarWidget(username: username, email: email),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildStyledButton(context, 'Dealer Finder'),
            20.verticalBox,
            _buildStyledButton(context, 'Dealer Finder'),
          ],
        ),
      ),
    );
  }

  Widget _buildStyledButton(BuildContext context, String title) {
    return InkWell(
      onTap: () {
        // Handle button tap
      },
      borderRadius: BorderRadius.circular(40),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 32),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.white,
              Colors.white,
              Colors.white,
              Colors.white,
              Colors.white,
              Colors.white,
              Colors.white,
              Colors.grey.shade100,
              Colors.grey.shade400,
              Colors.grey.shade300,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: Color(0xFF6B8E23).withValues(alpha: 0.3),
            width: 2,
          ),
        ),
        child: Center(
          child: Text(
            title,
            style: AppTextStyles.headlineMediumMontserrat.copyWith(
              color: Color(0xFF6B8E23),
              fontWeight: FontWeight.w600,
              fontSize: 32,
            ),
          ),
        ),
      ),
    );
  }
}
