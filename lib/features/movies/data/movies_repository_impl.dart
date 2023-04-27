import 'package:ticketeer/core/error/request_handler.dart';
import 'package:ticketeer/features/movies/data/movies_datasource.dart';
import 'package:ticketeer/features/movies/domain/entities/movie.dart';
import 'package:ticketeer/features/movies/domain/entities/movie_filters.dart';
import 'package:ticketeer/features/movies/domain/repositories/movies_repository.dart';

/// Implementation of the movies datasource
class MoviesRepositoryImpl extends MoviesRepository {
  /// Datasource object
  final MoviesDatasource datasource;

  /// Implementation of the movies datasource
  MoviesRepositoryImpl(this.datasource);

  @override
  FutureFailable<List<Movie>> getMovies(String searchText, DateTime? date) {
    return RepositoryRequestHandler<List<Movie>>()(
      request: () => datasource.getMovies(searchText, date),
    );
  }

  @override
  FutureFailable<MovieFilters?> getMovieFilters() {
    return RepositoryRequestHandler<MovieFilters?>()(
      request: () => datasource.getMovieFilters(),
    );
  }

  @override
  FutureFailable<void> setMovieFilters(MovieFilters movieFilters) {
    return RepositoryRequestHandler()(
      request: () => datasource.setMovieFilters(movieFilters),
    );
  }
}
