import 'package:bot_toast/bot_toast.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticketeer/core/constants/string_constants.dart';
import 'package:ticketeer/core/routing/app_router.dart';
import 'package:ticketeer/core/routing/app_router.gr.dart';
import 'package:ticketeer/core/styles/app_theme.dart';
import 'package:ticketeer/features/auth/domain/repositories/token_repository.dart';
import 'package:ticketeer/features/theme/theme_cubit/theme_cubit.dart';
import 'package:ticketeer/features/theme/theme_cubit/theme_state.dart';
import 'package:ticketeer/locator.dart';

/// Main widget - entrypoint of the whole app
class App extends StatelessWidget {
  /// Main widget - entrypoint of the whole app
  const App({super.key});

  /// Theme chooser - return ThemeData, depending on what theme var
  /// is passed to the call
  ThemeData _themeChooser(String currentTheme) {
    return currentTheme == darkTheme ? AppTheme.dark : AppTheme.light;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ThemeCubit>()..getCurrentTheme(),
      child: FutureBuilder(
        future: sl<TokenRepository>().getToken(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const CircularProgressIndicator();
          }
          String? token;
          snapshot.data!.fold((l) => token = null, (r) => token = r);
          return BlocBuilder<ThemeCubit, ThemeState>(
            builder: (context, themeState) {
              if (themeState is LoadingThemeState) {
                return const CircularProgressIndicator();
              } else {
                return MaterialApp.router(
                  debugShowCheckedModeBanner: false,
                  builder: BotToastInit(),
                  locale: context.locale,
                  supportedLocales: context.supportedLocales,
                  localizationsDelegates: context.localizationDelegates,
                  theme: _themeChooser(
                    (themeState as LoadedThemeState).currentTheme,
                  ),
                  routerConfig: sl<AppRouter>().config(
                    navigatorObservers: () => [BotToastNavigatorObserver()],
                    initialRoutes: [
                      if (token == null)
                        const WelcomeRoute()
                      else
                        const MainBottomBarRoute()
                    ],
                  ),
                );
              }
            },
          );
        },
      ),
    );
  }
}
