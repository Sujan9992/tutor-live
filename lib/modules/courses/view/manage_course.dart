import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/constants.dart';
import '../controller/course_controller.dart';

class ManageCourse extends StatelessWidget {
  ManageCourse({Key? key}) : super(key: key);
  final controller = Get.find<CourseController>();

  final id = Get.arguments[0];
  final name = Get.arguments[1];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.red),
        backgroundColor: Colors.transparent,
        title: Text(
          'Manage Course',
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.red,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              FutureBuilder(
                future: controller.apiRepositoryInterface.getTutorCourses(id),
                builder: (BuildContext context,
                        AsyncSnapshot<dynamic> snapshot) =>
                    (snapshot.hasData)
                        ? ListView.builder(
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                            itemCount: snapshot.data.length,
                            itemBuilder: (BuildContext context, int index) =>
                                Card(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ListTile(
                                    onTap: () {
                                      Get.toNamed('/updateCourse', arguments: [
                                        snapshot.data![index]!.courseId,
                                        snapshot.data![index]!.title,
                                        snapshot.data![index]!.description,
                                        snapshot.data![index]!.category,
                                        snapshot.data![index]!.image,
                                      ]);
                                    },
                                    leading: snapshot.data[index].image == null
                                        ? Image.asset(
                                            'assets/images/python_101.png',
                                            width: 80)
                                        : Image.network(
                                            '${Constants.mainUrl}${snapshot.data[index].image}',
                                            width: 80,
                                          ),
                                    title: Text(snapshot.data[index].title)),
                              ),
                            ),
                          )
                        : const Center(child: CircularProgressIndicator()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
