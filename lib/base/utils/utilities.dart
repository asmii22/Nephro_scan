import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nephroscan/base/base.dart';
import 'package:nephroscan/base/utils/snackbar/snackbar_content.dart';
import 'package:nephroscan/base/utils/snackbar/snackbar_style.dart';
import 'package:nephroscan/theme/theme_context_extensions.dart';

class Utilities {
  static OverlayEntry? _currentOverlay;

  static bool isAndroid() {
    return defaultTargetPlatform == TargetPlatform.android;
  }

  static void dismissKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  static void showSnackBar(
    BuildContext context,
    String message,
    SnackbarStyle style, {
    double? left,
    double? right,
    double? top,
  }) {
    if (message.isEmpty) {
      return;
    }
    _showOverlay(
      context,
      text: message,
      style: style,
      left: left,
      right: right,
      top: top,
    );
  }

  static Future<void> _showOverlay(
    BuildContext context, {
    required String text,
    required SnackbarStyle style,
    double? left,
    double? right,
    double? top,
  }) async {
    final overlayState = Overlay.of(context);
    OverlayEntry overlayEntry;
    overlayEntry = OverlayEntry(
      builder: (context) {
        return Positioned(
          left: left ?? 30,
          right: right ?? 30,
          top: top ?? 100,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Material(
              child: SnackBarContent(message: text, style: style),
            ),
          ),
        );
      },
    );
    // inserting overlay entry
    overlayState.insert(overlayEntry);
    await Future.delayed(const Duration(seconds: 4))
    // removing overlay entry after stipulated time.
    .whenComplete(() => overlayEntry.remove());
  }

  static void showBottomSheet({
    required Widget widget,
    required BuildContext context,
    Color? backgroundColor,
    bool isDismissable = true,
  }) {
    showModalBottomSheet(
      backgroundColor: backgroundColor ?? AppColors.transparent,
      isDismissible: isDismissable,
      barrierColor: context.theme.bottomSheetTheme.modalBarrierColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
      ),
      context: context,
      isScrollControlled: true, // Necessary for keyboard handling
      enableDrag: isDismissable,
      builder: (context) {
        return Padding(
          padding: MediaQuery.of(context).viewInsets, // Adjust for keyboard
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                10.verticalBox,
                Divider(
                  color: AppColors.black.withValues(alpha: 0.8),
                  thickness: 3,
                  indent: 140,
                  endIndent: 140,
                ),
                widget,
              ],
            ),
          ),
        );
      },
    );
  }

  static void showCustomSnackbar({
    required BuildContext context,
    required Widget child,
    Duration duration = const Duration(seconds: 3),
  }) {
    // If there's an existing overlay, remove it
    if (_currentOverlay != null) return;
    // Create an OverlayEntry
    final overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        bottom: 10.0, // Margin from the bottom
        left: 10.0, // Margin from the left
        right: 10.0, // Margin from the right
        child: Material(
          color: Colors.transparent, // Transparent background
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 10.0,
                sigmaY: 10.0,
              ), // Blur effect
              child: Container(
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(
                    0.5,
                  ), // Semi-transparent black color
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: child,
              ),
            ),
          ),
        ),
      ),
    );

    // Insert the OverlayEntry
    Overlay.of(context).insert(overlayEntry);
    _currentOverlay = overlayEntry;

    // Remove the OverlayEntry after the specified duration
    Future.delayed(duration, () {
      overlayEntry.remove();
      _currentOverlay = null;
    });
  }

  static Future<void> showCustomDialog({
    required BuildContext context,
    required String title,
    required String description,
    required String okText,
    required VoidCallback onOk,
    String? cancelText,
    VoidCallback? onCancel,
  }) async {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title, style: context.theme.textTheme.titleLarge),
          content: Text(description, style: context.theme.textTheme.bodyMedium),
          actions: [
            if (cancelText != null)
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  if (onCancel != null) onCancel();
                },
                child: Text(cancelText),
              ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                onOk();
              },
              child: Text(
                okText,
                style: TextStyle(color: context.colorScheme.primary),
              ),
            ),
          ],
        );
      },
    );
  }

  static void showTopSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.green,
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.only(top: 300, left: 20, right: 20),
        elevation: 10,
      ),
    );
  }
}
