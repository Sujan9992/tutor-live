import 'package:flutter/foundation.dart';
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
    debugPrint('-------------------');
    debugPrint('$prefToken {local_repository_implementation - getToken}');
    debugPrint(
        '${sharedPreferences.getString(prefToken)} {local_repository_implementation - getToken}');
    debugPrint('-------------------');
    return sharedPreferences.getString(prefToken);
  }

  @override
  Future<User?> getUser() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final fullname = sharedPreferences.getString(prefFullName);
    final user = User(fullName: fullname);
    debugPrint('-------------------');
    debugPrint('$prefFullName {local_repository_implementation - getUser}');
    debugPrint('$fullname {local_repository_implementation - getUser}');
    debugPrint('-------------------');
    return user;
  }

  @override
  Future<void> setToken(String? token) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(prefToken, token!);
    debugPrint('-------------------');
    debugPrint('$prefToken {local_repository_implementation - setToken}');
    debugPrint('$token {local_repository_implementation - setToken}');
    debugPrint('-------------------');
  }

  @override
  Future<User?> setUser(User? user) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(prefFullName, user!.fullName!);
    debugPrint('-------------------');
    debugPrint('$prefFullName {local_repository_implementation - setUser}');
    debugPrint('${user.fullName!} {local_repository_implementation - setUser}');
    debugPrint('-------------------');
    return user;
  }
}
