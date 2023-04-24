import 'package:ticketeer/features/theme/data/theme_datasource.dart';
import 'package:ticketeer/features/theme/data/theme_repository_impl.dart';
import 'package:ticketeer/features/theme/domain/theme_repository.dart';
import 'package:ticketeer/features/theme/theme_cubit/theme_cubit.dart';
import 'package:ticketeer/locator.dart';

/// Dependency injection for theme feature (cubit, repo and datasource)
void themeDependencyInjection() {
  sl.registerSingleton<ThemeDatasource>(
    ThemeDatasourceImpl(
      sl(),
    ),
  );

  sl.registerSingleton<ThemeRepository>(
    ThemeRepositoryImpl(
      sl(),
    ),
  );

  sl.registerFactory(
    () => ThemeCubit(
      sl(),
    ),
  );
}
