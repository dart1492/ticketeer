import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class MainBottomBarScreen extends StatelessWidget {
  const MainBottomBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Text(
        "asdasd",
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
