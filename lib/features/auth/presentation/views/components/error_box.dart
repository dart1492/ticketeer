import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:ticketeer/core/styles/app_color_scheme/app_color_scheme.dart';
import 'package:ticketeer/core/styles/custom_text_style.dart';

/// Validation failure box which indicates that textfield validation is failed
class ErrorBox extends StatelessWidget {
  /// Text of the validation error
  final String errorText;

  /// Is this box shown
  final bool isShown;

  /// Validation failure box which indicates that textfield validation is failed
  const ErrorBox({
    super.key,
    required this.errorText,
    required this.isShown,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColorScheme>()!;
    return Container(
      height: 40,
      alignment: Alignment.centerLeft,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 200),
        child: !isShown
            ? Row(
                children: [
                  Icon(
                    FeatherIcons.alertTriangle,
                    size: 19,
                    color: colors.accents.red,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Text(
                      errorText,
                      style: open.s16.copyWith(
                        color: colors.accents.red,
                      ),
                    ),
                  ),
                ],
              )
            : null,
      ),
    );
  }
}
