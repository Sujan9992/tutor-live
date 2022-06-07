import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../core/constants.dart';
import '../modules/courses/controller/course_controller.dart';

class UserDetails extends StatelessWidget {
  UserDetails({Key? key}) : super(key: key);
  final controller = Get.find<CourseController>();

  final id = Get.arguments[0];
  final name = Get.arguments[1];
  final email = Get.arguments[2];
  final image = Get.arguments[3];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.red),
        backgroundColor: Colors.transparent,
        title: Text(
          name,
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.red,
          ),
        ),
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
                  : Image.asset('assets/images/images.jpg', fit: BoxFit.cover),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Email - $email',
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
                'Created Courses by $name',
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
                                      // Get.toNamed('/courseDetail', arguments: [
                                      //   snapshot.data![index]!.courseId,
                                      //   snapshot.data![index]!.title,
                                      //   snapshot.data![index]!.description,
                                      //   snapshot.data![index]!.category,
                                      //   snapshot.data![index]!.image,
                                      // ]);
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
