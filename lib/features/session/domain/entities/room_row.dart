// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:ticketeer/features/session/domain/entities/seat.dart';

class RoomRow {
  int id;
  int index;
  List<Seat> seats;
  RoomRow({
    required this.id,
    required this.index,
    required this.seats,
  });
}
