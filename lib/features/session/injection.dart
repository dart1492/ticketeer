import 'package:ticketeer/features/session/data/session_datasource.dart';
import 'package:ticketeer/features/session/data/session_repository_impl.dart';
import 'package:ticketeer/features/session/domain/repositories/session_repository.dart';
import 'package:ticketeer/features/session/presentation/cubits/all_sessions_cubit/all_session_cubit.dart';
import 'package:ticketeer/features/session/presentation/cubits/room_cubit/room_cubit.dart';
import 'package:ticketeer/locator.dart';

/// Injection for session feature
void sessionDependencyInjection() {
  sl.registerLazySingleton<SessionDatasource>(
    () => SessionDatasourceImpl(
      sl(),
    ),
  );

  sl.registerLazySingleton<SessionRepository>(
    () => SessionRepositoryImpl(
      sl(),
    ),
  );

  sl.registerFactory(
    () => AllSessionsCubit(
      sl(),
    ),
  );

  sl.registerFactory(
    () => RoomCubit(),
  );
}
