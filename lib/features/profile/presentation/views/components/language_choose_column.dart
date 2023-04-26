import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticketeer/core/components/custom_button.dart';
import 'package:ticketeer/core/constants/object_constants.dart';
import 'package:ticketeer/core/styles/app_color_scheme/app_color_scheme.dart';
import 'package:ticketeer/core/styles/custom_text_style.dart';
import 'package:ticketeer/features/home/presentation/cubits/cubit/home_cubit.dart';
import 'package:ticketeer/features/localization/domain/localization_repository.dart';
import 'package:ticketeer/locator.dart';

/// Row with two buttons to set language
class LanguageChooseRow extends StatelessWidget {
  /// Row with two buttons to set language
  const LanguageChooseRow({
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
            CustomButton(
              width: 110,
              childAlignment: Alignment.center,
              height: 40,
              onTap: () {
                context.setLocale(englishLocale);
                sl<LocalizationRepository>().setNewLocale(englishLocale);
                context.read<HomeCubit>().close();
              },
              color: context.locale == englishLocale
                  ? colors.accents.blue.withOpacity(0.3)
                  : colors.components.blocks.background,
              border: Border.all(
                color: context.locale == englishLocale
                    ? colors.accents.blue
                    : colors.components.blocks.border,
              ),
              child: Text(
                "$_basePath.eng-switch".tr(),
                style: open.s14.copyWith(color: colors.fonts.main),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            CustomButton(
              color: context.locale == ukrainianLocale
                  ? colors.accents.blue.withOpacity(0.3)
                  : colors.components.blocks.background,
              border: Border.all(
                color: context.locale == ukrainianLocale
                    ? colors.accents.blue
                    : colors.components.blocks.border,
              ),
              width: 110,
              childAlignment: Alignment.center,
              height: 40,
              child: Text(
                "$_basePath.ukr-switch".tr(),
                style: open.s14.copyWith(color: colors.fonts.main),
              ),
              onTap: () {
                context.setLocale(ukrainianLocale);
                sl<LocalizationRepository>().setNewLocale(ukrainianLocale);
                context.read<HomeCubit>().close();
              },
            ),
          ],
        );
      },
    );
  }
}
