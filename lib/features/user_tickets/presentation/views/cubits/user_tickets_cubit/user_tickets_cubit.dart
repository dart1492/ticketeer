import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticketeer/features/user_tickets/domain/repositories/user_tickets_repository.dart';
import 'package:ticketeer/features/user_tickets/presentation/views/cubits/user_tickets_cubit/user_tickets_state.dart';

/// Cubit for interacting with user tickets repo
class UserTicketsCubit extends Cubit<UserTicketsState> {
  /// Repository implementation for this cubit
  final UserTicketsRepository repo;

  /// Cubit for interacting with user tickets repo
  UserTicketsCubit(this.repo) : super(UserTicketsState());

  /// Get tickets, that belong to the user
  Future<void> getTickets() async {
    final result = await repo.getUserTickets();
    result.fold(
      (l) => emit(
        ErrorLoadingTicketsState(errorMessage: l.errorMessage),
      ),
      (r) => emit(
        LoadedUserTicketsState(r),
      ),
    );
  }
}
