import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../../domain/repository/api_repository.dart';
import '../../domain/response/login_response.dart';
import '../../domain/request/register_request.dart';
import '../../domain/request/login_request.dart';

class ApiRepositoryImplement extends ApiRepositoryInterface {
  static var client = http.Client();

  static Uri getMainUrl(String endpoint,
      {String baseUrl = '192.168.1.251:8000'}) {
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
    debugPrint(
        '${result.statusCode} {api_repository_implement.dart - getUserFromToken}');
    if (result.statusCode == 200) {
      debugPrint('------------------------------------');
      debugPrint(
          'user profile fetched {api_repository_implement.dart - getUserFromToken}');
      debugPrint(result.body);
      debugPrint('------------------------------------');
      return loginResponseFromJson(result.body);
    } else {
      debugPrint('---------------');
      debugPrint(
          'unable to fetch user profile {api_repository_implement- getUserFromToken}');
      debugPrint(result.body);
      debugPrint('---------------');
      return null;
    }
  }

  @override
  Future<LoginResponse?> login(LoginRequest login) async {
    var result = await client.post(getMainUrl('/api/login/'),
        body: {'email': login.email, 'password': login.password});
    debugPrint('${result.statusCode} {api_repository_implement.dart - login}');
    if (result.statusCode == 200) {
      debugPrint('------------------------------------');
      debugPrint('login success {api_repository_implement.dart - login}');
      debugPrint(result.body);
      debugPrint('------------------------------------');
      return loginResponseFromJson(result.body);
    } else {
      debugPrint('---------------');
      debugPrint('unable to login {api_repository_implement- login}');
      debugPrint(result.body);
      debugPrint('---------------');
      return null;
    }
  }

  @override
  Future<void> logout(String? token) async {
    debugPrint('------------------------------------');
    debugPrint(
        'removing token and logout {api_repository_implement.dart - logout}');
    debugPrint('------------------------------------');
    return;
  }

  @override
  Future<LoginResponse?> register(RegisterRequest register) async {
    var result = await client.post(getMainUrl('/api/register/'), body: {
      'full_name': register.fullName,
      'email': register.email,
      'password': register.password,
    });
    debugPrint(
        '${result.statusCode} {api_repository_implement.dart - register}');
    if (result.statusCode == 201) {
      debugPrint('------------------------------------');
      debugPrint(
          'registration success {api_repository_implement.dart - register}');
      debugPrint(result.body);
      debugPrint('------------------------------------');
      return loginResponseFromJson(result.body);
    } else {
      debugPrint('---------------');
      debugPrint('unable to register {api_repository_implement- register}');
      debugPrint(result.body);
      debugPrint('---------------');
      return null;
    }
  }
}
