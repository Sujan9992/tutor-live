import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tutor_live/core/global_widgets/textfield.dart';

import '../controller/course_controller.dart';

class UpdateCourse extends StatefulWidget {
  const UpdateCourse({Key? key}) : super(key: key);

  @override
  State<UpdateCourse> createState() => _UpdateCourseState();
}

class _UpdateCourseState extends State<UpdateCourse> {
  final id = Get.arguments[0];
  final title = Get.arguments[1];
  final description = Get.arguments[2];
  final category = Get.arguments[3];
  final image = Get.arguments[4];

  final sunday = TextEditingController();
  final monday = TextEditingController();
  final tuesday = TextEditingController();
  final wednesday = TextEditingController();
  final thursday = TextEditingController();
  final friday = TextEditingController();
  final saturday = TextEditingController();

  final question1 = TextEditingController();
  final question2 = TextEditingController();
  final question3 = TextEditingController();
  final question4 = TextEditingController();
  final question5 = TextEditingController();

  final answer1 = TextEditingController();
  final answer2 = TextEditingController();
  final answer3 = TextEditingController();
  final answer4 = TextEditingController();
  final answer5 = TextEditingController();

  final q1Option1 = TextEditingController();
  final q1Option2 = TextEditingController();
  final q2Option1 = TextEditingController();
  final q2Option2 = TextEditingController();
  final q3Option1 = TextEditingController();
  final q3Option2 = TextEditingController();
  final q4Option1 = TextEditingController();
  final q4Option2 = TextEditingController();
  final q5Option1 = TextEditingController();
  final q5Option2 = TextEditingController();

  final lessonTitle = TextEditingController();
  final lessonDescription = TextEditingController();
  File? _image;
  final _picker = ImagePicker();

  final controller = Get.find<CourseController>();

