import 'package:flutter/material.dart';
import 'package:ticketeer/core/components/static_elements/custom_container.dart';
import 'package:ticketeer/core/styles/app_color_scheme/app_color_scheme.dart';
import 'package:ticketeer/core/styles/custom_text_style.dart';

/// Badge that displays feature text and icon
class FeatureBadge extends StatelessWidget {
  /// Icon image
  final Image? imageIcon;

  /// Icon
  final Icon? icon;

  /// Text, displayed on the badge
  final String text;

  /// Badge that displays feature text and icon
  const FeatureBadge({
    super.key,
    this.imageIcon,
    required this.text,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColorScheme>()!;
    return CustomContainer(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
      child: Row(
        children: [
          imageIcon ?? icon ?? const SizedBox(),
          const SizedBox(
            width: 8,
          ),
          Expanded(
            child: Text(
              text,
              style: open.s14.copyWith(
                color: colors.fonts.main,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
