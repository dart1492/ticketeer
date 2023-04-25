import 'package:ticketeer/features/profile/data/profile_datasource.dart';
import 'package:ticketeer/features/profile/data/profile_repository_impl.dart';
import 'package:ticketeer/features/profile/domain/repositories/profile_repository.dart';
import 'package:ticketeer/features/profile/presentation/cubits/profile_cubit/profile_cubit.dart';
import 'package:ticketeer/locator.dart';

/// Setup dependencies for profile
void profileDependencyInjection() {
  sl.registerLazySingleton<ProfileDatasource>(
    () => ProfileDatasourceImpl(
      sl(),
    ),
  );

  sl.registerLazySingleton<ProfileRepository>(
    () => ProfileRepositoryImpl(
      sl(),
    ),
  );

  sl.registerFactory<ProfileCubit>(
    () => ProfileCubit(
      sl(),
    ),
  );
}
