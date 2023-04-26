import 'package:ticketeer/features/home/data/movies_datasource.dart';
import 'package:ticketeer/features/home/data/movies_repository_impl.dart';
import 'package:ticketeer/features/home/domain/repositories/movies_repository.dart';
import 'package:ticketeer/features/home/presentation/cubits/cubit/home_cubit.dart';
import 'package:ticketeer/locator.dart';

/// Dependency injection for home feature
void homeDependencyInjection() {
  sl.registerLazySingleton<MoviesDatasource>(
    () => MoviesDatasourceImpl(
      sl(),
    ),
  );

  sl.registerLazySingleton<MoviesRepository>(
    () => MoviesRepositoryImpl(
      sl(),
    ),
  );

  sl.registerFactory<HomeCubit>(
    () => HomeCubit(
      sl(),
    ),
  );
}
