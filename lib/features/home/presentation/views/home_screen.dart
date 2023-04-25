import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ticketeer/core/styles/app_color_scheme/app_color_scheme.dart';

@RoutePage()

/// Home screen where movies are shown, search and ticket purchase happens here
class HomeScreen extends StatelessWidget {
  /// Home screen where movies are shown, search and ticket purchase happens
  /// here
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColorScheme>()!;

    return Scaffold(
      backgroundColor: colors.backgrounds.main,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light.copyWith(
          statusBarColor: colors.backgrounds.main,
        ),
        child: const Center(
          child: Text("Home"),
        ),
      ),
    );
  }
}
