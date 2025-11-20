import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:nephroscan/base/app_common_widget/app_text_field/app_text_field.dart';
import 'package:nephroscan/base/app_common_widget/button/app_button.dart';
import 'package:nephroscan/base/app_common_widget/custom_top_nav_bar/custom_top_nav_bar.dart';
import 'package:nephroscan/base/assets/assets.dart';
import 'package:nephroscan/base/utils/app_text_styles.dart';
import 'package:nephroscan/base/utils/ui_extension.dart';
import 'package:nephroscan/routes/auto_router.gr.dart';

import '../../base/utils/colors.dart';

@RoutePage()
class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool rememberMe = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomTopNavBar(leftWidget: SizedBox()),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: double.infinity,
                child: Image.asset(
                  PNGImages.profilePlaceholder,
                  width: 200,
                  height: 200,
                ),
              ),
              20.verticalBox,
              Text(
                'Sign in to your account',
                style: AppTextStyles.headlineMediumMontserrat.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                'Welcome back sign in to your account',
                style: AppTextStyles.labelLargeMontserrat.copyWith(
                  color: Theme.of(
                    context,
                  ).colorScheme.onPrimary.withValues(alpha: 0.5),
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              20.verticalBox,
              AppTextField.textField(
                context: context,
                name: 'email',
                hint: 'Email',
              ),
              10.verticalBox,
              AppTextField.textField(
                context: context,
                name: 'password',
                hint: 'Password',
                isObscured: true,
              ),
              10.verticalBox,
              Row(
                children: [
                  Checkbox(
                    value: rememberMe,
                    onChanged: (value) {
                      // Change remember me value
                      setState(() {
                        rememberMe = value ?? false;
                      });
                    },
                    checkColor: Theme.of(
                      context,
                    ).colorScheme.onSecondary.withValues(alpha: 0.5),
                    fillColor: WidgetStateProperty.resolveWith<Color>((states) {
                      if (states.contains(WidgetState.selected)) {
                        return Theme.of(
                          context,
                        ).colorScheme.onPrimary.withValues(alpha: 0.5);
                      }
                      return AppColors.transparent;
                    }),
                    activeColor: Theme.of(
                      context,
                    ).colorScheme.onSecondary.withValues(alpha: 0.5),
                  ),
                  Text(
                    'Remember me',
                    style: AppTextStyles.labelLargeMontserrat.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(
                        context,
                      ).colorScheme.onPrimary.withValues(alpha: 0.5),
                    ),
                  ),
                  Spacer(),
                  Text(
                    'Forgot Password?',
                    style: AppTextStyles.labelLargeMontserrat.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(
                        context,
                      ).colorScheme.onPrimary.withValues(alpha: 0.5),
                    ),
                  ),
                ],
              ),
              20.verticalBox,
              AppButton(
                title: 'Sign in',
                onClick: () => context.router.replaceAll([DashboardRoute()]),
              ),
              20.verticalBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 50,
                    child: Divider(
                      height: 2,
                      thickness: 2,
                      color: Theme.of(
                        context,
                      ).colorScheme.onPrimary.withValues(alpha: 0.2),
                    ),
                  ),
                  25.horizontalBox,
                  Text(
                    'or',
                    style: AppTextStyles.labelLargeMontserrat.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(
                        context,
                      ).colorScheme.onPrimary.withValues(alpha: 0.5),
                    ),
                  ),
                  25.horizontalBox,
                  SizedBox(
                    width: 50,
                    child: Divider(
                      height: 2,
                      thickness: 2,
                      color: Theme.of(
                        context,
                      ).colorScheme.onPrimary.withValues(alpha: 0.2),
                    ),
                  ),
                ],
              ),
              20.verticalBox,
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   mainAxisSize: MainAxisSize.max,
              //   children: [
              //     AppButton(
              //       title: '',
              //       width: 100,
              //       onClick: () {},
              //       backgroundColor: AppColors.textTertiaryLight,
              //       icon: Image.asset(PNGIcons.google, width: 20, height: 20),
              //     ),
              //   ],
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account? ",
                    style: AppTextStyles.labelLargeMontserrat.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(
                        context,
                      ).colorScheme.onPrimary.withValues(alpha: 0.5),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => context.router.replace(SignUpRoute()),
                    child: Text(
                      'Sign up',
                      style: AppTextStyles.labelLargeMontserrat.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).colorScheme.onSecondary,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
