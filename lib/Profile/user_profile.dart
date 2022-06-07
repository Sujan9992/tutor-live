import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../core/constants.dart';

class UserProfile extends StatelessWidget {
  UserProfile({Key? key}) : super(key: key);
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
          'Profile',
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.red,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
              child: ClipOval(
                child: image != null
                    ? Image.network('${Constants.mainUrl}$image')
                    : Image.asset('assets/images/images.jpg'),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              '$name',
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w300,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Contact Information :',
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w300,
                color: Colors.red.shade200,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              '$email',
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w200,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: TextButton(
        style: ButtonStyle(
          overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
        ),
        onPressed: () {
          // Get.toNamed('/quizz', arguments: [course_id, title]);
        },
        child: Text('Update',
            style: GoogleFonts.poppins(
              fontSize: 15,
              fontWeight: FontWeight.w300,
              color: Colors.red,
            )),
      ),
    );
  }
}
