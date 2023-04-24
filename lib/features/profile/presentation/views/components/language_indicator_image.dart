import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ticketeer/core/constants/object_constants.dart';
import 'package:ticketeer/core/styles/app_color_scheme/app_color_scheme.dart';

/// Image that gets shown depending on current locale
class LanguageIndicatorImage extends StatelessWidget {
  /// Image that gets shown depending on current locale
  const LanguageIndicatorImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColorScheme>()!;

    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: colors.components.blocks.background,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: colors.components.blocks.border,
        ),
      ),
      child: Builder(
        builder: (context) {
          if (context.locale == englishLocale) {
            return Container(
              height: 100,
              width: 100,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('assets/english.gif'),
                ),
              ),
            );
          } else {
            return Container(
              height: 100,
              width: 100,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('assets/ukrainian.gif'),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
