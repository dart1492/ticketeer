import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticketeer/core/routing/app_router.dart';
import 'package:ticketeer/core/routing/app_router.gr.dart';
import 'package:ticketeer/core/styles/app_theme.dart';
import 'package:ticketeer/features/theme/cubit/theme_cubit.dart';
import 'package:ticketeer/features/theme/cubit/theme_state.dart';
import 'package:ticketeer/locator.dart';

/// Main widget - entrypoint of the whole app
class App extends StatelessWidget {
  /// Main widget - entrypoint of the whole app
  const App({super.key});

  /// Theme chooser - return ThemeData, depending on what theme var
  /// is passed to the call
  ThemeData themeChooser(String currentTheme) {
    return currentTheme == "dark" ? AppTheme.dark : AppTheme.light;
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
            // TODO: IMPLEMENT NATIVE SPLASH SCREEN WHILE LOADING
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
