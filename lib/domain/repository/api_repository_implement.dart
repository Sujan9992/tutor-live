import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../modules/courses/model/lesson.dart';
import '../../modules/courses/model/quizz.dart';
import '../../modules/home/model/schedule.dart';
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
      {String baseUrl = '192.168.1.78:8000'}) {
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
      throw Exception('Failed to load');
    }
  }

  @override
  Future<LoginResponse?> login(LoginRequest login) async {
    var result = await client.post(getMainUrl('/api/login/'),
        body: {'email': login.email, 'password': login.password});
    if (result.statusCode == 200) {
      return loginResponseFromJson(result.body);
    } else {
      throw Exception('Unable to login');
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
      throw Exception('Unable to register');
    }
  }

  @override
  Future<List<Category?>?> getCategories() async {
    var result = await client.get(getMainUrl('/api/categories/'));
    if (result.statusCode == 200) {
      return categoryFromJson(result.body);
    } else {
      throw Exception('Failed to load');
    }
  }

  @override
  Future<List<Courses?>?> getCoursesByCategory(String title) async {
    var result =
        await client.get(getMainUrl('/api/courses_by_category/$title/'));
    if (result.statusCode == 200) {
      return coursesFromJson(result.body);
    } else {
      throw Exception('Failed to load');
    }
  }

  @override
  Future<List<Courses?>?> getCourses() async {
    var result = await client.get(getMainUrl('/api/courses/'));
    if (result.statusCode == 200) {
      return coursesFromJson(result.body);
    } else {
      throw Exception('Failed to load');
    }
  }

  @override
  Future<List<Courses?>?> getEnrolledCourses() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString(prefToken);
    var result = await client.get(getMainUrl('/api/enrolled_courses/'),
        headers: header(token!));
    if (result.statusCode == 200) {
      return coursesFromJson(result.body);
    } else {
      throw Exception('Failed to load');
    }
  }

  @override
  Future<User?> getUserProfile(String token) async {
    var result = await client.get(getMainUrl('/api/user-profile/'),
        headers: header(token));
    if (result.statusCode == 200) {
      return userFromJson(result.body);
    } else {
      throw Exception('Failed to load');
    }
  }

  @override
  Future<List<User?>?> getTutorList() async {
    var result = await client.get(getMainUrl('/api/get_tutors/'));
    if (result.statusCode == 200) {
      return usersFromJson(result.body);
    } else {
      throw Exception('Failed to load');
    }
  }

  @override
  Future<List<User?>?> getTutorByCategory(String title) async {
    var result =
        await client.get(getMainUrl('/api/getTutorsByCategory/$title/'));
    if (result.statusCode == 200) {
      return usersFromJson(result.body);
    } else {
      throw Exception('Failed to load');
    }
  }

  // not needed
  @override
  Future<List<Schedule?>?> getSchedules() async {
    var result = await client.get(getMainUrl('/api/all_schedules/'));
    if (result.statusCode == 200) {
      return scheduleFromJson(result.body);
    } else {
      throw Exception('Failed to load');
    }
  }

  @override
  Future<List<Schedule?>?> getEnrolledCoursesSchedules() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString(prefToken);
    var result = await client.get(
        getMainUrl('/api/getEnrolledCoursesSchedule/'),
        headers: header(token!));
    if (result.statusCode == 200) {
      return scheduleFromJson(result.body);
    } else {
      throw Exception('Failed to load');
    }
  }

  @override
  Future<void> createCourse(
      String title, String description, String category, File image) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userId = prefs.getString(prefId.toString());
    String? token = prefs.getString(prefToken);
    Map<String, String> header1(String token) => {
          "Content-type": "application/json",
          // "Accept": "application/json",
          "Authorization": "Bearer $token"
        };
    // var result = await client.post(
    //   getMainUrl('/api/courses/'),
    //   headers: header(token!),
    //   body: jsonEncode({
    //     'title': title,
    //     'description': description,
    //     'category': category,
    //     'keywords': '',
    //     'created_by': userId,
    //     'image': base64Encode(image.readAsBytesSync())
    //   }),
    // );
    var result = await client.post(getMainUrl('/api/courses/'),
        headers: header1(token!),
        body: coursesToJson(
          [
            Courses(
              title: title,
              description: description,
              category: category,
              createdBy: int.parse(userId!),
              image: base64Encode(image.readAsBytesSync()),
              keywords: 'empty',
            )
          ],
        ));
    // var request = http.MultipartRequest(
    //     'POST', Uri.parse('http://192.168.1.78:8000/api/courses/'));
    // request.fields['title'] = title;
    // request.fields['description'] = description;
    // request.fields['category'] = category;
    // request.fields['keywords'] = '';
    // request.fields['created_by'] = userId!;

    // Map<String, String> headers = {"Authorization": "Bearer $token"};
    // request.headers.addAll(headers);

    // // var imageFile = http.MultipartFile.fromBytes(
    // //     'image', (await rootBundle.load(image.path)).buffer.asUint8List(),
    // //     filename: 'default.png');
    // // request.files.add(imageFile);

    // var response = await request.send();
    // print(response.statusCode);
    // var responseData = await response.stream.bytesToString();
    // var result = String.fromCharCodes(responseData.codeUnits);
    // print(result.statusCode);
  }

  @override
  Future<List<Lesson?>?> getLessons(int courseId) async {
    var result = await client.get(getMainUrl('/api/getLessons/$courseId/'));
    if (result.statusCode == 200) {
      return lessonFromJson(result.body);
    } else {
      throw Exception('Failed to load');
    }
  }

  @override
  Future<List<Quizz?>?> getQuizz(int courseId) async {
    var result =
        await client.get(getMainUrl('/api/getCourseAssignment/$courseId/'));
    if (result.statusCode == 200) {
      return quizzFromJson(result.body);
    } else {
      throw Exception('Failed to load');
    }
  }
}
