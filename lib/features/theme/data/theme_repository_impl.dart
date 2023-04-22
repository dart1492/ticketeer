import 'package:ticketeer/core/error/failure.dart';
import 'package:ticketeer/core/error/request_handler.dart';
import 'package:ticketeer/features/theme/data/theme_datasource.dart';
import 'package:ticketeer/features/theme/repository/theme_repository.dart';

/// Implementation of the Theme repository. Here any errors that might occur
/// while interacting with the datasource will be caught
class ThemeRepositoryImpl extends ThemeRepository {
  /// Datasource
  final ThemeDatasource datasource;

  /// Implementation of the Theme repository. Here any errors that might occur
  /// while interacting with the datasource will be caught
  ThemeRepositoryImpl(this.datasource);

  @override
  FutureFailable<String?> getCurrentTheme() {
    return RepositoryRequestHandler<String?>()(
      request: () => datasource.getCurrentTheme(),
      defaultFailure: Failure(errorMessage: "Couldn't retrieve saved theme"),
    );
  }

  @override
  FutureFailable<void> setNewTheme(String newTheme) {
    return RepositoryRequestHandler<void>()(
      request: () => datasource.setNewTheme(newTheme),
      defaultFailure: Failure(errorMessage: "Couldn't set new theme"),
    );
  }
}
