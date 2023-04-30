import 'package:ticketeer/features/full_movie/domain/entities/post_comment.dart';

/// Post comment model - concrete implementation of the post comment entity
class PostCommentModel extends PostComment {
  /// Post comment model - concrete implementation of the post comment entity
  PostCommentModel({
    required super.content,
    required super.rating,
    required super.movieId,
  });

  /// To map conversion
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'content': content,
      'rating': rating,
      'movieId': movieId,
    };
  }

  /// From map conversion
  factory PostCommentModel.fromMap(Map<String, dynamic> map) {
    return PostCommentModel(
      content: map['content'] as String,
      rating: map['rating'] as int,
      movieId: map['movieId'] as int,
    );
  }
}
