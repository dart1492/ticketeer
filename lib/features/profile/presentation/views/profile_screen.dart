import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:ticketeer/core/components/custom_toasts.dart';
import 'package:ticketeer/core/styles/app_color_scheme/app_color_scheme.dart';
import 'package:ticketeer/core/styles/custom_text_style.dart';
import 'package:ticketeer/core/util/date_time_helper.dart';
import 'package:ticketeer/features/profile/presentation/cubits/profile_cubit/profile_cubit.dart';
import 'package:ticketeer/features/profile/presentation/cubits/profile_cubit/profile_state.dart';
import 'package:ticketeer/features/profile/presentation/views/components/change_name_button_builder.dart';
import 'package:ticketeer/features/profile/presentation/views/components/language_choose_column.dart';
import 'package:ticketeer/features/profile/presentation/views/components/language_indicator_image.dart';
import 'package:ticketeer/features/profile/presentation/views/components/theme_choose_column.dart';
import 'package:ticketeer/features/profile/presentation/views/components/theme_indicator_image.dart';
import 'package:ticketeer/features/profile/presentation/views/components/user_name_builder.dart';
import 'package:ticketeer/locator.dart';

@RoutePage()

/// Profile screen - with info about app customization and profile data
/// Theme and locale changes here
class ProfileScreen extends StatelessWidget {
  /// Profile screen - with info about app customization and profile data
  /// Theme and locale changes here
  const ProfileScreen({super.key});

  /// Path for the localization
  static const _basePath = "screens.profile.";

  /// Helper method to display day / month / year of creation on the screen
  static String _displayDateTimeString(DateTime dateTime) {
    // ignore: lines_longer_than_80_chars
    return "${dateTime.day} ${DateTimeHelper.monthToFullString(dateTime.month).tr()} ${dateTime.year}";
  }

  bool _listenWhen(previous, current) {
    if (previous is ProfileSuccess &&
        (current is ProfileIdle || current is ProfileError)) {
      return true;
    }

    return false;
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColorScheme>()!;
    return BlocProvider(
      create: (context) => sl<ProfileCubit>()..getUser(),
      child: BlocListener<ProfileCubit, ProfileState>(
        listenWhen: _listenWhen,
        listener: (context, state) {
          if (state is ProfileError) {
            showErrorToast(
              text: "${_basePath}error_change".tr(),
              colors: colors,
            );
          }

          if (state is ProfileIdle) {
            showSuccessToast(
              text: "${_basePath}success_change".tr(),
              colors: colors,
            );
          }
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
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
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height / 3,
                        child: BlocBuilder<ProfileCubit, ProfileState>(
                          buildWhen: (previous, current) {
                            if (previous is ProfileEditing &&
                                current is ProfileEditing) {
                              return false;
                            } else {
                              return true;
                            }
                          },
                          builder: (context, state) {
                            if (state is ProfileLoaded) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const UserName(),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  const ChangeNameButton(basePath: _basePath),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "${_basePath}phone-text".tr(),
                                    style: open.s16.copyWith(
                                      color: colors.fonts.main,
                                    ),
                                  ),
                                  Text(
                                    state.user.phoneNumber,
                                    style: open.s18.copyWith(
                                      color: colors.accents.blue,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "${_basePath}with-us".tr(),
                                    style: open.s16.copyWith(
                                      color: colors.fonts.main,
                                    ),
                                  ),
                                  Text(
                                    _displayDateTimeString(
                                      state.user.createdAt,
                                    ),
                                    style: open.s18.copyWith(
                                      color: colors.accents.blue,
                                    ),
                                  ),
                                ],
                              ).animate().fadeIn(
                                    duration: const Duration(milliseconds: 300),
                                  );
                            } else {
                              // TODO: FIND USER LOADING ANIMATION
                              return SpinKitDualRing(
                                color: colors.accents.blue,
                              );
                            }
                          },
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                "${_basePath}choose-theme".tr(),
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
                              const ThemeChooseColumn(
                                basePath: _basePath,
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                "${_basePath}choose-lang".tr(),
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
                              const LanguageChooseColumn(basePath: _basePath),
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
        ),
      ),
    );
  }
}
