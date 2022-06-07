import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../modules/courses/controller/course_controller.dart';

class DrawerMenu extends StatefulWidget {
  const DrawerMenu({Key? key}) : super(key: key);

  @override
  State<DrawerMenu> createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  final controller = Get.find<CourseController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.red.shade200),
            child: const Center(child: Text('Courses')),
          ),
          FutureBuilder(
            future: controller.apiRepositoryInterface.getEnrolledCourses(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) =>
                (snapshot.hasData)
                    ? ListView.builder(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemCount: snapshot.data!.length,
                        itemBuilder: (BuildContext context, int index) => Card(
                          child: ListTile(
                            title: Text(snapshot.data![index]!.title),
                            onTap: () {
                              Get.toNamed('/courseDetail', arguments: [
                                snapshot.data![index]!.courseId,
                                snapshot.data![index]!.title,
                                snapshot.data![index]!.description,
                                snapshot.data![index]!.category,
                                snapshot.data![index]!.image,
                              ]);
                            },
                          ),
                        ),
                      )
                    : const Center(child: CircularProgressIndicator()),
          ),
        ],
      ),
      persistentFooterButtons: [
        Card(
          child: ListTile(
              leading: const Icon(Icons.add),
              title: const Text('Create Course'),
              onTap: () {
                Get.back();
                Get.toNamed('/addCourse');
              }),
        ),
      ],
    );
  }
}
