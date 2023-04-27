import 'package:ticketeer/core/error/request_handler.dart';
import 'package:ticketeer/features/movies/domain/entities/movie.dart';
import 'package:ticketeer/features/movies/domain/entities/movie_filters.dart';

/// Repository that describes interactions to retrieve
abstract class MoviesRepository {
  /// Get a list of movies suitable for provided query params
  FutureFailable<List<Movie>> getMovies(String searchText, DateTime? date);

  /// set new instance of movie filters to the shared preferences
  FutureFailable<void> setMovieFilters(MovieFilters movieFilters);

  /// get instance of movie filters from the shared preferences
  FutureFailable<MovieFilters?> getMovieFilters();
}
