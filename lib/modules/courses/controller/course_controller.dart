import 'package:get/get.dart';
import '../../../domain/repository/api_repository.dart';

class CourseController extends GetxController {
  final ApiRepositoryInterface apiRepositoryInterface;

  CourseController(this.apiRepositoryInterface);

  RxList categoryList = [].obs;
  RxList coursesList = [].obs;
  RxList courseCategoryList = [].obs;
  RxBool categoryLoading = false.obs;
  RxBool courseLoading = false.obs;
  RxString categoryTitle = ''.obs;
  var childTabIndex = 0.obs;
  var categoryTabIndex = 0.obs;

  onChildTabChanged(int index) {
    childTabIndex.value = index;
  }

  onCategoryTabChanged(int index) {
    categoryTabIndex.value = index;
    if (index == 0) {
      categoryTitle.value = 'All';
    } else {
      categoryTitle.value = categoryList[index - 1].title;
    }
  }

  @override
  void onInit() {
    loadCategories();
    loadCourses();
    super.onInit();
  }

  loadCategories() {
    try {
      categoryLoading(true);
      apiRepositoryInterface.getCategories().then((value) {
        categoryList(value);
      });
    } finally {
      categoryLoading(false);
    }
  }

  loadCourses() {
    try {
      courseLoading(true);
      apiRepositoryInterface.getCourses().then((value) {
        coursesList(value);
      });
    } finally {
      courseLoading(false);
    }
  }
}
