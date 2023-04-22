// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:ticketeer/core/styles/app_color_scheme/accents.dart';
import 'package:ticketeer/core/styles/app_color_scheme/backgrounds.dart';
import 'package:ticketeer/core/styles/app_color_scheme/components.dart';
import 'package:ticketeer/core/styles/app_color_scheme/fonts.dart';

/// Custom Theme extension that defines different groups of colors.
///  This "color-tree" is ported directly from my figma design
class AppColorScheme extends ThemeExtension<AppColorScheme> {
  final Accents accents;
  final Backgrounds backgrounds;
  final Components components;
  final Fonts fonts;

  AppColorScheme({
    required this.accents,
    required this.backgrounds,
    required this.components,
    required this.fonts,
  });

  @override
  ThemeExtension<AppColorScheme> lerp(
    covariant ThemeExtension<AppColorScheme> other,
    double t,
  ) {
    return AppColorScheme(
      accents: accents.lerp((other as AppColorScheme).accents, t),
      backgrounds: backgrounds.lerp(other.backgrounds, t),
      components: components.lerp(other.components, t),
      fonts: fonts.lerp(other.fonts, t),
    );
  }

  @override
  AppColorScheme copyWith({
    Accents? accents,
    Backgrounds? backgrounds,
    Components? components,
    Fonts? fonts,
  }) {
    return AppColorScheme(
      accents: accents ?? this.accents,
      backgrounds: backgrounds ?? this.backgrounds,
      components: components ?? this.components,
      fonts: fonts ?? this.fonts,
    );
  }
}
