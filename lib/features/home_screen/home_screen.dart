import 'package:flutter/material.dart';
import 'package:nephroscan/base/base.dart';

import '../../base/app_common_widget/custom_top_nav_bar/user_avatar_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomTopNavBar(
        backgroundColor: AppColors.transparent,
        rightWidget: UserAvatarWidget(),
      ),
      body: Column(children: []),
    );
  }
}
