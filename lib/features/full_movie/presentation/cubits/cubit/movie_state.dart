// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:ticketeer/features/full_movie/domain/entities/comment.dart';

class MovieState {
  List<Comment> comments;
  bool isLoading;
  String? errorText;
  MovieState({
    required this.comments,
    required this.isLoading,
    this.errorText,
  });

  MovieState copyWith({
    List<Comment>? comments,
    bool? isLoading,
    String? errorText,
  }) {
    return MovieState(
      comments: comments ?? this.comments,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
