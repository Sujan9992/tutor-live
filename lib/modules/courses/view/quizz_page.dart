import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tutor_live/core/global_widgets/radio_tile.dart';

import '../controller/course_controller.dart';

class Quizz extends StatefulWidget {
  Quizz({Key? key}) : super(key: key);

  @override
  State<Quizz> createState() => _QuizzState();
}

class _QuizzState extends State<Quizz> {
  bool isQ1 = false;
  bool isQ2 = false;
  bool isQ3 = false;
  bool isQ4 = false;
  bool isQ5 = false;

  final course_id = Get.arguments[0];
  final title = Get.arguments[1];

  int grade = 0;

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
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FutureBuilder(
              future: controller.apiRepositoryInterface.getQuizz(course_id),
              builder: (BuildContext context,
                      AsyncSnapshot<dynamic> snapshot) =>
                  (snapshot.hasData)
                      ? ListView.builder(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemCount: snapshot.data.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Column(
                              children: [
                                Card(
                                  child: ListTile(
                                    title:
                                        Text(snapshot.data![index]!.question1),
                                  ),
                                ),
                                LabeledRadio(
                                  label: snapshot.data![index]!.q1Option1,
                                  groupValue: isQ1,
                                  value: false,
                                  onChanged: (bool newValue) {
                                    setState(() {
                                      isQ1 = newValue;
                                    });
                                  },
                                ),
                                LabeledRadio(
                                  label: snapshot.data![index]!.q1Option2,
                                  groupValue: isQ1,
                                  value: true,
                                  onChanged: (bool newValue) {
                                    setState(() {
                                      isQ1 = newValue;
                                    });
                                  },
                                ),
                                Card(
                                  child: ListTile(
                                    title:
                                        Text(snapshot.data![index]!.question2),
                                  ),
                                ),
                                LabeledRadio(
                                  label: snapshot.data![index]!.q2Option1,
                                  groupValue: isQ2,
                                  value: false,
                                  onChanged: (bool newValue) {
                                    setState(() {
                                      isQ2 = newValue;
                                    });
                                  },
                                ),
                                LabeledRadio(
                                  label: snapshot.data![index]!.q2Option2,
                                  groupValue: isQ2,
                                  value: true,
                                  onChanged: (bool newValue) {
                                    setState(() {
                                      isQ2 = newValue;
                                    });
                                  },
                                ),
                                Card(
                                  child: ListTile(
                                    title:
                                        Text(snapshot.data![index]!.question3),
                                  ),
                                ),
                                LabeledRadio(
                                  label: snapshot.data![index]!.q3Option1,
                                  groupValue: isQ3,
                                  value: false,
                                  onChanged: (bool newValue) {
                                    setState(() {
                                      isQ3 = newValue;
                                    });
                                  },
                                ),
                                LabeledRadio(
                                  label: snapshot.data![index]!.q3Option2,
                                  groupValue: isQ3,
                                  value: true,
                                  onChanged: (bool newValue) {
                                    setState(() {
                                      isQ3 = newValue;
                                    });
                                  },
                                ),
                                Card(
                                  child: ListTile(
                                    title:
                                        Text(snapshot.data![index]!.question4),
                                  ),
                                ),
                                LabeledRadio(
                                  label: snapshot.data![index]!.q4Option1,
                                  groupValue: isQ4,
                                  value: false,
                                  onChanged: (bool newValue) {
                                    setState(() {
                                      isQ4 = newValue;
                                    });
                                  },
                                ),
                                LabeledRadio(
                                  label: snapshot.data![index]!.q4Option2,
                                  groupValue: isQ4,
                                  value: true,
                                  onChanged: (bool newValue) {
                                    setState(() {
                                      isQ4 = newValue;
                                    });
                                  },
                                ),
                                Card(
                                  child: ListTile(
                                    title:
                                        Text(snapshot.data![index]!.question5),
                                  ),
                                ),
                                LabeledRadio(
                                  label: snapshot.data![index]!.q5Option2,
                                  groupValue: isQ5,
                                  value: true,
                                  onChanged: (bool newValue) {
                                    setState(() {
                                      isQ5 = newValue;
                                    });
                                  },
                                ),
                                LabeledRadio(
                                  label: snapshot.data![index]!.q5Option1,
                                  groupValue: isQ5,
                                  value: false,
                                  onChanged: (bool newValue) {
                                    setState(() {
                                      isQ5 = newValue;
                                    });
                                  },
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                TextButton(
                                    style: ButtonStyle(
                                        overlayColor: MaterialStateProperty.all(
                                      Colors.transparent,
                                    )),
                                    onPressed: () {
                                      if (isQ1 == true) grade++;
                                      if (isQ2 == true) grade++;
                                      if (isQ3 == true) grade++;
                                      if (isQ4 == true) grade++;
                                      if (isQ5 == true) grade++;
                                      print(grade);
                                      showDialog(
                                          context: context,
                                          builder: (context) => StatefulBuilder(
                                                builder: (BuildContext context,
                                                        void Function(
                                                                void Function())
                                                            setState) =>
                                                    CupertinoAlertDialog(
                                                  title: Text(
                                                      "Your grade is $grade",
                                                      style:
                                                          GoogleFonts.poppins(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.w200,
                                                        color: Colors.red,
                                                      )),
                                                ),
                                              )).then((value) => setState(() {
                                            grade = 0;
                                          }));
                                    },
                                    child: Text(
                                      'Submit',
                                      style: GoogleFonts.poppins(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w300,
                                        color: Colors.red,
                                      ),
                                    )),
                                const SizedBox(
                                  height: 30,
                                ),
                              ],
                            );
                          })
                      : const Center(child: CircularProgressIndicator()),
            ),
          ],
        ),
      ),
    );
  }
}
