import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:ticketeer/core/styles/app_color_scheme/app_color_scheme.dart';
import 'package:ticketeer/core/styles/custom_text_style.dart';

/// Toast that indicates successful operation completion
void showSuccessToast({
  required String text,
  required AppColorScheme colors,
}) {
  BotToast.showText(
    contentColor: colors.backgrounds.secondary,
    contentPadding: const EdgeInsets.symmetric(
      horizontal: 15,
      vertical: 10,
    ),
    align: const Alignment(0, 0.7),
    text: text,
    textStyle: roboto.s16.copyWith(
      color: colors.accents.green,
    ),
  );
}

/// Error toast
void showErrorToast({
  required String text,
  required AppColorScheme colors,
}) {
  BotToast.showText(
    contentColor: colors.backgrounds.secondary,
    contentPadding: const EdgeInsets.symmetric(
      horizontal: 15,
      vertical: 10,
    ),
    align: const Alignment(0, 0.7),
    text: text,
    textStyle: roboto.s16.copyWith(
      color: colors.accents.red,
    ),
  );
}
