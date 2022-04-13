import '../../modules/auth/model/user.dart';

abstract class LocalRepositoryInterface {
  Future<String?> getToken();
  Future<void> setToken(String? token);
  Future<void> clearAllData();
  Future<User?> getUser();
  Future<User?> setUser(User? user);
}
