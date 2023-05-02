import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import 'package:ticketeer/core/routing/app_router.gr.dart';
import 'package:ticketeer/core/styles/app_color_scheme/app_color_scheme.dart';
import 'package:ticketeer/core/styles/custom_text_style.dart';

@RoutePage()

/// This "screen" contains only the bottom nav bar so
/// that nested navigation could be implemented
class MainBottomBarScreen extends StatelessWidget {
  /// This "screen" contains only the bottom nav bar so
  /// that nested navigation could be implemented
  const MainBottomBarScreen({super.key});

  /// Base path for nav bar localization
  static const _basePath = "components.nav-bar.";

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColorScheme>()!;

    return AutoTabsScaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: colors.backgrounds.main,
      routes: const [
        MoviesRoute(),
        UserTicketsRoute(),
        ProfileRoute(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return SalomonBottomBar(
          itemPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          selectedItemColor: colors.accents.blue,
          unselectedItemColor: colors.fonts.secondary,
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          backgroundColor: colors.backgrounds.secondary,
          items: [
            SalomonBottomBarItem(
              icon: const Icon(
                Iconsax.video,
                size: 30,
              ),
              title: Text(
                "${_basePath}home".tr(),
                style: open.s16,
              ),
            ),
            SalomonBottomBarItem(
              icon: const Icon(
                Iconsax.ticket,
                size: 30,
              ),
              title: Text(
                "${_basePath}tickets".tr(),
                style: open.s16,
              ),
            ),
            SalomonBottomBarItem(
              icon: const Icon(
                Iconsax.user,
                size: 30,
              ),
              title: Text(
                "${_basePath}profile".tr(),
                style: open.s16,
              ),
            ),
          ],
        );
      },
    );
  }
}
