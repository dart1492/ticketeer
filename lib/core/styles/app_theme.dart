import 'package:flutter/material.dart';
import 'package:ticketeer/core/styles/app_color_scheme/accents.dart';
import 'package:ticketeer/core/styles/app_color_scheme/app_color_scheme.dart';
import 'package:ticketeer/core/styles/app_color_scheme/backgrounds.dart';
import 'package:ticketeer/core/styles/app_color_scheme/components.dart';
import 'package:ticketeer/core/styles/app_color_scheme/fonts.dart';

/// In this class all colors for two different types are named and defined.
///
/// Theme in my app uses ThemeExtension so that
/// I have complete control over the color names and don't have to use defined
///  material theme.
///
/// Also ThemeExtensions allow me to animate theme changing
///  by providing lerp override for all colors
class AppTheme {
  /// Light theme
  static ThemeData get light {
    return ThemeData(
      extensions: <ThemeExtension<dynamic>>[
        AppColorScheme(
          accents: Accents(
            purple: const Color(0xFF7000FF),
            red: const Color(0xFFFF6D6D),
            blue: const Color(0xFF446DFF),
            green: const Color(0xFF6BFF8C),
            gold: const Color(0xFFE5FF46),
          ),
          backgrounds: Backgrounds(
            main: const Color(0xFFFFFFFF),
            secondary: const Color(0xFFEBEBEB),
          ),
          components: Components(
            Blocks(
              border: const Color.fromARGB(255, 179, 179, 179),
              background: const Color.fromARGB(255, 225, 225, 225),
            ),
          ),
          fonts: Fonts(
            main: const Color(0xFF131313),
            secondary: const Color(0xFFBDBDBD),
            reversed: const Color(0xFFFFFFFF),
          ),
        ),
      ],
    );
  }

  /// Dark theme
  static ThemeData get dark {
    return ThemeData(
      extensions: <ThemeExtension<AppColorScheme>>[
        AppColorScheme(
          accents: Accents(
            purple: const Color(0xFF7000FF),
            red: const Color(0xFFFF4B4B),
            blue: const Color(0xFF446DFF),
            green: const Color(0xFF38FF64),
            gold: const Color(0xFFE5FF46),
          ),
          backgrounds: Backgrounds(
            main: const Color(0xFF121215),
            secondary: const Color(0xFF1F2226),
          ),
          components: Components(
            Blocks(
              border: const Color(0xFF25252A),
              background: const Color(0xFF1C1C21),
            ),
          ),
          fonts: Fonts(
            main: const Color(0xFFFFFFFF),
            secondary: const Color(0xFF8A8A8A),
            reversed: const Color(0xFF121215),
          ),
        ),
      ],
    );
  }
}
