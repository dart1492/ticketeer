import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:ticketeer/core/components/buttons/custom_highlighted_button.dart';
import 'package:ticketeer/core/components/static_elements/feature_badge.dart';
import 'package:ticketeer/core/components/static_elements/stacked_gradient.dart';
import 'package:ticketeer/core/constants/image_names.dart';
import 'package:ticketeer/core/routing/app_router.gr.dart';
import 'package:ticketeer/core/styles/app_color_scheme/app_color_scheme.dart';
import 'package:ticketeer/core/styles/custom_text_style.dart';
import 'package:ticketeer/features/welcome/components/movies_carousel.dart';

@RoutePage()

/// Welcome screen - completely static (no api calls, no sp interactions)
class WelcomeScreen extends StatelessWidget {
  /// Welcome screen - completely static (no api calls, no sp interactions)
  const WelcomeScreen({super.key});

  /// Base path for welcome screen localization
  static const _basePath = "screens.welcome.";
  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();

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
                  style: open.s32.w700.copyWith(color: colors.fonts.main),
                ),
                const MoviesCarousel(),
                Stack(
                  children: [
                    FeatureBadge(
                      imageIcon: Image.asset(
                        ImageNames.secondWelcomeIcon,
                        height: 24,
                        width: 24,
                      ),
                      text: '${_basePath}badge_1'.tr(),
                    ),
                    StackedGradient(color: colors.accents.blue),
                  ],
                ),
                Stack(
                  children: [
                    FeatureBadge(
                      imageIcon: Image.asset(
                        ImageNames.firstWelcomeIcon,
                        height: 24,
                        width: 24,
                      ),
                      text: '${_basePath}badge_2'.tr(),
                    ),
                    StackedGradient(color: colors.accents.green),
                  ],
                ),
                Stack(
                  children: [
                    FeatureBadge(
                      imageIcon: Image.asset(
                        ImageNames.thirdWelcomeIcon,
                        height: 24,
                        width: 24,
                      ),
                      text: '${_basePath}badge_3'.tr(),
                    ),
                    StackedGradient(color: colors.accents.red),
                  ],
                ),
                CustomHighlightedButton(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Text(
                    "${_basePath}start".tr(),
                    style: open.s24.w700.copyWith(
                      color: colors.fonts.main,
                    ),
                  ),
                  onTap: () {
                    context.router.replace(
                      const PhoneRoute(),
                    );
                  },
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
