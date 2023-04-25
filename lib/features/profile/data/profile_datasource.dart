import 'package:dio/dio.dart';
import 'package:ticketeer/features/profile/data/models/user_model.dart';
import 'package:ticketeer/features/profile/domain/entities/user.dart';

/// Datasource that interacts with the api
abstract class ProfileDatasource {
  /// Get user object
  Future<User> getUser();

  /// Change username
  Future<void> changeUsername(String newUsername);
}

/// Implementation of the datasource. Requires dio object injected
class ProfileDatasourceImpl extends ProfileDatasource {
  /// Dio object
  final Dio dio;

  /// Implementation of the datasource. Requires dio object injected
  ProfileDatasourceImpl(this.dio);

  @override
  Future<User> getUser() async {
    final result = await dio.get("/api/user");
    // ignore: avoid_dynamic_calls
    return UserModel.fromMap(result.data['data']);
  }

  @override
  Future<void> changeUsername(String newUsername) async {
    await dio.post(
      "/api/user",
      data: {"name": newUsername},
    );
  }
}
