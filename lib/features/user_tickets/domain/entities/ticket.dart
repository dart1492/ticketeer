// ignore_for_file: public_member_api_docs, sort_constructors_first
class Ticket {
  int id;
  int movieId;
  String name;
  DateTime date;
  String imageLink;
  String smallImageLink;
  int rowIndex;
  int seatIndex;

  Ticket({
    required this.id,
    required this.movieId,
    required this.name,
    required this.date,
    required this.imageLink,
    required this.smallImageLink,
    required this.rowIndex,
    required this.seatIndex,
  });
}
