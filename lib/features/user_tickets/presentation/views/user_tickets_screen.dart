import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ticketeer/core/styles/app_color_scheme/app_color_scheme.dart';

@RoutePage()

/// Screen where user can view his active tickets
class UserTicketsScreen extends StatelessWidget {
  /// Screen where user can view his active tickets
  const UserTicketsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColorScheme>()!;
    return Scaffold(
      backgroundColor: colors.backgrounds.main,
      body: const Center(
        child: Text("Tickets"),
      ),
    );
  }
}
