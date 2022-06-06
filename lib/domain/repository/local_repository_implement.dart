import 'package:shared_preferences/shared_preferences.dart';
import '../../modules/auth/model/user.dart';
import 'local_repository.dart';

const prefToken = 'TOKEN';
const prefFullName = 'FULLNAME';
const int prefId = 1;

class LocalRepositoryImplement extends LocalRepositoryInterface {
  @override
  Future<void> clearAllData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.remove(prefToken);
    sharedPreferences.remove(prefFullName);
    sharedPreferences.remove(prefId.toString());
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
    final id = sharedPreferences.getString(prefId.toString());
    final user = User(fullName: fullname, id: int.parse(id!));
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
    sharedPreferences.setString(prefId.toString(), user.id.toString());
    return user;
  }
}
