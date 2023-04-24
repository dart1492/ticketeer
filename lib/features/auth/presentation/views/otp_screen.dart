import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ticketeer/core/styles/app_color_scheme/app_color_scheme.dart';
import 'package:ticketeer/core/styles/custom_text_style.dart';

@RoutePage()

/// Screen that gets show after user has sent an otp request.
/// Here only one otp is valid - 0000
class OTPScreen extends StatelessWidget {
  /// Screen that gets show after user has sent an otp request.
  /// Here only one otp is valid - 0000
  const OTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColorScheme>()!;
    return Scaffold(
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
                "Now enter the One-Time-Password that we've sent you:",
                style: open.s16.copyWith(
                  color: colors.fonts.main,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
