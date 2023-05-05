import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticketeer/features/session/domain/entities/seat.dart';
import 'package:ticketeer/features/session/domain/repositories/session_repository.dart';
import 'package:ticketeer/features/session/presentation/cubits/room_cubit/room_state.dart';

/// Allows us to manage chosen seats
class RoomCubit extends Cubit<GeneralRoomState> {
  /// repository
  final SessionRepository repo;

  /// Allows us to manage chosen seats
  RoomCubit(
    this.repo,
  ) : super(
          GeneralRoomState(
            bookingSuccess: false,
            chosenSeats: [],
          ),
        );

  /// ADd seat to the list of chosen
  void addSeatToChosen(Seat seat) {
    final prevState = state;

    emit(
      GeneralRoomState(
        bookingSuccess: false,
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
        bookingSuccess: false,
        chosenSeats: newSeats,
      ),
    );
  }

  /// book chosen seats
  Future<void> bookSeats(int sessionId) async {
    if (state.chosenSeats.isEmpty) {
      return;
    }

    final result = await repo.bookSeats(
      state.chosenSeats.map((e) => e.id).toList(),
      sessionId,
    );

    result.fold(
      (l) {
        emit(
          GeneralRoomState(
            bookingSuccess: false,
            chosenSeats: state.chosenSeats,
            errorText: l.errorMessage,
          ),
        );
        emit(
          GeneralRoomState(
            bookingSuccess: false,
            chosenSeats: state.chosenSeats,
            errorText: null,
          ),
        );
      },
      (r) => emit(
        GeneralRoomState(
          bookingSuccess: true,
          chosenSeats: state.chosenSeats,
        ),
      ),
    );
  }
}
