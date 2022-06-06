import 'dart:io';
import 'package:tutor_live/modules/courses/model/lesson.dart';

import '../../modules/auth/model/user.dart';
import '../../modules/courses/model/quizz.dart';
import '../../modules/home/model/schedule.dart';
import '../request/login_request.dart';
import '../request/register_request.dart';
import '../response/login_response.dart';
import '../../modules/courses/model/courses.dart';

abstract class ApiRepositoryInterface {
  Future<LoginResponse?> getUserFromToken(String token);
  Future<User?> getUserProfile(String token);
  Future<LoginResponse?> login(LoginRequest login);
  Future<LoginResponse?> register(RegisterRequest register);
  Future<void> logout(String? token);
  Future getCategories();
  Future<List<Courses?>?> getCourses();
  Future<List<Courses?>?> getCoursesByCategory(String title);
  Future<List<Courses?>?> getEnrolledCourses();
  Future<List<User?>?> getTutorList();
  Future<List<User?>?> getTutorByCategory(String title);
  Future<List<Schedule?>?> getSchedules();
  Future<List<Schedule?>?> getEnrolledCoursesSchedules();
  // notworking
  Future<void> createCourse(
      String title, String description, String category, File image);
  Future<List<Lesson?>?> getLessons(int courseId);
  Future<List<Quizz?>?> getQuizz(int courseId);
}
