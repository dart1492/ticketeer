import 'package:ticketeer/features/full_movie/data/movie_datasource.dart';
import 'package:ticketeer/features/full_movie/data/movie_repository_impl.dart';
import 'package:ticketeer/features/full_movie/domain/repositories/movie_repository.dart';
import 'package:ticketeer/features/full_movie/presentation/cubits/comment_write_cubit/comment_write_cubit.dart';
import 'package:ticketeer/features/full_movie/presentation/cubits/comments_cubit/comments_cubit.dart';
import 'package:ticketeer/locator.dart';

/// Dependency injection for a one movie repos, sources, etc.
void movieDependencyInjection() {
  sl.registerLazySingleton<MovieDatasource>(
    () => MovieDatasourceImpl(
      sl(),
    ),
  );

  sl.registerLazySingleton<MovieRepository>(
    () => MovieRepositoryImpl(
      sl(),
    ),
  );

  sl.registerFactory<CommentsCubit>(
    () => CommentsCubit(
      sl(),
    ),
  );

  sl.registerFactory<CommentWriteCubit>(
    () => CommentWriteCubit(
      sl(),
    ),
  );
}
