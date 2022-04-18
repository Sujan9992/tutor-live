import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/course_controller.dart';

class TutorCategoryFrame extends StatelessWidget {
  TutorCategoryFrame({Key? key}) : super(key: key);
  final controller = Get.find<CourseController>();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: controller.categoryTabIndex.value,
      length: controller.categoryList.length + 1,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(4, 12, 4, 4),
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
                  itemCount: controller.tutorList.length,
                  itemBuilder: (BuildContext context, int index) => Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        leading: const CircleAvatar(
                          radius: 30,
                          child: CircleAvatar(
                              radius: 25, backgroundColor: Colors.white),
                        ),
                        title: Text(controller.tutorList[index].fullName),
                      ),
                    ),
                  ),
                ),
              ),
              for (var category in controller.categoryList)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FutureBuilder(
                    future: controller.apiRepositoryInterface
                        .getTutorByCategory(category.title),
                    builder: (BuildContext context,
                        AsyncSnapshot<dynamic> snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemCount: snapshot.data.length,
                          itemBuilder: (BuildContext context, int index) =>
                              Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListTile(
                                  leading: const CircleAvatar(
                                    radius: 30,
                                    child: CircleAvatar(
                                        radius: 25,
                                        backgroundColor: Colors.white),
                                  ),
                                  title: Text(snapshot.data[index].fullName)),
                            ),
                          ),
                        );
                      } else {
                        return const Center(child: CircularProgressIndicator());
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
