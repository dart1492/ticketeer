// ignore_for_file:  sort_constructors_first
// ignore_for_file: public_member_api_docs

import 'package:ticketeer/features/session/domain/entities/session.dart';

class GeneralSessionState {}

class InitialSessionState extends GeneralSessionState {
  int movieId;
  InitialSessionState({
    required this.movieId,
  });
}

class LoadingSessionState extends InitialSessionState {
  LoadingSessionState({required super.movieId});
}

class ErrorSessionState extends InitialSessionState {
  ErrorSessionState({required super.movieId});
}

class LoadedSessionState extends InitialSessionState {
  List<Session> sessions;
  DateTime chosenDate;
  LoadedSessionState({
    required this.sessions,
    required super.movieId,
    required this.chosenDate,
  });

  LoadedSessionState copyWith({
    List<Session>? sessions,
    int? movieId,
    DateTime? chosenDate,
  }) {
    return LoadedSessionState(
      sessions: sessions ?? this.sessions,
      movieId: movieId ?? this.movieId,
      chosenDate: chosenDate ?? this.chosenDate,
    );
  }
}
