import 'package:dio/dio.dart';
import 'package:ticketeer/features/full_movie/data/models/comment_model.dart';
import 'package:ticketeer/features/full_movie/data/models/post_comment_model.dart';
import 'package:ticketeer/features/full_movie/domain/entities/comment.dart';
import 'package:ticketeer/features/full_movie/domain/entities/post_comment.dart';

/// Datasource that is responsible for creating/loading/deleting comments for movies,
/// as well as retrieving sessions of
abstract class MovieDatasource {
  /// get a list of comments for a movie
  Future<List<Comment>> getComments(int movieId);

  /// Post new comment
  Future<void> postComment(PostComment comment);

  /// Delete comment by id (only if it was user who created the comment)
  Future<void> deleteComment(int id);
}

/// Datasource that is responsible for creating/loading/deleting comments for movies,
/// as well as retrieving sessions of
class MovieDatasourceImpl extends MovieDatasource {
  /// Dio object
  final Dio dio;

  /// Datasource that is responsible for creating/loading/deleting comments for movies,
  /// as well as retrieving sessions of
  MovieDatasourceImpl(this.dio);

  @override
  Future<void> deleteComment(int id) async {
    await dio.delete("/api/movies/comments/$id");
  }

  @override
  Future<List<Comment>> getComments(int movieId) async {
    final result = await dio.get("/api/movies/comments?movieId=$movieId");
    // ignore: avoid_dynamic_calls
    final mappedList = result.data['data'] as List<dynamic>;

    final List<Comment> resultingList = [];

    for (int i = 0; i < mappedList.length; i++) {
      resultingList.add(
        CommentModel.fromMap(mappedList[i] as Map<String, dynamic>),
      );
    }

    return resultingList;
  }

  @override
  Future<void> postComment(PostComment comment) async {
    await dio.post(
      "/api/movies/comments",
      data: (comment as PostCommentModel).toMap(),
    );
  }
}
