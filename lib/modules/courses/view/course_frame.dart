import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'course_category_frame.dart';
import '../controller/course_controller.dart';
import 'tutor_category_frame.dart';

class CourseFrame extends StatelessWidget {
  CourseFrame({Key? key}) : super(key: key);
  final controller = Get.find<CourseController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        DefaultTabController(
          length: 2,
          child: TabBar(
            physics: const BouncingScrollPhysics(),
            onTap: controller.onChildTabChanged,
            unselectedLabelColor: Colors.black,
            indicator: const BubbleTabIndicator(
              indicatorColor: Colors.black,
              tabBarIndicatorSize: TabBarIndicatorSize.label,
              insets: EdgeInsets.symmetric(horizontal: 2.0),
              padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: -24.0),
            ),
            tabs: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  SizedBox(width: 5),
                  Text("Course"),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  SizedBox(width: 5),
                  Text("Tutor"),
                ],
              ),
            ],
          ),
        ),
        Obx(
          () => (controller.childTabIndex.value == 0)
              ? Expanded(child: CourseCategoryFrame())
              : Expanded(child: TutorCategoryFrame()),
        ),
      ],
    );
  }
}
