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
      body: FutureBuilder(
        future: controller.apiRepositoryInterface.getEnrolledCourses(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemCount: snapshot.data!.length,
              itemBuilder: (BuildContext context, int index) => Card(
                child: ListTile(
                  title: Text(snapshot.data![index]!.title),
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
      persistentFooterButtons: [
        Card(
          child: ListTile(
            leading: const Icon(Icons.add),
            title: const Text('Create Course'),
            onTap: () {},
          ),
        ),
      ],
    );
  }
}
