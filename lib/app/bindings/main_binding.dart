import 'package:get/get.dart';
import '../domain/repository/local_repository.dart';
import '../data/services/local_repository_implementation.dart';
import '../domain/repository/api_repository.dart';

import '../data/services/api_repository_implement.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ApiRepositoryInterface>(ApiRepositoryImplement());
    Get.put<LocalRepositoryInterface>(LocalRepositoryImplement());
  }
}
