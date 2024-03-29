import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/constants.dart';
import '../controller/course_controller.dart';

class CoursesPage extends StatelessWidget {
  CoursesPage({Key? key}) : super(key: key);
  final course_id = Get.arguments[0];
  final title = Get.arguments[1];
  final description = Get.arguments[2];
  final category = Get.arguments[3];
  final image = Get.arguments[4];

  final controller = Get.find<CourseController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.red),
        backgroundColor: Colors.transparent,
        title: Text(title,
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.red,
            )),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              image != null
                  ? Image.network(
                      '${Constants.mainUrl}$image',
                      fit: BoxFit.cover,
                    )
                  : Image.asset('assets/images/python_101.png',
                      fit: BoxFit.cover),
              Text(
                'Category - $category',
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  fontWeight: FontWeight.w300,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                description,
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  fontWeight: FontWeight.w300,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              FutureBuilder(
                future: controller.apiRepositoryInterface.getLessons(course_id),
                builder:
                    (BuildContext context, AsyncSnapshot<dynamic> snapshot) =>
                        (snapshot.hasData)
                            ? ListView.builder(
                                shrinkWrap: true,
                                physics: const BouncingScrollPhysics(),
                                itemCount: snapshot.data!.length,
                                itemBuilder:
                                    (BuildContext context, int index) => Card(
                                  child: ListTile(
                                    title: Text(snapshot.data![index]!.title),
                                    onTap: () {
                                      // Get.toNamed('/lessonDetail', arguments: [
                                      //   snapshot.data![index]!.title,
                                      //   snapshot.data![index]!.description,
                                      //   snapshot.data![index]!.image,
                                      // ]);
                                    },
                                  ),
                                ),
                              )
                            : const Center(child: CircularProgressIndicator()),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: TextButton(
        style: ButtonStyle(
          overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
        ),
        onPressed: () {
          controller.apiRepositoryInterface
              .enrollCourse(course_id)
              .then((value) => Get.back());
        },
        child: Text('Enroll',
            style: GoogleFonts.poppins(
              fontSize: 15,
              fontWeight: FontWeight.w300,
              color: Colors.red,
            )),
      ),
    );
  }
}
