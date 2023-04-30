import 'package:ticketeer/features/full_movie/domain/entities/comment.dart';

/// Concrete implementation of the Comment entity
class CommentModel extends Comment {
  /// Concrete implementation of the Comment entity
  CommentModel({
    required super.id,
    required super.author,
    required super.content,
    required super.rating,
    required super.isMine,
  });

  /// Copy with constructor
  CommentModel copyWith({
    int? id,
    String? author,
    String? content,
    int? rating,
    bool? isMine,
  }) {
    return CommentModel(
      id: id ?? this.id,
      author: author ?? this.author,
      content: content ?? this.content,
      rating: rating ?? this.rating,
      isMine: isMine ?? this.isMine,
    );
  }

  /// To map conversion
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'author': author,
      'content': content,
      'rating': rating,
    };
  }

  /// From map conversion
  factory CommentModel.fromMap(Map<String, dynamic> map) {
    return CommentModel(
      id: map['id'] as int,
      author: map['author'] as String? ?? "",
      content: map['content'] as String,
      rating: map['rating'] as int,
      isMine: map["isMy"] as bool,
    );
  }
}
