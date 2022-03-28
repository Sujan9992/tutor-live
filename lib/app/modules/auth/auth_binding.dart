import 'package:get/get.dart';

import '../../domain/repository/api_repository.dart';
import '../../domain/repository/local_repository.dart';
import 'auth_controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(() => AuthController(
        Get.find<LocalRepositoryInterface>(),
        Get.find<ApiRepositoryInterface>()));
  }
}
