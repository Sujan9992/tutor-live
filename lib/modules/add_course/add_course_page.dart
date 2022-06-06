import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import '../../core/global_widgets/textfield.dart';
import '../courses/controller/course_controller.dart';

class AddCourse extends StatefulWidget {
  const AddCourse({Key? key}) : super(key: key);

  @override
  State<AddCourse> createState() => _AddCourseState();
}

class _AddCourseState extends State<AddCourse> {
  @override
  void initState() {
    super.initState();
    for (var category in controller.categoryList) {
      categories.add(category.title);
    }
  }

  final controller = Get.find<CourseController>();
  final txtCourseController = TextEditingController();
  final txtCourseDesController = TextEditingController();
  List<String> categories = [];
  late String dropValue = categories[0];
  File? _image;
  final _picker = ImagePicker();

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
        body: SingleChildScrollView(
            child: Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 50,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextButton.icon(
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                ),
                onPressed: () => Get.back(),
                icon: const Icon(Icons.arrow_back_ios_rounded),
                label: const Text('Create Course'),
              ),
            ],
          ),
          const SizedBox(
            width: 25,
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
          const SizedBox(
            width: 35,
          ),
          SizedBox(
            width: Get.width * 0.85,
            child: CustomTextField(
              controller: txtCourseController,
              hintText: 'Course Name',
              icon: Icons.book_rounded,
              obscureText: false,
            ),
          ),
          SizedBox(
            width: Get.height * 0.2,
          ),
          SizedBox(
            width: Get.width * 0.85,
            child: CustomTextField(
              controller: txtCourseDesController,
              hintText: 'Course Description',
              icon: Icons.description_rounded,
              obscureText: false,
            ),
          ),
          SizedBox(
            width: Get.height * 0.2,
          ),
          DropdownButton<String>(
              value: dropValue,
              icon: const Icon(Icons.arrow_drop_down),
              style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                  color: Colors.red,
                  fontSize: 22,
                  fontWeight: FontWeight.w300,
                ),
              ),
              onChanged: (String? newValue) {
                setState(() {
                  dropValue = newValue!;
                });
              },
              items: [
                ...categories.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                })
              ]),
          TextButton(
            style: ButtonStyle(
              overlayColor: MaterialStateProperty.all(Colors.transparent),
            ),
            onPressed: () async {
              await controller.apiRepositoryInterface.createCourse(
                txtCourseController.text,
                txtCourseDesController.text,
                dropValue,
                _image!,
              );
              Get.back();
              setState(() {});
            },
            child: const Text(
              'Submit',
              style: TextStyle(color: Colors.red, fontSize: 20),
            ),
          ),
        ],
      ),
    )));
  }
}
