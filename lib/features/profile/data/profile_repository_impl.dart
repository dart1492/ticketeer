import 'package:ticketeer/core/error/request_handler.dart';
import 'package:ticketeer/features/profile/data/profile_datasource.dart';
import 'package:ticketeer/features/profile/domain/entities/user.dart';
import 'package:ticketeer/features/profile/domain/repositories/profile_repository.dart';

/// Implementation of the profile repo
class ProfileRepositoryImpl extends ProfileRepository {
  /// Profile datasource
  final ProfileDatasource datasource;

  /// Implementation of the profile repo
  ProfileRepositoryImpl(this.datasource);
  @override
  FutureFailable<User> getUser() {
    return RepositoryRequestHandler<User>()(
      request: () => datasource.getUser(),
    );
  }

  @override
  FutureFailable<void> changeUsername(String newUsername) {
    return RepositoryRequestHandler()(
      request: () => datasource.changeUsername(newUsername),
    );
  }
}
