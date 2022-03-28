import 'package:http/http.dart' as http;
import '../../domain/repository/api_repository.dart';
import '../../domain/response/login_response.dart';
import '../../domain/request/register_request.dart';
import '../../domain/request/login_request.dart';

class ApiRepositoryImplement extends ApiRepositoryInterface {
  static var client = http.Client();

  static Uri getMainUrl(String endpoint,
      {String baseUrl = '192.168.1.250:8000'}) {
    var url = Uri.http((baseUrl), (endpoint), {'q': '{http}'});
    return url;
  }

  static Map<String, String> header(String token) => {
        "Content-type": "application/json",
        "Accept": "application/json",
        "Authorization": "Bearer $token"
      };

  @override
  Future<LoginResponse?> getUserFromToken(String token) async {
    var result =
        await client.get(getMainUrl('/api/profile'), headers: header(token));
    if (result.statusCode == 200) {
      print('------------------------------------');
      print('login');
      print('------------------------------------');
      print('result.body {auth_repository_implement.dart - getUserFromToken}');
      print(result.body);
      print('------------------------------------');
      return loginResponseFromJson(result.body);
    } else {
      print('---------------');
      print('user is null {api_repository_implement- getUserFromToken}');
      print(result.statusCode);
      print(result.body);
      print('---------------');
      return null;
    }
  }

  @override
  Future<LoginResponse?> login(LoginRequest login) async {
    var result = await client.post(getMainUrl('/api/login/'),
        body: {'email': login.email, 'password': login.password});
    if (result.statusCode == 200) {
      print('------------------------------------');
      print('login');
      print('------------------------------------');
      print('result.body {auth_repository_implement.dart - login}');
      print(result.body);
      print('------------------------------------');
      return loginResponseFromJson(result.body);
    } else {
      print('---------------');
      print('user is null {api_repository_implement- login}');
      print(result.statusCode);
      print(result.body);
      print('---------------');
      return null;
    }
  }

  @override
  Future<void> logout(String? token) async {
    print('------------------------------------');
    print('removing token');
    print('------------------------------------');
  }

  @override
  Future<LoginResponse?> register(RegisterRequest register) async {
    var result = await client.post(getMainUrl('/api/register/'), body: {
      'full_name': register.fullName,
      'email': register.email,
      'password': register.password,
      'password_confirm': register.confirmPassword
    });
    if (result.statusCode == 200) {
      print('------------------------------------');
      print('register');
      print('------------------------------------');
      print('result.body {auth_repository_implement.dart - register}');
      print(result.body);
      print('------------------------------------');
      return loginResponseFromJson(result.body);
    } else {
      print('---------------');
      print('user is null {api_repository_implement- register}');
      print(result.statusCode);
      print(result.body);
      print('---------------');
      return null;
    }
  }
}
