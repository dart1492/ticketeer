// ignore_for_file:  sort_constructors_first
// ignore_for_file: public_member_api_docs

import 'package:ticketeer/features/session/domain/entities/session.dart';

class GeneralAllSessionsState {
  List<Session> sessions;
  DateTime chosenDate;
  int movieId;
  bool isLoading;
  bool isError;

  GeneralAllSessionsState({
    required this.sessions,
    required this.chosenDate,
    required this.movieId,
    required this.isLoading,
    required this.isError,
  });

  GeneralAllSessionsState copyWith({
    List<Session>? sessions,
    DateTime? chosenDate,
    int? movieId,
    bool? isLoading,
    bool? isError,
  }) {
    return GeneralAllSessionsState(
      sessions: sessions ?? this.sessions,
      chosenDate: chosenDate ?? this.chosenDate,
      movieId: movieId ?? this.movieId,
      isLoading: isLoading ?? this.isLoading,
      isError: isError ?? this.isError,
    );
  }
}
