// ignore_for_file:  sort_constructors_first
// ignore_for_file: public_member_api_docs

import 'package:ticketeer/features/session/domain/entities/seat.dart';

class GeneralRoomState {
  List<Seat> chosenSeats;
  String? errorText;
  bool bookingSuccess;
  GeneralRoomState({
    required this.chosenSeats,
    required this.bookingSuccess,
    this.errorText,
  });
}
