import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticketeer/core/constants/string_constants.dart';
import 'package:ticketeer/core/styles/app_color_scheme/app_color_scheme.dart';
import 'package:ticketeer/features/theme/theme_cubit/theme_cubit.dart';
import 'package:ticketeer/features/theme/theme_cubit/theme_state.dart';

/// Image that gets shown depending on current theme
class ThemeIndicatorImage extends StatelessWidget {
  /// Image that gets shown depending on current theme
  const ThemeIndicatorImage({
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
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          final cState = state as LoadedThemeState;

          if (cState.currentTheme == darkTheme) {
            return Container(
              height: 100,
              width: 100,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('assets/moon.png'),
                ),
              ),
            ).animate(
              onComplete: (controller) {
                controller.repeat();
              },
            ).rotate(
              duration: const Duration(seconds: 5),
            );
          } else {
            return Container(
              height: 100,
              width: 100,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('assets/sun.png'),
                ),
              ),
            ).animate(
              onComplete: (controller) {
                controller.repeat();
              },
            ).rotate(
              duration: const Duration(seconds: 5),
            );
          }
        },
      ),
    );
  }
}
