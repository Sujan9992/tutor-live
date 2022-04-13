import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../routes/pages.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: IntroductionScreen(
        pages: [
          PageViewModel(
            title: 'Enroll a course',
            body: 'Achieve you goals',
            image: buildImage('assets/lottie/1.gif'),
            decoration: getPageDecoration(),
          ),
          PageViewModel(
            title: 'Become a tutor',
            body: 'Share the knowledge',
            image: buildImage('assets/lottie/2.gif'),
            decoration: getPageDecoration(),
          ),
          PageViewModel(
            title: 'And more',
            body: "Let's dig deep.",
            image: buildImage('assets/lottie/3.gif'),
            decoration: getPageDecoration(),
          ),
        ],
        done: Text(
          'Begin'.tr,
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
        ),
        onDone: () async {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setBool('isFirst', false);
          Get.offAllNamed(Routes.auth);
        },
        showSkipButton: true,
        skip: const Text('Skip'),
        next: const Text('Next'),
        dotsDecorator: getDotDecoration(),
      ),
    );
  }

  Widget buildImage(String path) => Center(child: Image.asset(path));
  PageDecoration getPageDecoration() => PageDecoration(
        imageFlex: 3,
        titleTextStyle:
            GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 18),
        bodyTextStyle:
            GoogleFonts.poppins(fontWeight: FontWeight.normal, fontSize: 14),
        imagePadding: const EdgeInsets.all(8),
        pageColor: Colors.white,
      );
  DotsDecorator getDotDecoration() => DotsDecorator(
        color: Colors.red.shade200,
        activeColor: Colors.red,
        size: const Size(10, 10),
        activeSize: const Size(22, 10),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      );
}
