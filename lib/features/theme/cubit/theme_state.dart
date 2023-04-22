class ThemeState {}

/// State of the app theme
class LoadedThemeState extends ThemeState {
  /// Currently active theme
  String currentTheme;

  /// State of the app theme
  LoadedThemeState({required this.currentTheme});
}

class LoadingThemeState extends ThemeState {}
