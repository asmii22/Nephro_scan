import 'package:flutter/material.dart';
import 'package:nephroscan/base/utils/strings.dart';

import '../../utils/app_text_styles.dart';

class CustomTopNavBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? leftWidget;
  final String? title;
  final Widget? centerWidget;
  final Widget? rightWidget;
  final Color? backgroundColor;
  final VoidCallback? onBackPressed;
  final double height;

  // Text customization
  final TextStyle? titleStyle;
  final FontWeight? fontWeight;
  final double? fontSize;
  final double? letterSpacing;
  final double? fontHeight;
  final Color? fontColor;
  final TextAlign titleAlignment;
  final TextOverflow textOverflow;
  final int? maxLines;

  // Layout customization
  final EdgeInsetsGeometry? contentPadding;
  final EdgeInsetsGeometry? titlePadding;
  final bool showDivider;
  final Color? dividerColor;

  // Safe area
  final bool useSafeArea;

  const CustomTopNavBar({
    super.key,
    this.leftWidget,
    this.title,
    this.centerWidget,
    this.rightWidget,
    this.backgroundColor,
    this.onBackPressed,
    this.height = 56.0,
    this.fontWeight,
    this.fontSize,
    this.letterSpacing,
    this.fontHeight,
    this.fontColor,
    this.titleStyle,
    this.titleAlignment = TextAlign.left,
    this.textOverflow = TextOverflow.ellipsis,
    this.maxLines = 1,
    this.contentPadding,
    this.titlePadding,
    this.showDivider = false,
    this.dividerColor,
    this.useSafeArea = true,
  });

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = Theme.of(context).colorScheme;

    final effectiveBackground = backgroundColor ?? Colors.transparent;

    // Default text style using your theme system
    final textStyle =
        titleStyle ??
        AppTextStyles.labelLargePoppins.copyWith(
          fontWeight: fontWeight ?? FontWeight.w600,
          fontSize: fontSize ?? 18,
          height: fontHeight,
          letterSpacing: letterSpacing,
          color: fontColor ?? colorScheme.onPrimary,
        );

    final content = Container(
      height: height,
      color: effectiveBackground,
      padding: contentPadding ?? const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // LEFT SECTION — Back button or custom widget
                leftWidget ??
                    IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios_new,
                        size: 20,
                        color: colorScheme.onPrimary,
                      ),
                      onPressed:
                          onBackPressed ??
                          () => Navigator.of(context).maybePop(),
                    ),

                // CENTER SECTION — Title or custom widget
                Expanded(
                  child: Padding(
                    padding:
                        titlePadding ??
                        const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child:
                          centerWidget ??
                          (title != null
                              ? Text(
                                  title!.localized,
                                  textAlign: titleAlignment,
                                  maxLines: maxLines,
                                  overflow: textOverflow,
                                  style: textStyle,
                                )
                              : const SizedBox.shrink()),
                    ),
                  ),
                ),

                // RIGHT SECTION — Optional widget
                rightWidget ?? const SizedBox(width: 40),
              ],
            ),
          ),

          // Optional Divider
          if (showDivider)
            Divider(
              height: 1,
              thickness: 1,
              color: dividerColor ?? colorScheme.outline.withOpacity(0.2),
            ),
        ],
      ),
    );

    // Wrap with SafeArea if required
    return useSafeArea ? SafeArea(child: content) : content;
  }
}
