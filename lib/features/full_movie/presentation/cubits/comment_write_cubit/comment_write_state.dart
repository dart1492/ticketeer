// ignore_for_file:  sort_constructors_first
// ignore_for_file: public_member_api_docs

class GeneralCommentWriteState {}

class CreatingCommentWriteState extends GeneralCommentWriteState {
  String commentText;
  double rating;
  int movieId;
  CreatingCommentWriteState({
    required this.commentText,
    required this.rating,
    required this.movieId,
  });

  CreatingCommentWriteState copyWith({
    String? commentText,
    double? rating,
    int? movieId,
  }) {
    return CreatingCommentWriteState(
      commentText: commentText ?? this.commentText,
      rating: rating ?? this.rating,
      movieId: movieId ?? this.movieId,
    );
  }
}

class ErrorWritingCommentState extends GeneralCommentWriteState {
  final String errorMessage;
  ErrorWritingCommentState({
    required this.errorMessage,
  });
}

class SuccessWritingCommentState extends GeneralCommentWriteState {}
