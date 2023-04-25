import 'package:dio/dio.dart';
import 'package:ticketeer/features/user_tickets/data/models/ticket_model.dart';
import 'package:ticketeer/features/user_tickets/domain/entities/ticket.dart';

/// Datasource that interacts with api to get a list of tickets
abstract class UserTicketsDatasource {
  /// Get list of user tickets
  Future<List<Ticket>> getUserTickets();
}

/// Implementation of the user tickets datasource
class UserTicketsDatasourceImpl extends UserTicketsDatasource {
  /// Dio object
  final Dio dio;

  /// Implementation of the user tickets datasource
  UserTicketsDatasourceImpl(this.dio);

  @override
  Future<List<Ticket>> getUserTickets() async {
    final result = await dio.get("/api/user/tickets");
    // ignore: avoid_dynamic_calls
    final mapList = result.data['data'] as List<dynamic>;
    final List<Ticket> returnList = [];
    for (final Map<String, dynamic> map in mapList) {
      returnList.add(TicketModel.fromMap(map));
    }
    return returnList;
  }
}
