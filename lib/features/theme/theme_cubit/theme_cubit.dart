import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticketeer/features/theme/domain/theme_repository.dart';
import 'package:ticketeer/features/theme/theme_cubit/theme_state.dart';

/// This cubit controls theme state of the app
class ThemeCubit extends Cubit<ThemeState> {
  /// Datasource gets injected in this bloc
  final ThemeRepository repo;

  /// This cubit controls theme state of the app.
  ThemeCubit(this.repo)
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
    final result = await repo.getCurrentTheme();

    result.fold(
      // On any failure just set dark theme
      (l) => emit(
        LoadedThemeState(currentTheme: "dark"),
      ),
      (r) {
        if (r == null) {
          final String firstTimeTheme = _decideFirstTimeTheme();
          emit(LoadedThemeState(currentTheme: firstTimeTheme));

          // no need to await
          unawaited(repo.setNewTheme(firstTimeTheme));
        } else {
          emit(
            LoadedThemeState(currentTheme: r),
          );
        }
      },
    );
  }

  /// Sets new theme variable.
  void setNewTheme(String newTheme) {
    emit(LoadedThemeState(currentTheme: newTheme));
    repo.setNewTheme(newTheme);
  }

  /// theme decider
  String _decideFirstTimeTheme() {
    return "dark";

    // return CustomSystemTheme.isDarkMode ? "dark" : "light";
  }
}
