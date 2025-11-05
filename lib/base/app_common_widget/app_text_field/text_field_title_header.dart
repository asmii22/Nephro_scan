import 'package:flutter/material.dart';
import 'package:nephroscan/base/utils/strings.dart';
import 'package:nephroscan/theme/theme_context_extensions.dart';

import '../../utils/app_text_styles.dart';

class TextFieldHeaderTitleView extends StatelessWidget {
  const TextFieldHeaderTitleView({
    this.textStyle,
    this.title,
    this.isRequired = true,
    super.key,
  });

  final String? title;
  final bool isRequired;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: title != null,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 5),
        child: Row(
          children: [
            Expanded(
              child: Text(
                (title ?? '').localized,
                style: textStyle ?? AppTextStyles.bodyLargePoppins,
              ),
            ),
            isRequired
                ? Text(
                    '*',
                    style: context.textTheme.bodyLarge?.copyWith(
                      color: context.colorScheme.error,
                    ),
                  )
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
