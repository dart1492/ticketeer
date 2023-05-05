import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ticketeer/core/components/buttons/custom_default_button.dart';
import 'package:ticketeer/core/components/buttons/custom_highlighted_button.dart';
import 'package:ticketeer/core/constants/object_constants.dart';
import 'package:ticketeer/core/styles/app_color_scheme/app_color_scheme.dart';
import 'package:ticketeer/core/styles/custom_text_style.dart';
import 'package:ticketeer/features/localization/domain/localization_repository.dart';
import 'package:ticketeer/locator.dart';

/// Row with two buttons to set language
class LanguageChooseColumn extends StatelessWidget {
  /// Row with two buttons to set language
  const LanguageChooseColumn({
    super.key,
    required String basePath,
  }) : _basePath = basePath;

  final String _basePath;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColorScheme>()!;

    return Builder(
      builder: (context) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (context.locale == englishLocale)
              CustomHighlightedButton(
                width: 110,
                height: 40,
                onTap: () {
                  context.setLocale(englishLocale);
                  sl<LocalizationRepository>().setNewLocale(englishLocale);
                },
                child: Text(
                  "${_basePath}eng_switch".tr(),
                  style: open.s14.copyWith(color: colors.fonts.main),
                ),
              )
            else
              CustomDefaultButton(
                width: 110,
                height: 40,
                onTap: () {
                  context.setLocale(englishLocale);
                  sl<LocalizationRepository>().setNewLocale(englishLocale);
                },
                child: Text(
                  "${_basePath}eng_switch".tr(),
                  style: open.s14.copyWith(color: colors.fonts.main),
                ),
              ),
            const SizedBox(
              height: 10,
            ),
            if (context.locale == ukrainianLocale)
              CustomHighlightedButton(
                width: 110,
                height: 40,
                onTap: () {
                  context.setLocale(ukrainianLocale);
                  sl<LocalizationRepository>().setNewLocale(ukrainianLocale);
                },
                child: Text(
                  "${_basePath}ukr_switch".tr(),
                  style: open.s14.copyWith(color: colors.fonts.main),
                ),
              )
            else
              CustomDefaultButton(
                width: 110,
                height: 40,
                onTap: () {
                  context.setLocale(ukrainianLocale);
                  sl<LocalizationRepository>().setNewLocale(ukrainianLocale);
                },
                child: Text(
                  "${_basePath}ukr_switch".tr(),
                  style: open.s14.copyWith(color: colors.fonts.main),
                ),
              )
          ],
        );
      },
    );
  }
}
