import 'package:ticketeer/features/movies/data/movies_datasource.dart';
import 'package:ticketeer/features/movies/data/movies_repository_impl.dart';
import 'package:ticketeer/features/movies/domain/repositories/movies_repository.dart';
import 'package:ticketeer/features/movies/presentation/cubits/home_movies_cubit/home_movies_cubit.dart';
import 'package:ticketeer/locator.dart';

/// Dependency injection for home feature
void homeDependencyInjection() {
  sl.registerLazySingleton<MoviesDatasource>(
    () => MoviesDatasourceImpl(
      sl(),
      sl(),
    ),
  );

  sl.registerLazySingleton<MoviesRepository>(
    () => MoviesRepositoryImpl(
      sl(),
    ),
  );

  sl.registerFactory<HomeMoviesCubit>(
    () => HomeMoviesCubit(
      sl(),
    ),
  );
}
