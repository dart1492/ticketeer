import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticketeer/core/util/date_time_helper.dart';
import 'package:ticketeer/features/session/domain/repositories/session_repository.dart';
import 'package:ticketeer/features/session/presentation/cubits/cubit/session_state.dart';

/// Is responsible for retrieving available sessions,
/// booking seats and handling
/// query parameters (date)
class SessionCubit extends Cubit<GeneralSessionState> {
  /// repository for actions
  final SessionRepository repo;

  /// Is responsible for retrieving available sessions,
  /// booking seats and handling
  /// query parameters (date)
  SessionCubit(this.repo) : super(GeneralSessionState());

  /// init state with movie id
  void init(int movieId) {
    emit(InitialSessionState(movieId: movieId));
  }

  /// Get a list of session
  Future<void> getSessions() async {
    if (state is InitialSessionState) {
      final prevState = state as InitialSessionState;
      emit(
        LoadingSessionState(movieId: prevState.movieId),
      );

      final date = DateTime.now();
      final result = await repo.getSessions(
        prevState.movieId,
        DateTimeHelper.formatDateTime(
          date,
        ),
      );
      result.fold(
        (l) {
          emit(
            ErrorSessionState(movieId: prevState.movieId),
          );
          getSessions();
        },
        (r) => emit(
          LoadedSessionState(
            sessions: r,
            movieId: prevState.movieId,
            chosenDate: date,
          ),
        ),
      );
    }
  }
}
