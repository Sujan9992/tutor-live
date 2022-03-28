import 'package:shared_preferences/shared_preferences.dart';

import '../models/user.dart';
import '../../domain/repository/local_repository.dart';

const prefToken = 'TOKEN';
const prefFullName = 'FULLNAME';

class LocalRepositoryImplement extends LocalRepositoryInterface {
  @override
  Future<void> clearAllData() async {
    print('---------------');
  }

  @override
  Future<String?> getToken() async {
    print('---------------');
  }

  @override
  Future<User?> getUser() async {
    print('---------------');
  }

  @override
  Future<void> setToken(String? token) async {
    print('---------------');
  }

  @override
  Future<User?> setUser(User? user) async {
    print('---------------');
  }
  // @override
  // Future<void> clearAllData() async {
  //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   sharedPreferences.clear();
  // }

  // @override
  // Future<String?> getToken() async {
  //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   return sharedPreferences.getString(prefToken);
  // }

  // @override
  // Future<User?> getUser() async {
  //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   final fullname = sharedPreferences.getString(prefFullName);
  //   final user = User(fullName: fullname);
  //   return user;
  // }

  // @override
  // Future<void> setToken(String? token) async {
  //   try {
  //     SharedPreferences sharedPreferences =
  //         await SharedPreferences.getInstance();
  //     sharedPreferences.setString(prefToken, token!);
  //   } on Exception {
  //     print('---------------');
  //     print('error in setToken');
  //     print('---------------');
  //   }
  // }

  // @override
  // Future<User?> setUser(User? user) async {
  //   try {
  //     SharedPreferences sharedPreferences =
  //         await SharedPreferences.getInstance();
  //     sharedPreferences.setString(prefFullName, user!.fullName!);
  //     return user;
  //   } on Exception {
  //     print('---------------');
  //     print('error in setUser');
  //     print('---------------');
  //   }
  // }
}