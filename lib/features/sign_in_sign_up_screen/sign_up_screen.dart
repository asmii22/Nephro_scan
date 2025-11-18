import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:nephroscan/base/app_common_widget/app_text_field/app_text_field.dart';
import 'package:nephroscan/base/app_common_widget/button/app_button.dart';
import 'package:nephroscan/base/app_common_widget/custom_top_nav_bar/custom_top_nav_bar.dart';
import 'package:nephroscan/base/utils/app_text_styles.dart';
import 'package:nephroscan/base/utils/ui_extension.dart';
import 'package:nephroscan/routes/auto_router.gr.dart';

enum Gender { male, female }

@RoutePage()
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  Gender? _gender = Gender.male;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomTopNavBar(title: 'Sign Up', leftWidget: SizedBox()),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsGeometry.all(20),
          child: Column(
            children: [
              AppTextField.textField(
                context: context,
                name: 'name',
                hint: 'Name',
              ),
              10.verticalBox,
              AppTextField.textField(
                context: context,
                name: 'email',
                hint: 'Email',
              ),
              10.verticalBox,
              AppTextField.textField(
                context: context,
                name: 'address',
                hint: 'Address',
              ),

              10.verticalBox,
              // radio button for male and female option
              // radio button for male and female option
              RadioGroup<Gender>(
                groupValue: _gender,
                onChanged: (Gender? value) {
                  setState(() {
                    _gender = value!;
                  });
                },
                child: Row(
                  children: [
                    Row(
                      children: [
                        Radio<Gender>(
                          value: Gender.male,
                          activeColor: Theme.of(context).colorScheme.onPrimary,
                          focusColor: Theme.of(context).colorScheme.onPrimary,
                        ),
                        Text(
                          'Male',
                          style: AppTextStyles.labelLargeMontserrat.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Radio<Gender>(
                          value: Gender.female,
                          activeColor: Theme.of(context).colorScheme.onPrimary,
                          focusColor: Theme.of(context).colorScheme.onPrimary,
                        ),
                        Text(
                          'Female',
                          style: AppTextStyles.labelLargeMontserrat.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              10.verticalBox,
              Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: AppTextField.textField(
                      context: context,
                      name: 'countryCode',
                      hint: '+977',
                      isDisabled: true,
                    ),
                  ),
                  5.horizontalBox,
                  Flexible(
                    flex: 4,
                    child: AppTextField.textField(
                      context: context,
                      name: 'phoneNumber',
                      hint: 'Phone Number',
                    ),
                  ),
                ],
              ),
              10.verticalBox,

              AppTextField.textField(
                context: context,
                name: 'password',
                isObscured: true,
                hint: 'Password',
              ),
              10.verticalBox,

              AppTextField.textField(
                context: context,
                name: 'confirmPassword',
                hint: 'Confirm Password',
                isObscured: true,
              ),

              40.verticalBox,
              AppButton(title: 'Sign up', onClick: () {}),

              30.verticalBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account? ',
                    style: AppTextStyles.bodyLargePoppins,
                  ),
                  InkWell(
                    onTap: () {
                      AutoRouter.of(context).replace(SignInRoute());
                    },
                    child: Text(
                      'Sign In',
                      style: AppTextStyles.bodyLargePoppins.copyWith(
                        decoration: TextDecoration.underline,
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
