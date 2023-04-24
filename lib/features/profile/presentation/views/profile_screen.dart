import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ticketeer/core/components/custom_button.dart';
import 'package:ticketeer/core/constants/object_constants.dart';
import 'package:ticketeer/core/styles/app_color_scheme/app_color_scheme.dart';
import 'package:ticketeer/core/styles/custom_text_style.dart';
import 'package:ticketeer/features/profile/presentation/views/components/language_choose_column.dart';
import 'package:ticketeer/features/profile/presentation/views/components/language_indicator_image.dart';
import 'package:ticketeer/features/profile/presentation/views/components/theme_choose_column.dart';
import 'package:ticketeer/features/profile/presentation/views/components/theme_indicator_image.dart';

@RoutePage()

/// Profile screen - with info about app customization and profile data
/// Theme and locale changes here
class ProfileScreen extends StatelessWidget {
  /// Profile screen - with info about app customization and profile data
  /// Theme and locale changes here
  const ProfileScreen({super.key});

  /// Path for the localization
  static const _basePath = "screens.profile";
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
              padding: const EdgeInsets.symmetric(
                vertical: 45,
                horizontal: 40,
              ),
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "$_basePath.hello-text".tr(),
                          style:
                              open.s20.w700.copyWith(color: colors.fonts.main),
                        ),
                        Text(
                          "username",
                          style: open.s32.w700
                              .copyWith(color: colors.accents.blue),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        CustomButton(
                          color: colors.components.blocks.background,
                          border: Border.all(
                            color: colors.components.blocks.border,
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 6,
                          ),
                          child: Text(
                            "$_basePath.change-username".tr(),
                            style: open.s14.copyWith(
                              color: colors.fonts.main,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            "$_basePath.choose-theme".tr(),
                            style: open.s16.w700.copyWith(
                              color: colors.fonts.main,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const ThemeIndicatorImage(),
                          const SizedBox(
                            height: 20,
                          ),
                          const ThemeChooseRow(basePath: _basePath),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            "$_basePath.choose-lang".tr(),
                            style: open.s16.w700
                                .copyWith(color: colors.fonts.main),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const LanguageIndicatorImage(),
                          const SizedBox(
                            height: 20,
                          ),
                          const LanguageChooseRow(basePath: _basePath),
                        ],
                      ),
                    ],
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
