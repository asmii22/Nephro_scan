import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nephroscan/base/base.dart';
import 'package:nephroscan/core_ui/custom_loading.dart';
import 'package:nephroscan/features/sign_in_sign_up_screen/cubit/user_sign_in_cubit/user_sign_in_cubit.dart';
import 'package:nephroscan/routes/auto_router.gr.dart';

@RoutePage()
class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomTopNavBar(
        title: 'Settings',
        backgroundColor: AppColors.transparent,
      ),
      body: BlocListener<UserSignInCubit, UserSignInState>(
        listener: (context, state) {
          state.maybeWhen(
            loading: () => CustomLoading().show(context),
            signOut: () {
              CustomLoading().hide();
              context.router.replaceAll([SignInRoute()]);
            },
            orElse: () => CustomLoading().hide(),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                  height: 80,
                  child: ClipRRect(
                    borderRadius: BorderRadiusGeometry.circular(100),
                    child: Image.asset(PNGImages.dummy),
                  ),
                ),
                10.verticalBox,
                Text(
                  'User Name',
                  style: AppTextStyles.titleMediumPoppins.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text('abc@gmail.com', style: AppTextStyles.titleSmallPoppins),
                10.verticalBox,
                _SettingComponent(
                  title: 'Appearance',
                  iconColor: AppColors.appearance,
                  iconPath: SVGIcons.appearance,
                  onTap: () {},
                ),
                _SettingComponent(
                  title: 'Notification',
                  iconColor: AppColors.notification,
                  iconPath: SVGIcons.notifications,
                  onTap: () {},
                ),
                _SettingComponent(
                  title: 'Privacy',
                  iconColor: AppColors.privacy,
                  iconPath: SVGIcons.privacy,
                  onTap: () {},
                ),
                _SettingComponent(
                  title: 'Security',
                  iconColor: AppColors.security,
                  iconPath: SVGIcons.security,
                  onTap: () {},
                ),
                _SettingComponent(
                  title: 'Main',
                  iconColor: AppColors.main,
                  iconPath: SVGIcons.main,
                  onTap: () {},
                ),
                _SettingComponent(
                  title: 'Language',
                  iconColor: AppColors.language,
                  iconPath: SVGIcons.language,
                  onTap: () {},
                ),
                _SettingComponent(
                  title: 'Ask a Question',
                  iconColor: AppColors.askAQuestion,
                  iconPath: SVGIcons.questions,
                  onTap: () {},
                ),
                _SettingComponent(
                  title: "FAQ's",
                  iconColor: AppColors.faqs,
                  iconPath: SVGIcons.faqs,
                  onTap: () {},
                ),
                10.verticalBox,
                AppButton(
                  title: 'Logout',
                  onClick: () {
                    return showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text(
                            'Confirm Logout',
                            style: AppTextStyles.bodyLargePoppins,
                          ),
                          content: Text(
                            'Are you sure you want to logout?',
                            style: AppTextStyles.bodyMediumPoppins,
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(
                                  context,
                                ).pop(); // Dismiss the dialog
                              },
                              child: Text(
                                'Cancel',
                                style: AppTextStyles.bodySmallInter.copyWith(
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.onPrimary,
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.of(
                                  context,
                                ).pop(); // Dismiss the dialog
                                context.read<UserSignInCubit>().signOut();
                              },
                              child: Text(
                                'Logout',
                                style: AppTextStyles.bodySmallInter.copyWith(
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.onPrimary,
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SettingComponent extends StatelessWidget {
  const _SettingComponent({
    super.key,
    this.title,
    this.iconColor,
    this.iconPath,
    this.onTap,
  });
  final String? title;
  final Color? iconColor;
  final String? iconPath;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: AppColors.transparent,
      onTap: onTap,
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(vertical: 3),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              height: 30,
              width: 30,
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: iconColor ?? Colors.blue,
                borderRadius: BorderRadiusGeometry.circular(30),
              ),
              child: SvgPicture.asset(iconPath ?? SVGIcons.appearance),
            ),
            5.horizontalBox,
            Expanded(
              child: Text(title ?? '', style: AppTextStyles.bodyLargePoppins),
            ),
          ],
        ),
      ),
    );
  }
}
