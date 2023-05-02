// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:ticketeer/features/session/domain/entities/room_row.dart';

class Room {
  int id;
  String name;
  List<RoomRow> rows;
  Room({
    required this.id,
    required this.name,
    required this.rows,
  });
}
