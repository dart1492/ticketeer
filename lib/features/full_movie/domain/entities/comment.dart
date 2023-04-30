// ignore_for_file: public_member_api_docs, sort_constructors_first

class Comment {
  int id;
  String author;
  String content;
  int rating;
  bool isMine;
  Comment({
    required this.id,
    required this.author,
    required this.content,
    required this.rating,
    required this.isMine,
  });
}
