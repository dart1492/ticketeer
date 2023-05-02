// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:ticketeer/features/session/domain/entities/room.dart';

class Session {
  int id;
  DateTime date;
  String type;
  int minPrice;
  Room room;
  Session({
    required this.id,
    required this.date,
    required this.type,
    required this.minPrice,
    required this.room,
  });
}
