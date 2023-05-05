import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticketeer/core/components/static_elements/custom_container.dart';
import 'package:ticketeer/core/constants/image_names.dart';
import 'package:ticketeer/core/constants/string_constants.dart';
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
    return CustomContainer(
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          final cState = state as LoadedThemeState;
          return Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(
                  cState.currentTheme == darkTheme
                      ? ImageNames.moon
                      : ImageNames.sun,
                ),
              ),
            ),
          ).animate(
            onComplete: (controller) {
              controller.repeat();
            },
          ).rotate(
            duration: const Duration(seconds: 5),
          );
        },
      ),
    );
  }
}
