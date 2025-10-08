import '../entities/user.dart';

abstract class AuthRepository {
  Future<User> login(String username, String password);
  Future<bool> isAuthenticated();
  Future<void> logout();
}
