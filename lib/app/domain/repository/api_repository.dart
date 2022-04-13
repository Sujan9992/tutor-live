import '../../data/models/category.dart';
import '../../data/models/courses.dart';
import '../request/login_request.dart';
import '../request/register_request.dart';
import '../response/login_response.dart';

abstract class ApiRepositoryInterface {
  Future<LoginResponse?> getUserFromToken(String token);
  Future<LoginResponse?> login(LoginRequest login);
  Future<LoginResponse?> register(RegisterRequest register);
  Future<void> logout(String? token);
  Future<List<Category?>?> getCategories();
  Future<List<Courses?>?> getCourses();
  Future<List<Courses?>?> getCoursesByCategory(String title);
}
