import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:nephroscan/base/app_common_widget/app_text_field/text_field_title_header.dart';
import 'package:nephroscan/base/utils/strings.dart';
import 'package:nephroscan/theme/theme_context_extensions.dart';

import '../../utils/app_styles.dart';
import '../../utils/app_text_styles.dart';
import '../../utils/colors.dart';

class AppTextField {
  AppTextField._();

  static Widget textField({
    required BuildContext context,
    String? Function(String)? validator,
    required String name,
    TextStyle? style,
    bool? autocorrect,
    TextEditingController? textEditingController,
    String? hint,
    Color? backgroundColor = AppColors.white,
    Function(String?)? onTextChanged,
    Function(String?)? onFieldSubmitted,
    Function()? onTap,
    TextInputType keyboardType = TextInputType.text,
    TextInputAction textInputAction = TextInputAction.done,
    TextCapitalization textCapitalization = TextCapitalization.sentences,
    Function? onObscureTapped,
    bool isPasswordField = false,
    bool isObscured = false,
    bool disablesEmojis = true,
    bool readOnly = false,
    int? maxLines = 1,
    int maxLength = 255,
    double verticalPadding = 10,
    bool isDisabled = false,
    bool isRequired = false,
    List<TextInputFormatter>? inputFormatters,
    String? headerTitle,
    Widget? suffixIcon,
    Widget? prefixIcon,
    FocusNode? focusNode,
    TextStyle? headerStyle,
    TextStyle? hintStyle,
    double borderRadius = 15.0,
    Color? textColor,
    Color? borderColor,
    bool hasError = false,
    // TextEditingController? controller,
    String? initialValue,
    bool isTextFieldOnly = false,
  }) {
    final formatters = <TextInputFormatter>[];
    if (disablesEmojis) {
      formatters.add(
        FilteringTextInputFormatter.deny(
          RegExp(
            '''
(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])''',
          ),
        ),
      );
    }
    inputFormatters?.forEach(formatters.add);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (!isTextFieldOnly)
          TextFieldHeaderTitleView(
            isRequired: isRequired,
            title: headerTitle,
            textStyle: headerStyle ?? AppTextStyles.bodyLargePoppins,
          ),
        FormBuilderTextField(
          initialValue: initialValue,
          controller: textEditingController,
          onTapOutside: (event) =>
              FocusManager.instance.primaryFocus?.unfocus(),
          name: name,
          maxLines: maxLines,
          style:
              style ??
              AppTextStyles.labelLargeMontserrat.copyWith(
                color: textColor ?? context.colorScheme.onPrimary,
                fontSize: 14,
              ),

          // style: AppStyles.textFieldTextStyle(
          //     color: textColor ?? context.colorScheme.secondary),
          validator: (value) => validator?.call(value ?? ''),
          onChanged: onTextChanged,
          focusNode: focusNode,
          obscureText: isObscured,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          onSubmitted: onFieldSubmitted,
          textCapitalization: textCapitalization,
          autocorrect: autocorrect ?? false,
          onTap: onTap,
          readOnly: isDisabled,
          inputFormatters: formatters,
          decoration: InputDecoration(
            fillColor: isDisabled
                ? AppColors.grey.withValues(alpha: 0.3)
                : AppColors.transparent,
            contentPadding: const EdgeInsets.only(
              left: 20,
              top: 16,
              bottom: 16,
            ),
            filled: true,
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
            hintText: (hint ?? '').localized,
            alignLabelWithHint: true,
            hintStyle:
                hintStyle ??
                AppTextStyles.labelLargeMontserrat.copyWith(
                  color:
                      textColor ??
                      context.colorScheme.onPrimary.withValues(alpha: 0.5),
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
            labelStyle: context.textTheme.labelSmall?.copyWith(
              color: context.colorScheme.secondary,
            ),
            border: AppStyles.outlinedInputBorder(
              hasValidationError: hasError,
              borderRadius: borderRadius,
              borderColor: borderColor ?? context.colorScheme.secondary,
            ),
            enabledBorder: AppStyles.outlinedInputBorder(
              hasValidationError: hasError,
              borderRadius: borderRadius,
              borderColor: borderColor ?? context.colorScheme.secondary,
            ),
            focusedBorder: AppStyles.outlinedInputBorder(
              hasValidationError: hasError,
              borderRadius: borderRadius,
              borderColor: borderColor ?? context.colorScheme.secondary,
            ),
          ),
        ),
      ],
    );
  }
}
