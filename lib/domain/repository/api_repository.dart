import 'dart:io';
import 'package:tutor_live/modules/courses/model/lesson.dart';

import '../../modules/auth/model/user.dart';
import '../../modules/chat/model/chat.dart';
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
  Future<List<Courses?>?> getTutorCourses(int id);
  Future<List<User?>?> getTutorList();
  Future<List<User?>?> getTutorByCategory(String title);
  Future<List<Schedule?>?> getSchedules();
  Future<List<Schedule?>?> getEnrolledCoursesSchedules();
  Future<void> createCourse(
      String title, String description, String category, File image);
  Future<List<Lesson?>?> getLessons(int courseId);
  Future<List<Quizz?>?> getQuizz(int courseId);
  Future<void> createSchedule(
      int courseId,
      String title,
      String sunday,
      String monday,
      String tuesday,
      String wednesday,
      String thursday,
      String friday,
      String saturday);
  Future<void> enrollCourse(int courseId);
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
    String q5Option2,
  );
  Future<void> createLesson(
    int courseId,
    String title,
    String description,
    File image,
  );
  Future<List<Chat?>?> getChatHeads();
  Future<List<Chat?>?> getChatDetails(int sender);
  Future<List<Chat?>?> sendChat(int receiver, String message);
}
