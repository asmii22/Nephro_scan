import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

extension ThemeContextExtensions on BuildContext {
  ThemeData get theme => Theme.of(this);

  // Text theme
  TextTheme get textTheme => Theme.of(this).textTheme;

  // Color scheme
  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  // Cupertino theme
  CupertinoThemeData get cupertinoTheme => CupertinoTheme.of(this);
}
