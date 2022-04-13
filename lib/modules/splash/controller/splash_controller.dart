import 'package:get/get.dart';
import '../../../domain/repository/api_repository.dart';
import '../../../domain/repository/local_repository.dart';
import '../../../../routes/pages.dart';

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
        await localRepositoryInterface.setUser(result.user!);
        Get.offAllNamed(Routes.home);
      } else {
        Get.offAllNamed(Routes.home);
      }
    } else {
      Get.offAllNamed(Routes.home);
    }
  }
}
