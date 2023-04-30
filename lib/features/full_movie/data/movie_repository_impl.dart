import 'package:ticketeer/core/error/request_handler.dart';
import 'package:ticketeer/features/full_movie/data/movie_datasource.dart';
import 'package:ticketeer/features/full_movie/domain/entities/comment.dart';
import 'package:ticketeer/features/full_movie/domain/repositories/movie_repository.dart';

/// REpository that is responsible for creating/loading/deleting comments for movies,
/// as well as retrieving sessions of
class MovieRepositoryImpl extends MovieRepository {
  /// datasource
  final MovieDatasource datasource;

  /// REpository that is responsible for creating/loading/deleting comments for movies,
  /// as well as retrieving sessions of
  MovieRepositoryImpl(this.datasource);
  @override
  FutureFailable<void> deleteComment(int id) {
    return RepositoryRequestHandler()(
      request: () => datasource.deleteComment(id),
    );
  }

  @override
  FutureFailable<List<Comment>> getComments(int movieId) {
    return RepositoryRequestHandler<List<Comment>>()(
      request: () => datasource.getComments(movieId),
    );
  }

  @override
  FutureFailable<void> postComment(Comment comment) {
    return RepositoryRequestHandler()(
      request: () => datasource.postComment(comment),
    );
  }
}
