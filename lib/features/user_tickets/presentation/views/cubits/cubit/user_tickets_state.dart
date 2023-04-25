// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ticketeer/features/user_tickets/domain/entities/ticket.dart';

/// General cubit state
class UserTicketsState {}

/// Initial state for the cubit (on create)
class InitialUserTicketsState extends UserTicketsState {}

/// Loading tickets from the server
class LoadingUserTicketsState extends UserTicketsState {}

/// State of the cubit if loading tickets went wrong
class ErrorLoadingTicketsState extends UserTicketsState {
  String errorMessage;
  ErrorLoadingTicketsState({
    required this.errorMessage,
  });
}

/// State when the list of tickets is loaded
class LoadedUserTicketsState extends UserTicketsState {
  /// list of tickets
  final List<Ticket> tickets;

  /// State when the list of tickets is loaded
  LoadedUserTicketsState(this.tickets);
}
