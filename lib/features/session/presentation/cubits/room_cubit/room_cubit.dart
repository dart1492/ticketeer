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
          GeneralRoomState(),
        );

  /// ADd seat to the list of chosen
  void addSeatToChosen(Seat seat) {
    if (state is LoadedRoomState) {
      final prevState = state as LoadedRoomState;

      emit(
        prevState.copyWith(
          chosenSeats: [...prevState.chosenSeats, seat],
        ),
      );
    }
  }

  /// remove seat from chosen
  void removeFromChosen(int seatId) {
    if (state is LoadedRoomState) {
      final prevState = state as LoadedRoomState;
      prevState.chosenSeats.removeWhere((element) => element.id == seatId);

      emit(
        LoadedRoomState(
          session: prevState.session,
          chosenSeats: prevState.chosenSeats,
        ),
      );
    }
  }

  /// book chosen seats
  Future<void> bookSeats(int sessionId) async {
    if (state is LoadedRoomState) {
      final prevState = state as LoadedRoomState;
      if (prevState.chosenSeats.isEmpty) {
        return;
      }
      emit(LoadingRoomState());
      final result = await repo.bookSeats(
        prevState.chosenSeats.map((e) => e.id).toList(),
        sessionId,
      );

      result.fold(
        (l) {
          emit(
            ErrorRoomState(),
          );
        },
        (r) {
          emit(
            SuccessRoomState(chosenSeats: prevState.chosenSeats),
          );
          emit(
            LoadedRoomState(
              session: prevState.session,
              chosenSeats: prevState.chosenSeats,
            ),
          );
        },
      );
    }
  }

  /// Get session by Id
  Future<void> getSession(int sessionId) async {
    emit(LoadingRoomState());
    final result = await repo.getSessionById(sessionId);
    result.fold(
      (l) => emit(
        ErrorRoomState(),
      ),
      (r) => emit(
        LoadedRoomState(
          session: r,
          chosenSeats: [],
        ),
      ),
    );
  }
}
