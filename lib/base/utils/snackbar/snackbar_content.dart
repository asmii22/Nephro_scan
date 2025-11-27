import 'package:flutter/material.dart';
import 'package:nephroscan/base/utils/snackbar/snackbar_style.dart';

class SnackBarContent extends StatelessWidget {
  const SnackBarContent({
    required this.message,
    required this.style,
    this.dynamicContent,
    this.dynamicBackgroundColor,
    super.key,
  });
  final String message;
  final SnackbarStyle style;
  final Widget? dynamicContent;
  final Color? dynamicBackgroundColor;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: dynamicBackgroundColor ?? style.displayBackgroundColor(context),
        borderRadius: BorderRadius.circular(15),
      ),
      child:
          dynamicContent ??
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 18, top: 10, bottom: 10),
                  child: Text(
                    message,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: style.displayTitleColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: style != SnackbarStyle.validationError,
                child: IconButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  },
                  icon: Icon(Icons.close, color: style.displayTitleColor),
                ),
              ),
            ],
          ),
    );
  }
}
