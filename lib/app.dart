import 'package:easy_localization/easy_localization.dart';
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
  ThemeData _themeChooser(String currentTheme) {
    return currentTheme == "dark" ? AppTheme.dark : AppTheme.light;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ThemeCubit>()..getCurrentTheme(),
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, themeState) {
          if (themeState is LoadingThemeState) {
            return const CircularProgressIndicator();
          } else {
            return MaterialApp.router(
              locale: context.locale,
              supportedLocales: context.supportedLocales,
              localizationsDelegates: context.localizationDelegates,
              theme: _themeChooser(
                (themeState as LoadedThemeState).currentTheme,
              ),
              routerConfig: sl<AppRouter>().config(
                initialRoutes: [
                  const MainBottomBarRoute(),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
