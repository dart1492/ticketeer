import 'package:auto_route/auto_route.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ticketeer/core/components/custom_button.dart';
import 'package:ticketeer/core/components/feature_badge.dart';
import 'package:ticketeer/core/routing/app_router.gr.dart';
import 'package:ticketeer/core/styles/app_color_scheme/app_color_scheme.dart';
import 'package:ticketeer/core/styles/custom_text_style.dart';
import 'package:ticketeer/features/auth/presentation/cubits/phone_cubit/phone_cubit.dart';
import 'package:ticketeer/features/auth/presentation/cubits/phone_cubit/phone_state.dart';
import 'package:ticketeer/features/auth/presentation/views/components/error_box.dart';
import 'package:ticketeer/features/auth/presentation/views/components/phone_field.dart';
import 'package:ticketeer/features/welcome/components/stacked_gradient.dart';
import 'package:ticketeer/locator.dart';

/// This screen contains textfield for a phone number.
/// Than one time password gets sent to the device and access token retrieved
@RoutePage()
class PhoneScreen extends StatelessWidget {
  /// This screen contains textfield for a phone number.
  /// Than one time password gets sent to the device and access token retrieved
  const PhoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColorScheme>()!;
    return BlocProvider(
      create: (context) => sl<PhoneCubit>(),
      child: BlocListener<PhoneCubit, PhoneState>(
        listener: (context, state) {
          if (state is ErrorPhoneState) {
            BotToast.showText(
              text: state.errorText,
              textStyle: open.s14.copyWith(
                color: colors.accents.red,
              ),
            );
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
                      "To authorize, give us your number and we'll send you a message:",
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
                          text: "Bad: 0960789676",
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
                          text: "Good: 380660000000",
                        ),
                        StackedGradient(color: colors.accents.green),
                      ],
                    ),
                    BlocBuilder<PhoneCubit, PhoneState>(
                      buildWhen: (previous, current) {
                        if (previous is AcceptingPhoneState &&
                            current is AcceptingPhoneState) {
                          return true;
                        }
                        return false;
                      },
                      builder: (context, state) {
                        return ErrorBox(
                          errorText: "Invalid phone number",
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
                            "Authorize",
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
