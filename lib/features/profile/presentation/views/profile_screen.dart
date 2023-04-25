import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticketeer/core/components/custom_toasts.dart';
import 'package:ticketeer/core/styles/app_color_scheme/app_color_scheme.dart';
import 'package:ticketeer/core/styles/custom_text_style.dart';
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
  static const _basePath = "screens.profile";
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColorScheme>()!;
    return BlocProvider(
      create: (context) => sl<ProfileCubit>()..getUser(),
      child: BlocListener<ProfileCubit, ProfileState>(
        // "done-change-username" : "Done",
        //     "phone-text" : "Phone number:",
        listenWhen: (previous, current) {
          if (previous is ProfileSuccess &&
              (current is ProfileIdle || current is ProfileError)) {
            return true;
          }

          return false;
        },
        listener: (context, state) {
          if (state is ProfileError) {
            showErrorToast(text: state.errorMessage, colors: colors);
          }

          if (state is ProfileIdle) {
            showSuccessToast(
              text: "Success!",
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
                  child: Column(
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
                                  Text(
                                    "$_basePath.hello-text".tr(),
                                    style: open.s20.w700
                                        .copyWith(color: colors.fonts.main),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  const UserName(),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  const ChangeNameButton(basePath: _basePath),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    // "done-change-username" : "Done",
                                    //     "phone-text" : "Phone number:",
                                    "$_basePath.phone-text".tr(),
                                    style: open.s16.w700.copyWith(
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
                                ],
                              ).animate().fadeIn(
                                    duration: const Duration(milliseconds: 300),
                                  );
                            } else {
                              // TODO: FIND USER LOADING ANIMATION
                              return Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Loading user...",
                                  style: open.s16.w700.copyWith(
                                    color: colors.accents.blue,
                                  ),
                                ),
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
        ),
      ),
    );
  }
}
