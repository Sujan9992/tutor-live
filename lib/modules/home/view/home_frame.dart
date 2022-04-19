import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/homepage_controller.dart';
import 'calendar_child_frame.dart';
import 'suggestion_child_frame.dart';

class HomeFrame extends StatelessWidget {
  HomeFrame({Key? key}) : super(key: key);
  final controller = Get.find<HomePageController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        DefaultTabController(
          initialIndex: 0,
          length: 2,
          child: TabBar(
            onTap: controller.oncChildTabChanged,
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
                  Text("Schedule"),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  SizedBox(width: 5),
                  Text("Progress"),
                ],
              ),
            ],
          ),
        ),
        Obx(
          () => (controller.childTabIndex.value == 0)
              ? Expanded(child: CalendarChildFrame())
              : const SuggestionChildFrame(),
        ),
      ],
    );
  }
}
