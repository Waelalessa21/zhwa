import '../../data/data_sources/api_client.dart';
import '../../data/models/user_model.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final ApiClient _apiClient;

  AuthRepositoryImpl(this._apiClient);

  @override
  Future<User> login(String username, String password) async {
    final authResponse = await _apiClient.login(username, password);
    return _mapUserModelToEntity(authResponse.user);
  }

  @override
  Future<bool> isAuthenticated() async {
    return await _apiClient.isAuthenticated();
  }

  @override
  Future<void> logout() async {
    await _apiClient.logout();
  }

  User _mapUserModelToEntity(UserModel model) {
    return User(
      username: model.username,
      type: model.type,
      id: model.id,
      isActive: model.isActive,
      createdAt: model.createdAt,
      updatedAt: model.updatedAt,
    );
  }
}
