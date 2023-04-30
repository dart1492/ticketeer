// ignore_for_file: public_member_api_docs, sort_constructors_first

/// Entity for posting comments, written by the user
class PostComment {
  String content;
  int rating;
  int movieId;
  PostComment({
    required this.content,
    required this.rating,
    required this.movieId,
  });
}
