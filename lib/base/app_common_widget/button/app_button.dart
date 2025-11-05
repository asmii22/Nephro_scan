import 'package:flutter/material.dart';
import 'package:nephroscan/base/utils/strings.dart';
import 'package:nephroscan/theme/theme_context_extensions.dart';

import '../../utils/app_text_styles.dart';
import 'app_button_decorator.dart';
import 'app_button_state.dart';

class AppButton extends StatelessWidget {
  AppButton({
    required String title,
    required Function? onClick,
    AppButtonState appButtonState = AppButtonState.enabled,
    Color? backgroundColor,
    Color? textColor,
    double height = 50,
    double radius = 25,
    double elevation = 2,
    double fontSize = 16.0,
    double? width,
    AppButtonDecorator? button,
    BorderSide? border,
    EdgeInsets? padding,
    Widget? icon,
    bool hasUnderline = false,
    bool hasGradientBorder = false,
    bool hasGradientBackground = false,
    bool addIconAfterText = false,
    this.titleStyle,
    super.key,
  }) : _title = title,
       _appButtonState = appButtonState,
       _backgroundColor = backgroundColor,
       _textColor = textColor,
       _height = height,
       _radius = radius,
       _elevation = elevation,
       _fontSize = fontSize,
       _button = button,
       _onClick = onClick,
       _icon = icon,
       _border = border,
       _padding = padding,
       _hasUnderline = hasUnderline,
       _width = width,
       _hasGradientBorder = hasGradientBorder,
       _hasGradientBackground = hasGradientBackground,
       _addIconAfterText = addIconAfterText;
  final String _title;
  final AppButtonState _appButtonState;
  final Function? _onClick;
  final Color? _backgroundColor;
  final Color? _textColor;
  final double _height;
  final double? _width;
  final double _radius;
  final double _elevation;
  final double _fontSize;
  AppButtonDecorator? _button;
  final BorderSide? _border;
  final Widget? _icon;
  final EdgeInsets? _padding;
  final bool _hasUnderline;
  final bool _hasGradientBorder;
  final bool _hasGradientBackground;
  final bool _addIconAfterText;

  final TextStyle? titleStyle;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: _appButtonState.opacity,
      child: MaterialButton(
        padding: _padding ?? EdgeInsets.zero,
        onPressed: _appButtonState == AppButtonState.disabled
            ? null
            : _onButtonClick,
        shape: RoundedRectangleBorder(
          side: _border ?? BorderSide.none,
          borderRadius: BorderRadius.circular(_radius),
        ),
        focusColor:
            (_button?.getBackgroundColor(context, _appButtonState) ??
                _backgroundColor) ??
            Theme.of(context).colorScheme.onPrimary,
        hoverColor:
            (_button?.getBackgroundColor(context, _appButtonState) ??
                _backgroundColor) ??
            Theme.of(context).colorScheme.onPrimary,
        height: _height,
        elevation: _elevation == 0
            ? 0
            : (_appButtonState != AppButtonState.disabled ? 2.0 : _elevation),
        color:
            (_button?.getBackgroundColor(context, _appButtonState) ??
                _backgroundColor) ??
            Theme.of(context).colorScheme.onPrimary,
        textColor:
            _button?.getTitleColor(context, _appButtonState) ??
            context.colorScheme.primary,
        disabledColor:
            (_button?.getBackgroundColor(context, AppButtonState.disabled) ??
                _backgroundColor) ??
            Theme.of(context).colorScheme.onPrimary,
        disabledTextColor:
            _button?.getTitleColor(context, AppButtonState.disabled) ??
            Theme.of(context).colorScheme.primary,
        minWidth: _width ?? double.infinity,
        focusElevation: 0,
        hoverElevation: 0,
        highlightElevation: 0,
        splashColor: Colors.transparent,
        highlightColor:
            (_button?.getBackgroundColor(context, AppButtonState.tapped) ??
                _backgroundColor) ??
            Theme.of(context).colorScheme.onPrimary,
        enableFeedback: false,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(_radius),
          child: SizedBox(
            width: _width ?? double.infinity,
            height: _height,
            child: Stack(
              children: [
                Visibility(
                  visible: _hasGradientBorder || _hasGradientBackground,
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        stops: [0.2, 0.4, 0.8],
                        colors: [
                          Color.fromRGBO(3, 162, 177, 0.95),
                          Color.fromRGBO(99, 162, 178, 1),
                          Color.fromRGBO(195, 162, 179, 0.93),
                        ],
                      ),
                    ),
                  ),
                ),
                Visibility(
                  visible: !_hasGradientBackground,
                  child: Container(
                    margin: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(_radius),
                      color:
                          _backgroundColor ??
                          Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (_icon != null && !_addIconAfterText) _icon,
                      if (_icon != null && !_addIconAfterText)
                        const SizedBox(width: 4),
                      Text(
                        _title.localized,
                        style:
                            titleStyle ??
                            AppTextStyles.labelLargePoppins.copyWith(
                              fontWeight: FontWeight.w600,
                              fontSize: _fontSize,
                              color: (_textColor == null)
                                  ? _button?.getTitleColor(
                                          context,
                                          _appButtonState,
                                        ) ??
                                        Theme.of(context).colorScheme.primary
                                  : _textColor,
                              decoration: _hasUnderline
                                  ? TextDecoration.underline
                                  : null,
                            ),
                      ),
                      if (_icon != null && _addIconAfterText)
                        const SizedBox(width: 4),
                      if (_icon != null && _addIconAfterText) _icon,
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onButtonClick() {
    _onClick?.call();
  }
}
