// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: eol_at_end_of_file

class Seat {
  int id;
  int index;
  SeatTypes type;
  int price;
  bool isAvailable;
  Seat({
    required this.id,
    required this.index,
    required this.price,
    required this.isAvailable,
    required this.type,
  });
}

enum SeatTypes { normal, better, vip }
