import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticketeer/core/util/custom_system_theme.dart';
import 'package:ticketeer/features/theme/cubit/theme_state.dart';
import 'package:ticketeer/features/theme/data/theme_datasource.dart';

/// This cubit controls theme state of the app
class ThemeCubit extends Cubit<ThemeState> {
  /// Datasource gets injected in this bloc
  final ThemeDatasource datasource;

  /// This cubit controls theme state of the app.
  ThemeCubit(this.datasource)
      : super(
          ThemeState(),
        );

  /// Async operation to fetch the current theme from datasource
  ///
  /// Starts by changing cubit state. Fetches "theme" variable.
  /// if it's null -
  ///  decides which theme to put instead using decideFirstTimeTheme()
  /// if it isn't null - emits loaded state with stored theme
  Future<void> getCurrentTheme() async {
    emit(LoadingThemeState());
    final String? result = await datasource.getCurrentTheme();
    if (result == null) {
      final String firstTimeTheme = decideFirstTimeTheme();
      emit(LoadedThemeState(currentTheme: firstTimeTheme));

      // no need to await
      unawaited(datasource.setNewTheme(firstTimeTheme));
    } else {
      emit(
        LoadedThemeState(currentTheme: result),
      );
    }
  }

  /// Sets new theme variable.
  void setNewTheme(String newTheme) {
    emit(LoadedThemeState(currentTheme: newTheme));
    datasource.setNewTheme(newTheme);
  }

  /// theme decider
  String decideFirstTimeTheme() {
    return CustomSystemTheme.isDarkMode ? "dark" : "light";
  }
}
