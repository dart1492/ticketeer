import 'package:ticketeer/core/error/request_handler.dart';
import 'package:ticketeer/features/session/domain/entities/payment_credentials.dart';
import 'package:ticketeer/features/session/domain/entities/session.dart';

/// Repository, responsible for getting session to the movie, booking seats and
/// buying tickets
abstract class SessionRepository {
  /// Get session
  FutureFailable<List<Session>> getSessions(int movieId, String date);

  /// Book available seats
  FutureFailable<void> bookSeats(List<int> seatIds, int sessionId);

  /// Buy tickets on the movie
  FutureFailable<void> buyTickets(
    List<int> seatIds,
    int sessionId,
    PaymentCredentials credentials,
  );
}
