import 'package:get/get.dart';
import 'domain/repository/api_repository.dart';
import 'domain/repository/api_repository_implement.dart';
import 'domain/repository/local_repository.dart';
import 'domain/repository/local_repository_implement.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ApiRepositoryInterface>(ApiRepositoryImplement());
    Get.put<LocalRepositoryInterface>(LocalRepositoryImplement());
  }
}
