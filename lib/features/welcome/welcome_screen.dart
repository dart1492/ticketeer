import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:ticketeer/core/components/custom_button.dart';
import 'package:ticketeer/core/styles/app_color_scheme/app_color_scheme.dart';
import 'package:ticketeer/core/styles/custom_text_style.dart';
import 'package:ticketeer/features/welcome/components/feature_badge.dart';
import 'package:ticketeer/features/welcome/components/movies_carousel.dart';
import 'package:ticketeer/features/welcome/components/stacked_gradient.dart';

@RoutePage()

/// Welcome screen - completely static (no api calls, no sp interactions)
class WelcomeScreen extends StatelessWidget {
  /// Welcome screen - completely static (no api calls, no sp interactions)
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColorScheme>()!;
    return Scaffold(
      backgroundColor: colors.backgrounds.main,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light.copyWith(
          statusBarColor: colors.backgrounds.main,
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset('assets/screen.png'),
                Text(
                  "TICKETEER",
                  style: josephine.s32.w700.copyWith(color: colors.fonts.main),
                ),
                const MoviesCarousel(),
                Stack(
                  children: [
                    FeatureBadge(
                      icon: Image.asset(
                        'assets/welcome_icon_1.png',
                        height: 24,
                        width: 24,
                      ),
                      text: 'Clear and easy-to-use interface',
                    ),
                    StackedGradient(color: colors.accents.green),
                  ],
                ),
                Stack(
                  children: [
                    FeatureBadge(
                      icon: Image.asset(
                        'assets/welcome_icon_2.png',
                        height: 24,
                        width: 24,
                      ),
                      text: 'Meta-info: ratings, rankings, stars',
                    ),
                    StackedGradient(color: colors.accents.blue),
                  ],
                ),
                Stack(
                  children: [
                    FeatureBadge(
                      icon: Image.asset(
                        'assets/welcome_icon_3.png',
                        height: 24,
                        width: 24,
                      ),
                      text: 'Hundreds of movies',
                    ),
                    StackedGradient(color: colors.accents.red),
                  ],
                ),
                CustomButton(
                  childAlignment: Alignment.center,
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  color: colors.accents.blue.withOpacity(0.3),
                  border: Border.all(color: colors.accents.blue),
                  child: Text(
                    "Start",
                    style: josephine.s24.w700.copyWith(
                      color: colors.fonts.main,
                    ),
                  ),
                  onTap: () {},
                ),
                const SizedBox(
                  height: 10,
                ),
              ]
                  .animate(
                    interval: const Duration(seconds: 1),
                  )
                  .fadeIn(
                    duration: const Duration(seconds: 1),
                    curve: Curves.easeIn,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
