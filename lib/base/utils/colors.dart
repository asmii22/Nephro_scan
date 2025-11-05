import 'package:flutter/material.dart';

class AppColors {
  AppColors._();
  // Common Colors
  static const transparent = Colors.transparent;
  static const white = Colors.white;
  static const black = Colors.black;
  static const grey = Color(0xFFB0B0B0);
  static const lightWhite = Color(0xffF5F5F5);

  // Dark Theme Colors
  static const Color primaryDark = Color(0xFF1E1E1E); // Main background
  static const Color secondaryDark = Color(
    0xFF2A2A2A,
  ); // Card / elevated surfaces
  static const Color tertiaryDark = Color(
    0xFF3A3A3A,
  ); // Slightly lighter surface

  static const Color accentDark = Color(
    0xFFFFC107,
  ); // Accent / highlight (e.g. discount tags)
  static const Color successDark = Color(
    0xFF4CAF50,
  ); // Success (e.g. checkmark)
  static const Color errorDark = Color(0xFFF44336); // Error states
  static const Color warningDark = Color(0xFFFF9800); // Warnings

  // Text Colors
  static const Color textPrimaryDark = Color(0xFFFFFFFF); // Main text
  static const Color textSecondaryDark = Color(0xFFB0B0B0); // Sub text
  static const Color textTertiaryDark = Color(0xFF8A8A8A); // Hints / captions

  // Border & Divider
  static const Color borderDark = Color(0xFF3C3C3C);
  static const Color dividerDark = Color(0xFF2E2E2E);

  // Light Theme Colors
  static const Color primaryLight = Color(0xFFFFFFFF); // Main background
  static const Color secondaryLight = Color(
    0xFFF7D7D7,
  ); // Card / elevated surfaces
  static const Color tertiaryLight = Color(
    0xFFEAEAEA,
  ); // Slightly darker surface

  static const Color accentLight = Color(0xFFFFC107); // Accent / highlight
  static const Color successLight = Color(0xFF4CAF50); // Success
  static const Color errorLight = Color(0xFFF44336); // Error
  static const Color warningLight = Color(0xFFFF9800); // Warning

  // Text Colors
  static const Color textPrimaryLight = Color(0xFF000000); // Main text
  static const Color textSecondaryLight = Color(0xFF5A5A5A); // Sub text
  static const Color textTertiaryLight = Color(0xFF8A8A8A); // Hints / captions

  // Border & Divider
  static const Color borderLight = Color(0xFF8A8A8A);
  static const Color dividerLight = Color(0xFFD6D6D6);
}
