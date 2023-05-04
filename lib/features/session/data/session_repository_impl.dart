import 'package:ticketeer/core/error/failure.dart';
import 'package:ticketeer/core/error/request_handler.dart';
import 'package:ticketeer/features/session/data/session_datasource.dart';
import 'package:ticketeer/features/session/domain/entities/payment_credentials.dart';
import 'package:ticketeer/features/session/domain/entities/session.dart';
import 'package:ticketeer/features/session/domain/repositories/session_repository.dart';

/// Concrete implementation of the session repository
class SessionRepositoryImpl extends SessionRepository {
  /// datasource obj
  final SessionDatasource datasource;

  /// Concrete implementation of the session repository
  SessionRepositoryImpl(this.datasource);

  @override
  FutureFailable<void> bookSeats(List<int> seatIds, int sessionId) {
    return RepositoryRequestHandler()(
      request: () => datasource.bookSeats(seatIds, sessionId),
    );
  }

  @override
  FutureFailable<void> buyTickets(
    List<int> seatIds,
    int sessionId,
    PaymentCredentials credentials,
  ) {
    return RepositoryRequestHandler()(
      request: () => datasource.buyTickets(seatIds, sessionId, credentials),
      defaultFailure: Failure(
        errorMessage: "Wrong payment credentials",
      ),
    );
  }

  @override
  FutureFailable<List<Session>> getSessions(int movieId, String date) {
    return RepositoryRequestHandler<List<Session>>()(
      request: () => datasource.getSession(movieId, date),
    );
  }
}
