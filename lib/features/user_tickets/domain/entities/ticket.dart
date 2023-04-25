// ignore_for_file: public_member_api_docs, sort_constructors_first
class Ticket {
  int id;
  int movieId;
  String name;
  String imageLink;
  String smallImageLink;
  Ticket({
    required this.id,
    required this.movieId,
    required this.name,
    required this.imageLink,
    required this.smallImageLink,
  });
}
