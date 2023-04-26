import 'package:ticketeer/features/user_tickets/data/user_tickets_datasource.dart';
import 'package:ticketeer/features/user_tickets/data/user_tickets_repository_impl.dart';
import 'package:ticketeer/features/user_tickets/domain/repositories/user_tickets_repository.dart';
import 'package:ticketeer/features/user_tickets/presentation/cubits/user_tickets_cubit/user_tickets_cubit.dart';
import 'package:ticketeer/locator.dart';

/// Setup dependencies for user tickets feature
void userTicketsDependencyInjection() {
  sl.registerLazySingleton<UserTicketsDatasource>(
    () => UserTicketsDatasourceImpl(
      sl(),
    ),
  );

  sl.registerLazySingleton<UserTicketsRepository>(
    () => UserTicketsRepositoryImpl(
      sl(),
    ),
  );

  sl.registerFactory(
    () => UserTicketsCubit(
      sl(),
    ),
  );
}
