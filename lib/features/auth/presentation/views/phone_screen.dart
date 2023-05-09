import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:ticketeer/core/components/buttons/custom_highlighted_button.dart';
import 'package:ticketeer/core/components/custom_toasts.dart';
import 'package:ticketeer/core/components/static_elements/validation_error_box.dart';
import 'package:ticketeer/core/routing/app_router.gr.dart';
import 'package:ticketeer/core/styles/app_color_scheme/app_color_scheme.dart';
import 'package:ticketeer/core/styles/custom_text_style.dart';
import 'package:ticketeer/features/auth/presentation/cubits/phone_cubit/phone_cubit.dart';
import 'package:ticketeer/features/auth/presentation/cubits/phone_cubit/phone_state.dart';
import 'package:ticketeer/features/auth/presentation/views/components/phone_field.dart';
import 'package:ticketeer/locator.dart';

/// This screen contains textfield for a phone number.
/// Than one time password gets sent to the device and access token retrieved
@RoutePage()
class PhoneScreen extends StatelessWidget {
  /// This screen contains textfield for a phone number.
  /// Than one time password gets sent to the device and access token retrieved
  const PhoneScreen({super.key});

  bool _buildErrorBoxWhen(PhoneState previous, PhoneState current) {
    if (previous is AcceptingPhoneState && current is AcceptingPhoneState) {
      return true;
    }
    return false;
  }

  static const _basePath = "screens.phone.";
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColorScheme>()!;
    return BlocProvider(
      create: (context) => sl<PhoneCubit>(),
      child: BlocListener<PhoneCubit, PhoneState>(
        listener: (context, state) {
          if (state is ErrorPhoneState) {
            showErrorToast(
              text: "${_basePath}processing_error".tr(),
              colors: colors,
            );
          }

          if (state is SuccessPhoneState) {
            context.router.replace(
              OTPRoute(
                phoneNumber: state.phoneNumber,
              ),
            );
          }
        },
        child: Scaffold(
          backgroundColor: colors.backgrounds.main,
          body: SafeArea(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 30,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${_basePath}description".tr(),
                      style: roboto.s16.copyWith(
                        color: colors.fonts.main,
                      ),
                    ),
                    BlocBuilder<PhoneCubit, PhoneState>(
                      buildWhen: _buildErrorBoxWhen,
                      builder: (context, state) {
                        return ValidationErrorBox(
                          errorText: "${_basePath}validation_error".tr(),
                          isShown: !(state as AcceptingPhoneState).isValidated,
                        );
                      },
                    ),
                    const PhoneField(
                      basePath: _basePath,
                    ),
                    const Expanded(
                      child: SizedBox(),
                    ),
                    BlocBuilder<PhoneCubit, PhoneState>(
                      builder: (context, state) {
                        if (state is LoadingPhoneState) {
                          return SpinKitDualRing(
                            color: colors.accents.blue,
                          );
                        }

                        return CustomHighlightedButton(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            "${_basePath}auth_button".tr(),
                            style: roboto.s24.w700.copyWith(
                              color: colors.fonts.main,
                            ),
                          ),
                          onTap: () {
                            context.read<PhoneCubit>().getOTP();
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
