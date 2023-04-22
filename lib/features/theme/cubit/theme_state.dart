/// General Theme state
class ThemeState {}

/// State of the app theme
class LoadedThemeState extends ThemeState {
  /// Currently active theme
  String currentTheme;

  /// State of the app theme
  LoadedThemeState({required this.currentTheme});
}

/// State when theme is loading
class LoadingThemeState extends ThemeState {}
