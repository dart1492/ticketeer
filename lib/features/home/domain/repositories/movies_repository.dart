import 'package:ticketeer/core/error/request_handler.dart';
import 'package:ticketeer/features/home/domain/entities/movie.dart';

/// Repository that describes interactions to retrieve
abstract class MoviesRepository {
  /// Get a list of movies suitable for provided query params
  FutureFailable<List<Movie>> getMovies(String searchText, DateTime date);
}
