import 'package:get/get.dart';
import '../../domain/repository/api_repository.dart';
import 'course_controller.dart';

class CourseBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<CourseController>(
      CourseController(
        Get.find<ApiRepositoryInterface>(),
      ),
    );
  }
}
