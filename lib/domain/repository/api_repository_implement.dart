import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'local_repository_implement.dart';
import '../../modules/auth/model/user.dart';
import '../../modules/courses/model/category.dart';
import '../../modules/courses/model/courses.dart';
import '../request/register_request.dart';
import '../request/login_request.dart';
import '../response/login_response.dart';
import 'api_repository.dart';

class ApiRepositoryImplement extends ApiRepositoryInterface {
  static var client = http.Client();

  static Uri getMainUrl(String endpoint,
      {String baseUrl = '192.168.1.64:8000'}) {
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
        await client.get(getMainUrl('/api/courses_by_category/$title/'));
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

  @override
  Future<List<Courses?>?> getEnrolledCourses() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString(prefToken);
    var result = await client.get(
        getMainUrl('/api/courses_created_by_current_user/'),
        headers: header(token!));
    if (result.statusCode == 200) {
      return coursesFromJson(result.body);
    } else {
      return null;
    }
  }

  @override
  Future<User?> getUserProfile(String token) async {
    var result = await client.get(getMainUrl('/api/user-profile/'),
        headers: header(token));
    if (result.statusCode == 200) {
      return userFromJson(result.body);
    } else {
      return null;
    }
  }

  @override
  Future<List<User?>?> getTutorList() async {
    var result = await client.get(getMainUrl('/api/get_tutors/'));
    if (result.statusCode == 200) {
      return usersFromJson(result.body);
    } else {
      return null;
    }
  }

  @override
  Future<List<User?>?> getTutorByCategory(String title) async {
    var result =
        await client.get(getMainUrl('/api/getTutorsByCategory/$title/'));
    if (result.statusCode == 200) {
      return usersFromJson(result.body);
    } else {
      return null;
    }
  }
}