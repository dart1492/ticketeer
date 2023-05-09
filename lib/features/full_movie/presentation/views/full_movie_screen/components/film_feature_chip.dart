import 'package:flutter/material.dart';
import 'package:ticketeer/core/styles/app_color_scheme/app_color_scheme.dart';
import 'package:ticketeer/core/styles/custom_text_style.dart';

/// Chip to display some piece of info about the movie
class MovieFeatureChip extends StatelessWidget {
  /// Chip to display some piece of info about the movie
  const MovieFeatureChip({
    super.key,
    required this.text,
  });

  /// Displayed text
  final String text;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColorScheme>()!;

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: colors.components.blocks.border,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        text,
        style: roboto.s14.copyWith(
          color: colors.fonts.main,
        ),
      ),
    );
  }
}
