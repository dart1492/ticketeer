import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:system_theme/system_theme.dart';
import 'package:ticketeer/features/theme/cubit/theme_state.dart';
import 'package:ticketeer/features/theme/data/theme_datasource.dart';

/// This cubit controls theme state of the app
class ThemeCubit extends Cubit<ThemeState> {
  final ThemeDatasource datasource;

  /// This cubit controls theme state of the app. Starter theme will be stored
  /// in the hive database and retrieved when the app starts
  ThemeCubit(this.datasource)
      : super(
          ThemeState(),
        );

  Future<void> getCurrentTheme() async {
    emit(LoadingThemeState());
    String? result = await datasource.getCurrentTheme();
    if (result == null) {
      String firstTimeTheme = decideFirstTimeTheme();
      emit(LoadedThemeState(currentTheme: firstTimeTheme));
      datasource.setNewTheme(firstTimeTheme);
    } else {
      emit(
        LoadedThemeState(currentTheme: result),
      );
    }
  }

  void setNewTheme(String newTheme) {
    emit(LoadedThemeState(currentTheme: newTheme));
    datasource.setNewTheme(newTheme);
  }

  String decideFirstTimeTheme() {
    return SystemTheme.isDarkMode ? 'dark' : 'light';
  }
}
