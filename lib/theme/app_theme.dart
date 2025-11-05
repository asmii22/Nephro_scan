import 'package:flutter/material.dart';

import '../base/utils/colors.dart';

enum AppTheme { light, dark, system }

class AppThemes {
  // Light Theme
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: AppColors.primaryLight,
      onPrimary: AppColors.textPrimaryLight,
      secondary: AppColors.secondaryLight,
      onSecondary: AppColors.textPrimaryLight,
      error: AppColors.errorLight,
      onError: AppColors.textPrimaryLight,
      surface: AppColors.secondaryLight,
      onSurface: AppColors.textPrimaryLight,
      tertiary: AppColors.tertiaryLight,
      onTertiary: AppColors.textTertiaryLight,
    ),

    scaffoldBackgroundColor: AppColors.primaryLight,

    // App Bar
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.accentLight,
      foregroundColor: AppColors.textPrimaryLight,
      centerTitle: true,
    ),

    // Buttons
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.accentLight,
        foregroundColor: AppColors.textPrimaryLight,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        textStyle: const TextStyle(fontWeight: FontWeight.bold),
      ),
    ),

    // Snack-bar
    snackBarTheme: const SnackBarThemeData(
      backgroundColor: AppColors.secondaryLight,
      contentTextStyle: TextStyle(color: AppColors.textPrimaryLight),
      behavior: SnackBarBehavior.floating,
    ),

    // Date Picker
    datePickerTheme: const DatePickerThemeData(
      backgroundColor: AppColors.primaryLight,
      headerBackgroundColor: AppColors.accentLight,
      headerForegroundColor: AppColors.textPrimaryLight,
    ),

    // Radio
    radioTheme: RadioThemeData(
      fillColor: WidgetStateProperty.all(AppColors.accentLight),
    ),

    // Checkbox
    checkboxTheme: CheckboxThemeData(
      fillColor: WidgetStateProperty.all(AppColors.accentLight),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    ),

    // Switch
    switchTheme: SwitchThemeData(
      thumbColor: WidgetStateProperty.all(AppColors.accentLight),
      trackColor: WidgetStateProperty.all(
        AppColors.accentLight.withValues(alpha: 0.5),
      ),
    ),
  );

  // Dark Theme
  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary: AppColors.primaryDark,
      onPrimary: AppColors.textPrimaryDark,
      secondary: AppColors.secondaryDark,
      onSecondary: AppColors.textPrimaryDark,
      error: AppColors.errorDark,
      onError: AppColors.textPrimaryDark,
      surface: AppColors.secondaryDark,
      onSurface: AppColors.textPrimaryDark,
      tertiary: AppColors.tertiaryDark,
      onTertiary: AppColors.textTertiaryDark,
    ),

    scaffoldBackgroundColor: AppColors.primaryDark,

    // App Bar
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.accentDark,
      foregroundColor: AppColors.textPrimaryDark,
      centerTitle: true,
    ),

    // Buttons
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.accentDark,
        foregroundColor: AppColors.textPrimaryDark,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        textStyle: const TextStyle(fontWeight: FontWeight.bold),
      ),
    ),

    // Snack bar
    snackBarTheme: const SnackBarThemeData(
      backgroundColor: AppColors.secondaryDark,
      contentTextStyle: TextStyle(color: AppColors.textPrimaryDark),
      behavior: SnackBarBehavior.floating,
    ),

    // Date Picker
    datePickerTheme: const DatePickerThemeData(
      backgroundColor: AppColors.primaryDark,
      headerBackgroundColor: AppColors.accentDark,
      headerForegroundColor: AppColors.textPrimaryDark,
    ),

    // Radio
    radioTheme: RadioThemeData(
      fillColor: WidgetStateProperty.all(AppColors.accentDark),
    ),

    // Checkbox
    checkboxTheme: CheckboxThemeData(
      fillColor: WidgetStateProperty.all(AppColors.accentDark),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    ),

    // Switch
    switchTheme: SwitchThemeData(
      thumbColor: WidgetStateProperty.all(AppColors.accentDark),
      trackColor: WidgetStateProperty.all(
        AppColors.accentDark.withValues(alpha: 0.5),
      ),
    ),
  );
}
