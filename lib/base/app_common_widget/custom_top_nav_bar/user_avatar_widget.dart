import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:nephroscan/base/base.dart';
import 'package:nephroscan/routes/auto_router.gr.dart';

class UserAvatarWidget extends StatelessWidget {
  const UserAvatarWidget({super.key, this.username, this.email});
  final String? username;
  final String? email;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ClipRRect(
        borderRadius: BorderRadiusGeometry.circular(50),
        child: InkWell(
          splashColor: AppColors.transparent,
          highlightColor: AppColors.transparent,
          onTap: () => context.router.push(
            SettingRoute(userName: username, userEmail: email),
          ),
          child: Image.asset(PNGImages.dummy),
        ),
      ),
    );
  }
}
