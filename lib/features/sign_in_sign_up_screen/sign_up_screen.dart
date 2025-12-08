import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:nephroscan/base/app_common_widget/app_text_field/app_text_field.dart';
import 'package:nephroscan/base/app_common_widget/button/app_button.dart';
import 'package:nephroscan/base/app_common_widget/custom_top_nav_bar/custom_top_nav_bar.dart';
import 'package:nephroscan/base/utils/app_text_styles.dart';
import 'package:nephroscan/base/utils/ui_extension.dart';
import 'package:nephroscan/base/utils/utilities.dart';
import 'package:nephroscan/core_ui/custom_loading.dart';
import 'package:nephroscan/features/sign_in_sign_up_screen/cubit/user_sign_in_cubit/user_sign_in_cubit.dart';
import 'package:nephroscan/features/sign_in_sign_up_screen/data/models/user_model/user_model.dart';
import 'package:nephroscan/routes/auto_router.gr.dart';

import '../../base/utils/snackbar/snackbar_style.dart';
import '../../base/utils/strings.dart';

final _formKey = GlobalKey<FormBuilderState>();

@RoutePage()
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  UserRole? _userRole = UserRole.patient;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomTopNavBar(title: 'Sign Up', leftWidget: SizedBox()),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: BlocListener<UserSignInCubit, UserSignInState>(
            listener: (context, state) {
              log('📱 BlocListener received state: $state');
              state.maybeWhen(
                loading: () {
                  log('📱 BlocListener: Loading state - showing overlay');
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    CustomLoading().show(context);
                  });
                },
                signUp: () {
                  log(
                    '📱 BlocListener: SignUp state - hiding overlay and navigating',
                  );
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    CustomLoading().hide();
                    context.router.replaceAll([DashboardRoute()]);
                  });
                },
                error: (message) {
                  log('📱 BlocListener: Error state - message: $message');
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    CustomLoading().hide();
                    Utilities.showSnackBar(
                      context,
                      '$message',
                      SnackbarStyle.error,
                    );
                  });
                },
                orElse: () {
                  log('📱 BlocListener: Other state - hiding overlay');
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    CustomLoading().hide();
                  });
                },
              );
            },
            child: FormBuilder(
              key: _formKey,
              child: Column(
                children: [
                  AppTextField.textField(
                    context: context,
                    name: 'name',
                    hint: 'Name',
                    autocorrect: false,
                    textCapitalization: TextCapitalization.words,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(
                        errorText: 'Name is required',
                      ),
                      FormBuilderValidators.minLength(
                        2,
                        errorText: 'Name must be at least 2 characters',
                      ),
                    ]),
                  ),
                  10.verticalBox,
                  AppTextField.textField(
                    context: context,
                    name: 'email',
                    hint: 'Email',
                    autocorrect: false,
                    disablesEmojis: true,
                    textCapitalization: TextCapitalization.none,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(
                        errorText: 'Email is required',
                      ),
                      FormBuilderValidators.email(
                        errorText: 'Invalid email address',
                      ),
                    ]),
                  ),
                  10.verticalBox,
                  AppTextField.textField(
                    context: context,
                    name: 'address',
                    hint: 'Address',
                    autocorrect: false,
                    textCapitalization: TextCapitalization.words,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(
                        errorText: 'Address is required',
                      ),
                    ]),
                  ),
                  10.verticalBox,
                  RadioGroup<UserRole>(
                    groupValue: _userRole,
                    onChanged: (value) {
                      setState(() {
                        _userRole = value!;
                      });
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Radio<UserRole>(
                              value: UserRole.patient,
                              fillColor: WidgetStateProperty.resolveWith<Color>(
                                (states) {
                                  if (states.contains(WidgetState.selected)) {
                                    return Theme.of(context)
                                        .colorScheme
                                        .onPrimary; // selected circle color
                                  } else if (states.contains(
                                    WidgetState.disabled,
                                  )) {
                                    return Colors.grey; // disabled circle color
                                  } else if (states.contains(
                                    WidgetState.hovered,
                                  )) {
                                    return Colors.blue; // hovered circle color
                                  } else if (states.contains(
                                    WidgetState.selected,
                                  )) {
                                    return Theme.of(
                                      context,
                                    ).colorScheme.onPrimary;
                                  }

                                  return Theme.of(
                                    context,
                                  ).colorScheme.onPrimary;
                                },
                              ),
                            ),
                            Text(
                              'Patient',
                              style: AppTextStyles.bodyMediumPoppins,
                            ),
                            Radio<UserRole>(
                              value: UserRole.doctor,
                              fillColor: WidgetStateProperty.resolveWith<Color>(
                                (states) {
                                  if (states.contains(WidgetState.selected)) {
                                    return Theme.of(context)
                                        .colorScheme
                                        .onPrimary; // selected circle color
                                  } else if (states.contains(
                                    WidgetState.disabled,
                                  )) {
                                    return Colors.grey; // disabled circle color
                                  } else if (states.contains(
                                    WidgetState.hovered,
                                  )) {
                                    return Colors.blue; // hovered circle color
                                  } else if (states.contains(
                                    WidgetState.selected,
                                  )) {
                                    return Theme.of(
                                      context,
                                    ).colorScheme.onPrimary;
                                  }

                                  return Theme.of(
                                    context,
                                  ).colorScheme.onPrimary;
                                },
                              ),
                            ),
                            Text(
                              'Doctor',
                              style: AppTextStyles.bodyMediumPoppins,
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
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(
                              errorText: 'Phone number is required',
                            ),
                            FormBuilderValidators.numeric(
                              errorText: 'Only numbers allowed',
                            ),
                            FormBuilderValidators.minLength(
                              10,
                              errorText: 'Phone number must be 10 digits',
                            ),
                            FormBuilderValidators.maxLength(
                              10,
                              errorText: 'Phone number must be 10 digits',
                            ),
                          ]),
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
                    autocorrect: false,
                    disablesEmojis: true,
                    textCapitalization: TextCapitalization.none,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(
                        errorText: 'Password is required',
                      ),
                      FormBuilderValidators.minLength(
                        6,
                        errorText: 'Password must be at least 6 characters',
                      ),
                    ]),
                  ),
                  10.verticalBox,
                  AppTextField.textField(
                    context: context,
                    name: 'confirmPassword',
                    hint: 'Confirm Password',
                    isObscured: true,
                    autocorrect: false,
                    disablesEmojis: true,
                    textCapitalization: TextCapitalization.none,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(
                        errorText: 'Please confirm your password',
                      ),
                      (val) {
                        if (val !=
                            _formKey.currentState?.fields['password']?.value) {
                          return 'Passwords do not match';
                        }
                        return null;
                      },
                    ]),
                  ),

                  40.verticalBox,
                  AppButton(
                    title: 'Sign up',
                    onClick: () {
                      log('🟢 Sign up button clicked');
                      if (_formKey.currentState!.saveAndValidate()) {
                        final name =
                            _formKey.currentState?.fields['name']?.value;
                        final email =
                            _formKey.currentState?.fields['email']?.value;
                        final address =
                            _formKey.currentState?.fields['address']?.value;
                        final phoneNumber =
                            _formKey.currentState?.fields['phoneNumber']?.value;
                        final password =
                            _formKey.currentState?.fields['password']?.value;

                        if (email == null || password == null) {
                          log('❌ Email or password is null');
                          return;
                        }

                        log('🟢 Calling signUpUser with email: $email');

                        // Create user model
                        final userModel = UserModel(
                          id: '', // Will be set by Firebase
                          email: email,
                          name: name,
                          phoneNumber: phoneNumber != null
                              ? '+977$phoneNumber'
                              : null,
                          address: address,
                          role: _userRole, // Default role
                          profilePicture: null,
                        );

                        context.read<UserSignInCubit>().signUpUser(
                          email: email,
                          password: password,
                          userModel: userModel,
                        );
                      } else {
                        log('❌ Form validation failed');
                      }
                    },
                  ),

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
                          context.router.replace(SignInRoute());
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
        ),
      ),
    );
  }
}
