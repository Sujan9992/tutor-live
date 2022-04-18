import '../../modules/auth/model/user.dart';
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
}
