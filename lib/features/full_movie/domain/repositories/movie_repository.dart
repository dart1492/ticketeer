import 'package:ticketeer/core/error/request_handler.dart';
import 'package:ticketeer/features/full_movie/domain/entities/comment.dart';

/// REpository that is responsible for creating/loading/deleting comments for movies,
/// as well as retrieving sessions of
abstract class MovieRepository {
  /// Get comments
  FutureFailable<List<Comment>> getComments(int movieId);

  /// Delete comment
  FutureFailable<void> deleteComment(int id);

  /// Post comment
  FutureFailable<void> postComment(Comment comment);
}
