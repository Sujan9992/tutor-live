import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../modules/chat/model/chat.dart';
import '../../core/constants.dart';
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
      {String baseUrl = '192.168.43.202:8000'}) {
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
    String key = 'keys';
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userId = prefs.getString(prefId.toString());
    String? token = prefs.getString(prefToken);

    try {
      var response = await http.post(
        Uri.parse(Constants.mainUrl + '/api/createCourse/'),
        headers: header(token!),
        body: jsonEncode({
          'title': title,
          'description': description,
          'category': category,
          'keywords': key,
          'created_by': userId,
          // 'image': base64Encode(image.readAsBytesSync())
        }),
      );
    } catch (e) {
      print(e.toString());
    }
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

  @override
  Future<List<Courses?>?> getTutorCourses(int id) async {
    var result =
        await client.get(getMainUrl('/api/courses_created_by_user/$id/'));
    if (result.statusCode == 200) {
      return coursesFromJson(result.body);
    } else {
      throw Exception('Failed to load');
    }
  }

  @override
  Future<void> createSchedule(
      int courseId,
      String title,
      String sunday,
      String monday,
      String tuesday,
      String wednesday,
      String thursday,
      String friday,
      String saturday) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? token = prefs.getString(prefToken);
    try {
      var response = await http.post(
          Uri.parse(Constants.mainUrl + '/api/createSchedule/$courseId/'),
          headers: header(token!),
          body: jsonEncode({
            'course_id': courseId,
            'title': title,
            'sunday': sunday,
            'monday': monday,
            'tuesday': tuesday,
            'wednesday': wednesday,
            'thursday': thursday,
            'friday': friday,
            'saturday': saturday
          }));
      print(response.statusCode);
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Future<void> enrollCourse(int courseId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString(prefToken);
    String? userId = prefs.getString(prefId.toString());
    try {
      var response = await http.post(
        Uri.parse(Constants.mainUrl + '/api/enrollCourse/$courseId/'),
        headers: header(token!),
        body: jsonEncode({
          'user_id': userId,
          'course_id': courseId,
        }),
      );
      print(response.statusCode);
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Future<void> createAssignment(
      int courseId,
      String question1,
      String question2,
      String question3,
      String question4,
      String question5,
      String answer1,
      String answer2,
      String answer3,
      String answer4,
      String answer5,
      String q1Option1,
      String q1Option2,
      String q2Option1,
      String q2Option2,
      String q3Option1,
      String q3Option2,
      String q4Option1,
      String q4Option2,
      String q5Option1,
      String q5Option2) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString(prefToken);
    String title = 'Assignment';
    try {
      var response = await http.post(
        Uri.parse(Constants.mainUrl + '/api/createAssignment/$courseId/'),
        headers: header(token!),
        body: jsonEncode({
          'course_id': courseId,
          'title': title,
          'question1': question1,
          'question2': question2,
          'question3': question3,
          'question4': question4,
          'question5': question5,
          'answer1': answer1,
          'answer2': answer2,
          'answer3': answer3,
          'answer4': answer4,
          'answer5': answer5,
          'q1Option1': q1Option1,
          'q1Option2': q1Option2,
          'q2Option1': q2Option1,
          'q2Option2': q2Option2,
          'q3Option1': q3Option1,
          'q3Option2': q3Option2,
          'q4Option1': q4Option1,
          'q4Option2': q4Option2,
          'q5Option1': q5Option1,
          'q5Option2': q5Option2,
        }),
      );
      // print(response.statusCode);
      // print(response.body);
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Future<void> createLesson(
      int courseId, String title, String description, File image) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString(prefToken);
    try {
      var response = await http.post(
        Uri.parse(Constants.mainUrl + '/api/createLesson/$courseId/'),
        headers: header(token!),
        body: jsonEncode({
          'course_id': courseId,
          'title': title,
          'description': description,
          // 'image': image,
        }),
      );
      // print(response.statusCode);
      // print(response.body);
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Future<List<Chat?>?> getChatHeads() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userId = prefs.getString(prefId.toString());
    String? token = prefs.getString(prefToken);
    try {
      var response = await http.get(
        Uri.parse(Constants.mainUrl + '/api/chatHeads/'),
        headers: header(token!),
      );
      // print(userId.toString());
      // print(response.statusCode);
      // print(jsonDecode(response.body));
      // print(chatFromJson(response.body));
      return chatFromJson(response.body);
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Future<List<Chat?>?> getChatDetails(int sender) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userId = prefs.getString(prefId.toString());
    String? token = prefs.getString(prefToken);
    try {
      var response = await http.get(
        Uri.parse(Constants.mainUrl + '/api/chatDetails/$sender/$userId/'),
        headers: header(token!),
      );
      // print(response.statusCode);
      // print(jsonDecode(response.body));
      // print(chatFromJson(response.body));
      return chatFromJson(response.body);
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Future<List<Chat?>?> sendChat(int receiver, String message) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userId = prefs.getString(prefId.toString());
    String? token = prefs.getString(prefToken);
    try {
      var response = await http.post(
        Uri.parse(Constants.mainUrl + '/api/sendChat/$userId/$receiver/'),
        headers: header(token!),
        body: jsonEncode({
          'receiver': receiver,
          'sender': userId,
          'message': message,
        }),
      );
      print(response.statusCode);
      print(jsonDecode(response.body));
      print(chatFromJson(response.body));
      return chatFromJson(response.body);
    } catch (e) {
      print(e.toString());
    } catch (e) {
      print(e.toString());
    }
  }
}
