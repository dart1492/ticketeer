import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticketeer/core/styles/app_color_scheme/app_color_scheme.dart';
import 'package:ticketeer/features/theme/cubit/theme_cubit.dart';

@RoutePage()

/// This "screen" contains only the bottom nav bar so
/// that nested navigation could be implemented
class MainBottomBarScreen extends StatelessWidget {
  /// This "screen" contains only the bottom nav bar so
  /// that nested navigation could be implemented
  const MainBottomBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
