import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticketeer/core/components/custom_button.dart';
import 'package:ticketeer/core/constants/object_constants.dart';
import 'package:ticketeer/core/constants/string_constants.dart';
import 'package:ticketeer/core/styles/app_color_scheme/app_color_scheme.dart';
import 'package:ticketeer/core/styles/custom_text_style.dart';
import 'package:ticketeer/features/localization/domain/localization_repository.dart';
import 'package:ticketeer/features/theme/theme_cubit/theme_cubit.dart';
import 'package:ticketeer/features/theme/theme_cubit/theme_state.dart';
import 'package:ticketeer/locator.dart';

@RoutePage()

/// Profile screen - with info about app customization and profile data
/// Theme and locale changes here
class ProfileScreen extends StatelessWidget {
  /// Profile screen - with info about app customization and profile data
  /// Theme and locale changes here
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColorScheme>()!;
    return Scaffold(
      backgroundColor: colors.backgrounds.main,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light.copyWith(
          statusBarColor: colors.backgrounds.main,
        ),
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 45),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Hello,",
                    style: open.s20.w700.copyWith(color: colors.fonts.main),
                  ),
                  Text(
                    "username",
                    style: open.s24.w700.copyWith(color: colors.accents.blue),
                  ),
                  CustomButton(
                    color: colors.components.blocks.background,
                    border: Border.all(color: colors.components.blocks.border),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    child: Text(
                      "Change username",
                      style: open.s14.copyWith(color: colors.fonts.main),
                    ),
                  ),
                  Text(
                    "Choose theme:",
                    style: open.s16.copyWith(color: colors.fonts.main),
                  ),
                  BlocBuilder<ThemeCubit, ThemeState>(
                    builder: (context, state) {
                      final cState = state as LoadedThemeState;

                      if (cState.currentTheme == darkTheme) {
                        return Container(
                          height: 150,
                          width: 150,
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
                          height: 150,
                          width: 150,
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
                  BlocBuilder<ThemeCubit, ThemeState>(
                    builder: (context, state) {
                      final cState = state as LoadedThemeState;
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
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
                            padding: const EdgeInsets.symmetric(
                              horizontal: 22,
                              vertical: 8,
                            ),
                            child: Text(
                              "Dark",
                              style:
                                  open.s14.copyWith(color: colors.fonts.main),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          CustomButton(
                            color: cState.currentTheme == "light"
                                ? colors.accents.blue.withOpacity(0.3)
                                : colors.components.blocks.background,
                            border: Border.all(
                              color: cState.currentTheme == "light"
                                  ? colors.accents.blue
                                  : colors.components.blocks.border,
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 22,
                              vertical: 8,
                            ),
                            child: Text(
                              "Light",
                              style:
                                  open.s14.copyWith(color: colors.fonts.main),
                            ),
                            onTap: () {
                              context
                                  .read<ThemeCubit>()
                                  .setNewTheme(lightTheme);
                            },
                          ),
                        ],
                      );
                    },
                  ),
                  Text(
                    "Choose language:",
                    style: open.s16.copyWith(color: colors.fonts.main),
                  ),
                  Builder(
                    builder: (context) {
                      if (context.locale == englishLocale) {
                        return Container(
                          height: 150,
                          width: 150,
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
                          height: 150,
                          width: 150,
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
                  Builder(
                    builder: (context) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomButton(
                            onTap: () {
                              context.setLocale(englishLocale);
                              //TODO: UNCOMMENT WHEN IMPLEMENTING INTERCEPTORS

                              // sl<LocalizationRepository>()
                              //     .setNewLocale(englishLocale);
                            },
                            color: context.locale == englishLocale
                                ? colors.accents.blue.withOpacity(0.3)
                                : colors.components.blocks.background,
                            border: Border.all(
                              color: context.locale == englishLocale
                                  ? colors.accents.blue
                                  : colors.components.blocks.border,
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 22,
                              vertical: 8,
                            ),
                            child: Text(
                              "English",
                              style:
                                  open.s14.copyWith(color: colors.fonts.main),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
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
                            padding: const EdgeInsets.symmetric(
                              horizontal: 22,
                              vertical: 8,
                            ),
                            child: Text(
                              "Ukrainian",
                              style:
                                  open.s14.copyWith(color: colors.fonts.main),
                            ),
                            onTap: () {
                              context.setLocale(ukrainianLocale);
                              //TODO: UNCOMMENT WHEN IMPLEMENTING INTERCEPTORS

                              // sl<LocalizationRepository>()
                              //     .setNewLocale(ukrainianLocale);
                            },
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
