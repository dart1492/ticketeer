import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ticketeer/core/components/custom_button.dart';
import 'package:ticketeer/core/components/custom_toasts.dart';
import 'package:ticketeer/core/components/feature_badge.dart';
import 'package:ticketeer/core/components/stacked_gradient.dart';
import 'package:ticketeer/core/routing/app_router.gr.dart';
import 'package:ticketeer/core/styles/app_color_scheme/app_color_scheme.dart';
import 'package:ticketeer/core/styles/custom_text_style.dart';
import 'package:ticketeer/features/auth/presentation/cubits/phone_cubit/phone_cubit.dart';
import 'package:ticketeer/features/auth/presentation/cubits/phone_cubit/phone_state.dart';
import 'package:ticketeer/features/auth/presentation/views/components/error_box.dart';
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
            showErrorToast(text: state.errorText, colors: colors);
          }

          if (state is SuccessPhoneState) {
            context.router.replace(
              OTPRoute(
                phoneNumber: "+${state.phoneNumber}",
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
                      style: open.s16.copyWith(
                        color: colors.fonts.main,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Stack(
                      children: [
                        FeatureBadge(
                          icon: Icon(
                            Iconsax.dislike,
                            color: colors.accents.red,
                          ),
                          text: "${_basePath}bad-example".tr(),
                        ),
                        StackedGradient(color: colors.accents.red),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Stack(
                      children: [
                        FeatureBadge(
                          icon: Icon(
                            Iconsax.like_1,
                            color: colors.accents.green,
                          ),
                          text: "${_basePath}good-example".tr(),
                        ),
                        StackedGradient(color: colors.accents.green),
                      ],
                    ),
                    BlocBuilder<PhoneCubit, PhoneState>(
                      buildWhen: _buildErrorBoxWhen,
                      builder: (context, state) {
                        return ErrorBox(
                          errorText: "${_basePath}validation-error".tr(),
                          isShown: (state as AcceptingPhoneState).isValidated,
                        );
                      },
                    ),
                    const PhoneField(),
                    const Expanded(
                      child: SizedBox(),
                    ),
                    Builder(
                      builder: (context) {
                        return CustomButton(
                          border: Border.all(color: colors.accents.blue),
                          childAlignment: Alignment.center,
                          width: double.infinity,
                          color: colors.accents.blue.withOpacity(0.3),
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            "${_basePath}button".tr(),
                            style: open.s24.w700.copyWith(
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
