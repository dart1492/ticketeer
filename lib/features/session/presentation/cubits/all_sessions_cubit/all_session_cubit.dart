import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticketeer/core/util/date_time_helper.dart';
import 'package:ticketeer/features/session/domain/repositories/session_repository.dart';
import 'package:ticketeer/features/session/presentation/cubits/all_sessions_cubit/all_sessions_state.dart';

/// Is responsible for retrieving a list of sessions for chosen date
class AllSessionsCubit extends Cubit<GeneralAllSessionsState> {
  /// repository for actions
  final SessionRepository repo;

  /// Is responsible for retrieving available sessions,
  /// booking seats and handling
  /// query parameters (date)
  AllSessionsCubit(this.repo)
      : super(
          GeneralAllSessionsState(
            sessions: [],
            movieId: 0,
            chosenDate: DateTime.now(),
            isLoading: false,
            isError: false,
          ),
        );

  /// init state with movie id to get sessions for current date
  Future<void> init(int movieId) async {
    emit(
      state.copyWith(movieId: movieId),
    );
    await getSessionsNewDate(state.chosenDate);
  }

  /// Get a list of sessions for new chosen date
  Future<void> getSessionsNewDate(DateTime date) async {
    emit(
      state.copyWith(isLoading: true, chosenDate: date),
    );

    final result = await repo.getSessions(
      state.movieId,
      DateTimeHelper.formatDateTime(
        state.chosenDate,
      ),
    );

    result.fold(
      (l) => emit(
        state.copyWith(
          isError: true,
          isLoading: false,
        ),
      ),
      (r) => emit(
        state.copyWith(
          sessions: r,
          isLoading: false,
          chosenDate: date,
        ),
      ),
    );
  }
}
