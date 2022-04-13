import 'package:shared_preferences/shared_preferences.dart';

import '../models/user.dart';
import '../../domain/repository/local_repository.dart';

const prefToken = 'TOKEN';
const prefFullName = 'FULLNAME';

class LocalRepositoryImplement extends LocalRepositoryInterface {
  @override
  Future<void> clearAllData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.clear();
  }

  @override
  Future<String?> getToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(prefToken);
  }

  @override
  Future<User?> getUser() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final fullname = sharedPreferences.getString(prefFullName);
    final user = User(fullName: fullname);
    return user;
  }

  @override
  Future<void> setToken(String? token) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(prefToken, token!);
  }

  @override
  Future<User?> setUser(User? user) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(prefFullName, user!.fullName!);
    return user;
  }
}
