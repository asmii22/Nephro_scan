import 'package:flutter/material.dart';

import 'colors.dart';

class AppStyles {
  AppStyles._();

  static OutlineInputBorder outlinedInputBorder({
    bool hasValidationError = false,
    bool hasMandatoryBorder = false,
    Color borderColor = AppColors.transparent,
    double borderRadius = 16.0,
  }) => OutlineInputBorder(
    borderSide: BorderSide(
      width: hasMandatoryBorder ? 2.0 : (hasValidationError ? 2.0 : 2.0),
      color: hasValidationError ? AppColors.errorDark : borderColor,
    ),
    borderRadius: BorderRadius.circular(borderRadius),
  );

  static OutlineInputBorder textViewBorder() => OutlineInputBorder(
    borderSide: const BorderSide(width: 3, color: AppColors.transparent),
    borderRadius: BorderRadius.circular(0),
  );

  static BorderSide borderSide() =>
      BorderSide(color: AppColors.borderDark, width: 5);
  static Border verticalAppBorder() => Border(
    top: BorderSide(color: AppColors.borderDark, width: 5),
    bottom: BorderSide(color: AppColors.borderDark, width: 5),
  );
  static Border bottomAppBorder() =>
      Border(bottom: BorderSide(color: AppColors.borderDark, width: 5));
}
