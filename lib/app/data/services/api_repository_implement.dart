import 'package:http/http.dart' as http;
import '../models/courses.dart';
import '../models/category.dart';
import '../../domain/repository/api_repository.dart';
import '../../domain/response/login_response.dart';
import '../../domain/request/register_request.dart';
import '../../domain/request/login_request.dart';

class ApiRepositoryImplement extends ApiRepositoryInterface {
  static var client = http.Client();

  static Uri getMainUrl(String endpoint,
      {String baseUrl = '192.168.1.66:8000'}) {
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
        await client.get(getMainUrl('/api/profile/'), headers: header(token));
    if (result.statusCode == 200) {
      return loginResponseFromJson(result.body);
    } else {
      return null;
    }
  }

  @override
  Future<LoginResponse?> login(LoginRequest login) async {
    var result = await client.post(getMainUrl('/api/login/'),
        body: {'email': login.email, 'password': login.password});
    if (result.statusCode == 200) {
      return loginResponseFromJson(result.body);
    } else {
      return null;
    }
  }

  @override
  Future<void> logout(String? token) async {
    return;
  }

  @override
  Future<LoginResponse?> register(RegisterRequest register) async {
    var result = await client.post(getMainUrl('/api/register/'), body: {
      'full_name': register.fullName,
      'email': register.email,
      'password': register.password,
    });
    if (result.statusCode == 201) {
      return loginResponseFromJson(result.body);
    } else {
      return null;
    }
  }

  @override
  Future<List<Category?>?> getCategories() async {
    var result = await client.get(getMainUrl('/api/categories/'));
    if (result.statusCode == 200) {
      return categoryFromJson(result.body);
    } else {
      return null;
    }
  }

  @override
  Future<List<Courses?>?> getCoursesByCategory(String title) async {
    var result =
        await client.get(getMainUrl('/api/get_courses_by_category/$title/'));
    if (result.statusCode == 200) {
      return coursesFromJson(result.body);
    } else {
      return null;
    }
  }

  @override
  Future<List<Courses?>?> getCourses() async {
    var result = await client.get(getMainUrl('/api/courses/'));
    if (result.statusCode == 200) {
      return coursesFromJson(result.body);
    } else {
      return null;
    }
  }
}
