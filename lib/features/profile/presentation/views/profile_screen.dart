import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ticketeer/core/styles/app_color_scheme/app_color_scheme.dart';

@RoutePage()

/// Profile screen - with info about app customization and profile data
/// Theme and locale changes here
class ProfileScreen extends StatelessWidget {
  /// Profile screen - with info about app customization and profile data
  /// Theme and locale changes here
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColorScheme>()!;
    return Scaffold(
      backgroundColor: colors.backgrounds.main,
      body: const Center(
        child: Text("Profile"),
      ),
    );
  }
}
