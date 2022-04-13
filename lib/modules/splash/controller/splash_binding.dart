import 'package:get/get.dart';
import '../../../domain/repository/api_repository.dart';
import '../../../domain/repository/local_repository.dart';
import 'splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(
      () => SplashController(
        Get.find<LocalRepositoryInterface>(),
        Get.find<ApiRepositoryInterface>(),
      ),
    );
  }
}
