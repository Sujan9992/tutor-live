import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'course_controller.dart';

class CourseCategoryFrame extends StatelessWidget {
  CourseCategoryFrame({Key? key}) : super(key: key);
  final controller = Get.find<CourseController>();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: controller.categoryTabIndex.value,
      length: controller.categoryList.length + 1,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(4, 4, 4, 4),
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: TabBar(
            physics: const BouncingScrollPhysics(),
            isScrollable: true,
            onTap: controller.onCategoryTabChanged,
            unselectedLabelColor: Colors.black,
            unselectedLabelStyle: const TextStyle(fontSize: 12),
            labelColor: Colors.black,
            labelStyle:
                const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            indicator: const BubbleTabIndicator(
              indicatorHeight: 10.0,
              indicatorRadius: 40.0,
              indicatorColor: Colors.red,
              tabBarIndicatorSize: TabBarIndicatorSize.label,
              insets: EdgeInsets.symmetric(horizontal: 2.0),
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: -1.0),
            ),
            tabs: [
              const Tab(text: 'All'),
              for (var category in controller.categoryList)
                Tab(text: category.title),
            ],
          ),
          body: TabBarView(
            physics: const BouncingScrollPhysics(),
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount: controller.coursesList.length,
                  itemBuilder: (BuildContext context, int index) => Card(
                    child: ListTile(
                      title: Text(controller.coursesList[index].title),
                    ),
                  ),
                ),
              ),
              for (var category in controller.categoryList)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FutureBuilder(
                    future: controller.apiRepositoryInterface
                        .getCoursesByCategory(category.title),
                    builder: (BuildContext context,
                        AsyncSnapshot<dynamic> snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemCount: snapshot.data.length,
                          itemBuilder: (BuildContext context, int index) =>
                              Card(
                            child: ListTile(
                              title: Text(snapshot.data[index].title),
                            ),
                          ),
                        );
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
