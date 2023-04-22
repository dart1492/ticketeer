import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

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