  Future<void> _openImagePicker() async {
    final XFile? pickedImage =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      if (mounted) {
        setState(() {
          _image = File(pickedImage.path);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.red),
        backgroundColor: Colors.transparent,
        title: Text(
          'Create Course Details',
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.red,
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(12),
        child: Column(children: [
          Text(
            'Create Scheduke',
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.w200,
              color: Colors.black,
            ),
          ),
          CustomTextField(
            controller: sunday,
            hintText: 'Sunday',
            icon: Icons.edit_calendar_rounded,
            obscureText: false,
          ),
          CustomTextField(
            controller: monday,
            hintText: 'Monday',
            icon: Icons.edit_calendar_rounded,
            obscureText: false,
          ),
          CustomTextField(
            controller: tuesday,
            hintText: 'Tuesday',
            icon: Icons.edit_calendar_rounded,
            obscureText: false,
          ),
          CustomTextField(
            controller: wednesday,
            hintText: 'Wednesday',
            icon: Icons.edit_calendar_rounded,
            obscureText: false,
          ),
          CustomTextField(
            controller: thursday,
            hintText: 'Thursday',
            icon: Icons.edit_calendar_rounded,
            obscureText: false,
          ),
          CustomTextField(
            controller: friday,
            hintText: 'Friday',
            icon: Icons.edit_calendar_rounded,
            obscureText: false,
          ),
          CustomTextField(
            controller: saturday,
            hintText: 'Saturday',
            icon: Icons.edit_calendar_rounded,
            obscureText: false,
          ),
          TextButton(
              style: ButtonStyle(
                overlayColor:
                    MaterialStateProperty.all<Color>(Colors.transparent),
              ),
              onPressed: () {
                controller.apiRepositoryInterface
                    .createSchedule(
                        id,
                        title,
                        sunday.text,
                        monday.text,
                        tuesday.text,
                        wednesday.text,
                        thursday.text,
                        friday.text,
                        saturday.text)
                    .then((value) => Get.back());
              },
              child: Text(
                'Submit',
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                  color: Colors.black,
                ),
              )),
          const SizedBox(height: 20),
          Text(
            'Create Quizz',
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.w200,
              color: Colors.black,
            ),
          ),
          CustomTextField(
            controller: question1,
            hintText: 'Question 1',
            icon: Icons.edit_rounded,
            obscureText: false,
          ),
          CustomTextField(
            controller: q1Option1,
            hintText: 'Option 1',
            icon: Icons.edit_rounded,
            obscureText: false,
          ),
          CustomTextField(
            controller: q1Option2,
            hintText: 'Option 2',
            icon: Icons.edit_rounded,
            obscureText: false,
          ),
          CustomTextField(
            controller: answer1,
            hintText: 'Answer',
            icon: Icons.edit_rounded,
            obscureText: false,
          ),
          CustomTextField(
            controller: question2,
            hintText: 'Question 2',
            icon: Icons.edit_rounded,
            obscureText: false,
          ),
          CustomTextField(
            controller: q2Option1,
            hintText: 'Option 1',
            icon: Icons.edit_rounded,
            obscureText: false,
          ),
          CustomTextField(
            controller: q2Option2,
            hintText: 'Option 2',
            icon: Icons.edit_rounded,
            obscureText: false,
          ),
          CustomTextField(
            controller: answer2,
            hintText: 'Answer',
            icon: Icons.edit_rounded,
            obscureText: false,
          ),
          CustomTextField(
            controller: question3,
            hintText: 'Question 3',
            icon: Icons.edit_rounded,
            obscureText: false,
          ),
          CustomTextField(
            controller: q3Option1,
            hintText: 'Option 1',
            icon: Icons.edit_rounded,
            obscureText: false,
          ),
          CustomTextField(
            controller: q3Option2,
            hintText: 'Option 2',
            icon: Icons.edit_rounded,
            obscureText: false,
          ),
          CustomTextField(
            controller: answer3,
            hintText: 'Answer',
            icon: Icons.edit_rounded,
            obscureText: false,
          ),
          CustomTextField(
            controller: question4,
            hintText: 'Question 4',
            icon: Icons.edit_rounded,
            obscureText: false,
          ),
          CustomTextField(
            controller: q4Option1,
            hintText: 'Option 1',
            icon: Icons.edit_rounded,
            obscureText: false,
          ),
          CustomTextField(
            controller: q4Option2,
            hintText: 'Option 2',
            icon: Icons.edit_rounded,
            obscureText: false,
          ),
          CustomTextField(
            controller: answer4,
            hintText: 'Answer',
            icon: Icons.edit_rounded,
            obscureText: false,
          ),
          CustomTextField(
            controller: question5,
            hintText: 'Question 5',
            icon: Icons.edit_rounded,
            obscureText: false,
          ),
          CustomTextField(
            controller: q5Option1,
            hintText: 'Option 1',
            icon: Icons.edit_rounded,
            obscureText: false,
          ),
          CustomTextField(
            controller: q5Option2,
            hintText: 'Option 2',
            icon: Icons.edit_rounded,
            obscureText: false,
          ),
          CustomTextField(
            controller: answer5,
            hintText: 'Answer',
            icon: Icons.edit_rounded,
            obscureText: false,
          ),
          TextButton(
              style: ButtonStyle(
                overlayColor:
                    MaterialStateProperty.all<Color>(Colors.transparent),
              ),
              onPressed: () {
                controller.apiRepositoryInterface
                    .createAssignment(
                      id,
                      question1.text,
                      question2.text,
                      question3.text,
                      question4.text,
                      question5.text,
                      answer1.text,
                      answer2.text,
                      answer3.text,
                      answer4.text,
                      answer5.text,
                      q1Option1.text,
                      q1Option2.text,
                      q2Option1.text,
                      q2Option2.text,
                      q3Option1.text,
                      q3Option2.text,
                      q4Option1.text,
                      q4Option2.text,
                      q5Option1.text,
                      q5Option2.text,
                    )
                    .then((value) => Get.back());
              },
              child: Text(
                'Submit',
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                  color: Colors.black,
                ),
              )),
          const SizedBox(height: 20),
          Text(
            'Create Lesson',
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.w200,
              color: Colors.black,
            ),
          ),
          TextButton(
            style: ButtonStyle(
              overlayColor: MaterialStateProperty.all(Colors.transparent),
            ),
            onPressed: _openImagePicker,
            child: Text('Add Image',
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                    color: Colors.red,
                    fontSize: 22,
                    fontWeight: FontWeight.w300,
                  ),
                )),
          ),
          const SizedBox(
            width: 35,
          ),
          Container(
            height: Get.height * 0.2,
            width: Get.width * 0.45,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: const BorderRadius.all(Radius.circular(20)),
            ),
            child: _image != null
                ? Image.file(
                    _image!,
                    fit: BoxFit.cover,
                  )
                : const Center(
                    child: Text('No Image Selected'),
                  ),
          ),
          CustomTextField(
            controller: lessonTitle,
            hintText: 'Lesson Title',
            icon: Icons.edit_rounded,
            obscureText: false,
          ),
          CustomTextField(
            controller: lessonDescription,
            hintText: 'Lesson Description',
            icon: Icons.edit_rounded,
            obscureText: false,
          ),
          TextButton(
              style: ButtonStyle(
                overlayColor:
                    MaterialStateProperty.all<Color>(Colors.transparent),
              ),
              onPressed: () {
                controller.apiRepositoryInterface
                    .createLesson(
                      id,
                      lessonTitle.text,
                      lessonDescription.text,
                      _image!,
                    )
                    .then((value) => Get.back());
              },
              child: Text(
                'Submit',
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                  color: Colors.black,
                ),
              )),
        ]),
      ),
    );
  }
}
