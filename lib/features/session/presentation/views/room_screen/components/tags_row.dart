import 'package:flutter/material.dart';
import 'package:ticketeer/core/styles/app_color_scheme/app_color_scheme.dart';
import 'package:ticketeer/core/styles/custom_text_style.dart';

/// Row with tags
class TagsRow extends StatelessWidget {
  /// Row with tags
  const TagsRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColorScheme>()!;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                border: Border.all(
                  color: colors.components.blocks.border,
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              "Taken",
              style: open.s14.copyWith(
                color: colors.fonts.main,
              ),
            ),
          ],
        ),
        Column(
          children: [
            Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                color: colors.accents.blue,
                border: Border.all(
                  color: colors.components.blocks.border,
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              "Normal",
              style: open.s14.copyWith(
                color: colors.fonts.main,
              ),
            ),
          ],
        ),
        Column(
          children: [
            Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                color: colors.accents.gold,
                border: Border.all(
                  color: colors.components.blocks.border,
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              "Better",
              style: open.s14.copyWith(
                color: colors.fonts.main,
              ),
            ),
          ],
        ),
        Column(
          children: [
            Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                color: colors.accents.red,
                border: Border.all(
                  color: colors.components.blocks.border,
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              "Vip",
              style: open.s14.copyWith(
                color: colors.fonts.main,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
