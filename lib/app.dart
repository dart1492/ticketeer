import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticketeer/core/routing/app_router.dart';
import 'package:ticketeer/core/routing/app_router.gr.dart';
import 'package:ticketeer/features/theme/cubit/theme_state.dart';
import 'package:ticketeer/locator.dart';

import 'features/theme/cubit/theme_cubit.dart';

class App extends StatelessWidget {
  const App({super.key});

  ThemeData themeChooser(String currentTheme) {
    if (currentTheme == "dark") {
      return ThemeData(backgroundColor: Colors.black);
    } else {
      return ThemeData(backgroundColor: Colors.white);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ThemeCubit>()..getCurrentTheme(),
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          if (state is LoadedThemeState) {
            return MaterialApp.router(
              theme: themeChooser(state.currentTheme),
              routerConfig: sl<AppRouter>()
                  .config(initialRoutes: [const MainBottomBarRoute()]),
            );
          } else {
            // TODO: iMPLEMENT NATIVE SPALSH SCREEN WHILE LOADING
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
