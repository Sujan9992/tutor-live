import 'package:get/get.dart';
import '../../../domain/repository/api_repository.dart';
import 'homepage_controller.dart';

class HomePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<HomePageController>(
      HomePageController(
        Get.find<ApiRepositoryInterface>(),
      ),
    );
  }
}
