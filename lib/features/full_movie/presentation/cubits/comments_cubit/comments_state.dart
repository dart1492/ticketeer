// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:ticketeer/features/full_movie/domain/entities/comment.dart';

class GeneralCommentsState {}

class LoadedCommentsState extends GeneralCommentsState {
  List<Comment> comments;
  int movieId;
  LoadedCommentsState({
    required this.comments,
    required this.movieId,
  });
}

class LoadingCommentsState extends GeneralCommentsState {}

class ErrorCommentsState extends GeneralCommentsState {
  final String errorText;

  ErrorCommentsState(this.errorText);
}
