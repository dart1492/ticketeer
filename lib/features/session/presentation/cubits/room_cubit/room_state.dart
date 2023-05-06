// ignore_for_file:  sort_constructors_first
// ignore_for_file: public_member_api_docs

import 'package:ticketeer/features/session/domain/entities/seat.dart';
import 'package:ticketeer/features/session/domain/entities/session.dart';

class GeneralRoomState {}

class LoadingRoomState extends GeneralRoomState {}

class LoadedRoomState extends GeneralRoomState {
  final Session session;
  final List<Seat> chosenSeats;
  LoadedRoomState({
    required this.session,
    required this.chosenSeats,
  });

  LoadedRoomState copyWith({
    Session? session,
    List<Seat>? chosenSeats,
  }) {
    return LoadedRoomState(
      session: session ?? this.session,
      chosenSeats: chosenSeats ?? this.chosenSeats,
    );
  }
}

class ErrorRoomState extends GeneralRoomState {}

class SuccessRoomState extends GeneralRoomState {
  List<Seat> chosenSeats;
  SuccessRoomState({
    required this.chosenSeats,
  });
}

//   List<Seat> chosenSeats;
//   String? errorText;
//   bool bookingSuccess;
//   bool isLoading;

//   Session? sessionObj;

//   GeneralRoomState({
//     required this.chosenSeats,
//     this.errorText,
//     required this.bookingSuccess,
//     required this.isLoading,
//     this.sessionObj,
//   });

//   GeneralRoomState copyWith({
//     List<Seat>? chosenSeats,
//     String? errorText,
//     bool? bookingSuccess,
//     bool? isLoading,
//     Session? sessionObj,
//   }) {
//     return GeneralRoomState(
//       chosenSeats: chosenSeats ?? this.chosenSeats,
//       errorText: errorText ?? this.errorText,
//       bookingSuccess: bookingSuccess ?? this.bookingSuccess,
//       isLoading: isLoading ?? this.isLoading,
//       sessionObj: sessionObj ?? this.sessionObj,
//     );
//   }
// }
