import 'package:ticketeer/core/error/request_handler.dart';
import 'package:ticketeer/features/home/data/movies_datasource.dart';
import 'package:ticketeer/features/home/domain/entities/movie.dart';
import 'package:ticketeer/features/home/domain/repositories/movies_repository.dart';

/// Implementation of the movies datasource
class MoviesRepositoryImpl extends MoviesRepository {
  /// Datasource object
  final MoviesDatasource datasource;

  /// Implementation of the movies datasource
  MoviesRepositoryImpl(this.datasource);

  @override
  FutureFailable<List<Movie>> getMovies(String searchText, DateTime date) {
    return RepositoryRequestHandler<List<Movie>>()(
      request: () => datasource.getMovies(searchText, date),
    );
  }
}
