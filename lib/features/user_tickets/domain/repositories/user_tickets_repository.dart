import 'package:ticketeer/core/error/request_handler.dart';
import 'package:ticketeer/features/user_tickets/domain/entities/ticket.dart';

/// User ticket repository that is responsible for getting all tickets,
///  active for the given user
abstract class UserTicketsRepository {
  /// get a list of user tickets
  FutureFailable<List<Ticket>> getUserTickets();
}
