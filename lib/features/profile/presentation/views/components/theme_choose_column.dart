import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticketeer/core/components/buttons/custom_default_button.dart';
import 'package:ticketeer/core/components/buttons/custom_highlighted_button.dart';
import 'package:ticketeer/core/constants/string_constants.dart';
import 'package:ticketeer/core/styles/app_color_scheme/app_color_scheme.dart';
import 'package:ticketeer/core/styles/custom_text_style.dart';
import 'package:ticketeer/features/theme/theme_cubit/theme_cubit.dart';
import 'package:ticketeer/features/theme/theme_cubit/theme_state.dart';

/// Row with two buttons to set theme
class ThemeChooseColumn extends StatelessWidget {
  /// Row with two buttons to set theme
  const ThemeChooseColumn({
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
        final cubit = context.read<ThemeCubit>();
        return Column(
          children: [
            if (cState.currentTheme == darkTheme)
              CustomHighlightedButton(
                height: 40,
                width: 110,
                onTap: () {
                  cubit.setNewTheme(darkTheme);
                },
                child: Text(
                  "${_basePath}dark_switch".tr(),
                  style: roboto.s14.copyWith(color: colors.fonts.main),
                ),
              )
            else
              CustomDefaultButton(
                height: 40,
                width: 110,
                onTap: () {
                  cubit.setNewTheme(darkTheme);
                },
                child: Text(
                  "${_basePath}dark_switch".tr(),
                  style: roboto.s14.copyWith(color: colors.fonts.main),
                ),
              ),
            const SizedBox(
              height: 10,
            ),
            if (cState.currentTheme == lightTheme)
              CustomHighlightedButton(
                height: 40,
                width: 110,
                child: Text(
                  "${_basePath}light_switch".tr(),
                  style: roboto.s14.copyWith(color: colors.fonts.main),
                ),
                onTap: () {
                  context.read<ThemeCubit>().setNewTheme(lightTheme);
                },
              )
            else
              CustomDefaultButton(
                height: 40,
                width: 110,
                child: Text(
                  "${_basePath}light_switch".tr(),
                  style: roboto.s14.copyWith(color: colors.fonts.main),
                ),
                onTap: () {
                  context.read<ThemeCubit>().setNewTheme(lightTheme);
                },
              )
          ],
        );
      },
    );
  }
}
