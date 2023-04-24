import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticketeer/core/components/custom_button.dart';
import 'package:ticketeer/core/constants/string_constants.dart';
import 'package:ticketeer/core/styles/app_color_scheme/app_color_scheme.dart';
import 'package:ticketeer/core/styles/custom_text_style.dart';
import 'package:ticketeer/features/theme/theme_cubit/theme_cubit.dart';
import 'package:ticketeer/features/theme/theme_cubit/theme_state.dart';

/// Row with two buttons to set theme
class ThemeChooseRow extends StatelessWidget {
  /// Row with two buttons to set theme
  const ThemeChooseRow({
    super.key,
    required String basePath,
  }) : _basePath = basePath;

  final String _basePath;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColorScheme>()!;
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        final cState = state as LoadedThemeState;
        return Column(
          children: [
            CustomButton(
              onTap: () {
                context.read<ThemeCubit>().setNewTheme(darkTheme);
              },
              color: cState.currentTheme == "dark"
                  ? colors.accents.blue.withOpacity(0.3)
                  : colors.components.blocks.background,
              border: Border.all(
                color: cState.currentTheme == "dark"
                    ? colors.accents.blue
                    : colors.components.blocks.border,
              ),
              width: 110,
              childAlignment: Alignment.center,
              height: 40,
              child: Text(
                "$_basePath.dark-switch".tr(),
                style: open.s14.copyWith(color: colors.fonts.main),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            CustomButton(
              width: 110,
              childAlignment: Alignment.center,
              height: 40,
              color: cState.currentTheme == "light"
                  ? colors.accents.blue.withOpacity(0.3)
                  : colors.components.blocks.background,
              border: Border.all(
                color: cState.currentTheme == "light"
                    ? colors.accents.blue
                    : colors.components.blocks.border,
              ),
              child: Text(
                "$_basePath.light-switch".tr(),
                style: open.s14.copyWith(color: colors.fonts.main),
              ),
              onTap: () {
                context.read<ThemeCubit>().setNewTheme(lightTheme);
              },
            ),
          ],
        );
      },
    );
  }
}
