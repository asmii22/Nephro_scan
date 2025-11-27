import 'package:flutter/material.dart';

import '../colors.dart';

enum SnackbarStyle { error, success, normal, validationError }

extension SnackbarStyleExtension on SnackbarStyle {
  Color get displayTitleColor {
    switch (this) {
      case SnackbarStyle.error:
        return AppColors.white;
      case SnackbarStyle.success:
        return AppColors.white;
      case SnackbarStyle.normal:
        return AppColors.white;
      case SnackbarStyle.validationError:
        return AppColors.white;
    }
  }

  Color displayBackgroundColor(BuildContext context) {
    switch (this) {
      case SnackbarStyle.error:
        return AppColors.errorDark;
      case SnackbarStyle.success:
        return AppColors.successDark;
      case SnackbarStyle.normal:
        return Theme.of(context).colorScheme.primary;
      case SnackbarStyle.validationError:
        return AppColors.warningDark;
    }
  }
}
