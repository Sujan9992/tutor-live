import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../courses/model/courses.dart';

class AddCourseController extends GetxController {
  // var startTime = const TimeOfDay(hour: 7, minute: 0).obs;
  // var endTime = const TimeOfDay(hour: 9, minute: 0).obs;

  TextEditingController txtCourseName = TextEditingController();
  TextEditingController txtCourseDescription = TextEditingController();
  TextEditingController txtCourseCategory = TextEditingController();
  TextEditingController txtCourseId = TextEditingController();
  TextEditingController txtCourseCreatedBy = TextEditingController();

  var imagePath = ''.obs;

  var isAddingCourse = false.obs;

  final pageIndex;
  AddCourseController(this.pageIndex);

  // onChangeCouseImage() async {
  //   String? path = await _getImage();
  //   if (path != null) {
  //     imagePath.value = path;
  //     print(path);
  //   }
  // }

  onAddCourse() async {
    isAddingCourse.value = true;
    String imageUrl = '';
    Courses course;
    try {
      course = Courses()
        ..category = txtCourseCategory.text
        ..description = txtCourseDescription.text
        ..title = txtCourseName.text
        ..image = imageUrl
        ..createdBy = int.parse(txtCourseCreatedBy.text)
        ..courseId = int.parse(txtCourseId.text);
    } catch (e) {
      Get.snackbar(
        'Error',
        'Please enter valid data',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        borderRadius: 10,
        margin: const EdgeInsets.all(10),
        borderColor: Colors.red,
        borderWidth: 1,
      );
    }
  }

  // Future<String?> _getImage() async {
  //   final pickedFile =
  //       await ImagePicker().getImage(source: ImageSource.gallery);
  //   if (pickedFile != null) {
  //     return pickedFile.path;
  //   } else {
  //     return null;
  //   }
  // }
}
