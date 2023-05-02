import 'package:dio/dio.dart';
import 'package:ticketeer/features/session/data/models/payment_credentials_model.dart';
import 'package:ticketeer/features/session/data/models/session_model.dart';
import 'package:ticketeer/features/session/domain/entities/payment_credentials.dart';
import 'package:ticketeer/features/session/domain/entities/session.dart';

/// Datasource to interact with the api and get sessions, book, buy tickets
abstract class SessionDatasource {
  /// Get available sessions
  Future<List<Session>> getSession(int movieId, String date);

  /// Book seats for 15 min
  Future<void> bookSeats(List<int> seatIds, int sessionId);

  /// Buy tickets for chosen seats
  Future<void> buyTickets(
    List<int> seatIds,
    int sessionId,
    PaymentCredentials credentials,
  );
}

/// Datasource to interact with the api and get sessions, book, buy tickets
class SessionDatasourceImpl extends SessionDatasource {
  /// Dio object
  final Dio dio;

  /// Datasource to interact with the api and get sessions, book, buy tickets
  SessionDatasourceImpl(this.dio);
  @override
  Future<void> bookSeats(List<int> seatIds, int sessionId) async {
    await dio.post(
      "/api/movies/book",
      data: {
        "seats": seatIds,
        "sessionId": sessionId,
      },
    );
  }

  @override
  Future<void> buyTickets(
    List<int> seatIds,
    int sessionId,
    PaymentCredentials credentials,
  ) async {
    await dio.post(
      "/api/movies/buy",
      data: {
        "seats": seatIds,
        "sessionId": sessionId,
        ...(credentials as PaymentCredentialsModel).toMap(),
      },
    );
  }

  @override
  Future<List<Session>> getSession(int movieId, String date) async {
    final response =
        await dio.get("/api/movies/sessions?movieId=$movieId&date=$date");

    // ignore: avoid_dynamic_calls
    final sessionDynamic = response.data['data'] as List<dynamic>;

    final List<Session> result = [];
    for (int i = 0; i < sessionDynamic.length; i++) {
      result.add(
        SessionModel.fromMap(
          sessionDynamic[i],
        ),
      );
    }

    return result;
  }
}
