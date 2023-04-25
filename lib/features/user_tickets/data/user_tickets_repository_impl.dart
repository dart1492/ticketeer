import 'package:ticketeer/core/error/request_handler.dart';
import 'package:ticketeer/features/user_tickets/data/user_tickets_datasource.dart';
import 'package:ticketeer/features/user_tickets/domain/entities/ticket.dart';
import 'package:ticketeer/features/user_tickets/domain/repositories/user_tickets_repository.dart';

/// Implementation of the user tickets repo
class UserTicketsRepositoryImpl extends UserTicketsRepository {
  /// Datasource to perform api calls
  final UserTicketsDatasource datasource;

  /// Implementation of the user tickets repo
  UserTicketsRepositoryImpl(this.datasource);

  @override
  FutureFailable<List<Ticket>> getUserTickets() {
    return RepositoryRequestHandler<List<Ticket>>()(
      request: () => datasource.getUserTickets(),
    );
  }
}
