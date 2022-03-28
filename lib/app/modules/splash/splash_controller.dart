import 'package:get/get.dart';
import '../../../routes/pages.dart';
import '../../domain/repository/api_repository.dart';

import '../../domain/repository/local_repository.dart';

class SplashController extends GetxController {
  final LocalRepositoryInterface localRepositoryInterface;
  final ApiRepositoryInterface apiRepositoryInterface;

  SplashController(this.localRepositoryInterface, this.apiRepositoryInterface);

  @override
  void onReady() {
    validateSession();
    super.onReady();
  }

  void validateSession() async {
    final token = await localRepositoryInterface.getToken();
    if (token != null) {
      final result = await apiRepositoryInterface.getUserFromToken(token);
      if (result != null) {
        await localRepositoryInterface.setUser(result.user);
        print('---------------');
        print('user is set {splash_controller.dart - validateSession}');
        print('---------------');
        Get.offAllNamed(Routes.home);
      } else {
        print('---------------');
        print('user is null {splash_controller.dart - validateSession}');
        print('---------------');
        Get.offAllNamed(Routes.auth);
      }
    } else {
      print('---------------');
      print('token is null {splash_controller.dart - validateSession}');
      print('---------------');
      Get.offAllNamed(Routes.auth);
    }
  }
}
