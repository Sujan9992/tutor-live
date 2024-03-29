import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/constants.dart';
import '../controller/course_controller.dart';

class CourseDetail extends StatelessWidget {
  CourseDetail({Key? key}) : super(key: key);
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
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Rating: ',
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Colors.red,
                      )),
                  RatingBar.builder(
                    initialRating: 3,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      switch (index) {
                        case 0:
                          return const Icon(
                            Icons.sentiment_very_dissatisfied,
                            color: Colors.red,
                          );
                        case 1:
                          return const Icon(
                            Icons.sentiment_dissatisfied,
                            color: Colors.redAccent,
                          );
                        case 2:
                          return const Icon(
                            Icons.sentiment_neutral,
                            color: Colors.amber,
                          );
                        case 3:
                          return const Icon(
                            Icons.sentiment_satisfied,
                            color: Colors.lightGreen,
                          );
                        case 4:
                          return const Icon(
                            Icons.sentiment_very_satisfied,
                            color: Colors.green,
                          );
                        default:
                          return Container();
                      }
                    },
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  ),
                ],
              ),
              const SizedBox(height: 10),
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
                                      Get.toNamed('/lessonDetail', arguments: [
                                        snapshot.data![index]!.title,
                                        snapshot.data![index]!.description,
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
        ),
      ),
      floatingActionButton: TextButton(
        style: ButtonStyle(
          overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
        ),
        onPressed: () {
          Get.toNamed('/quizz', arguments: [course_id, title]);
        },
        child: Text('Take a Quiz',
            style: GoogleFonts.poppins(
              fontSize: 15,
              fontWeight: FontWeight.w300,
              color: Colors.red,
            )),
      ),
    );
  }
}
