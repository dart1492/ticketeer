import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticketeer/features/session/domain/entities/seat.dart';
import 'package:ticketeer/features/session/presentation/cubits/room_cubit/room_state.dart';

/// Allows us to manage chosen seats
class RoomCubit extends Cubit<GeneralRoomState> {
  /// Allows us to manage chosen seats
  RoomCubit()
      : super(
          GeneralRoomState(
            chosenSeats: [],
          ),
        );

  /// ADd seat to the list of chosen
  void addSeatToChosen(Seat seat) {
    final prevState = state;

    emit(
      GeneralRoomState(
        chosenSeats: [...prevState.chosenSeats, seat],
      ),
    );
  }

  /// remove seat from chosen
  void removeFromChosen(int seatId) {
    final prevState = state;

    prevState.chosenSeats.removeWhere((element) => element.id == seatId);
    final newSeats = prevState.chosenSeats;
    emit(
      GeneralRoomState(
        chosenSeats: newSeats,
      ),
    );
  }
}
