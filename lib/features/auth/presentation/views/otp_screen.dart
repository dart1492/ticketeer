// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticketeer/core/routing/app_router.gr.dart';
import 'package:ticketeer/core/styles/app_color_scheme/app_color_scheme.dart';
import 'package:ticketeer/core/styles/custom_text_style.dart';
import 'package:ticketeer/features/auth/presentation/cubits/otp_cubit/otp_cubit.dart';
import 'package:ticketeer/features/auth/presentation/cubits/otp_cubit/otp_cubit_state.dart';
import 'package:ticketeer/features/auth/presentation/views/components/otp_field.dart';
import 'package:ticketeer/locator.dart';

@RoutePage()

/// Screen that gets show after user has sent an otp request.
/// Here only one otp is valid - 0000
class OTPScreen extends StatelessWidget {
  final String phoneNumber;

  static const _basePath = "screens.otp.";

  /// Screen that gets show after user has sent an otp request.
  /// Here only one otp is valid - 0000
  const OTPScreen({
    Key? key,
    required this.phoneNumber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColorScheme>()!;
    return BlocProvider(
      create: (context) => sl<OtpCubit>()..setPhoneNumber(phoneNumber),
      child: BlocListener<OtpCubit, OtpCubitState>(
        listener: (context, state) {
          if (state is ErrorOtpState) {
            BotToast.showText(
              backgroundColor: colors.backgrounds.secondary,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 10,
              ),
              align: const Alignment(0, 0.7),
              text: state.errorMessage,
              textStyle: open.s16.copyWith(
                color: colors.accents.red,
              ),
            );
          }

          if (state is SuccessOtpState) {
            BotToast.showText(
              backgroundColor: colors.backgrounds.secondary,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 10,
              ),
              align: const Alignment(0, 0.7),
              text: "${_basePath}success".tr(),
              textStyle: open.s16.copyWith(
                color: colors.accents.green,
              ),
            );
            context.router.replace(const MainBottomBarRoute());
          }
        },
        child: Scaffold(
          backgroundColor: colors.backgrounds.main,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 30,
              ),
              child: Column(
                children: [
                  Text(
                    "${_basePath}description".tr(),
                    style: open.s24.copyWith(
                      color: colors.fonts.main,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const OtpField(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
