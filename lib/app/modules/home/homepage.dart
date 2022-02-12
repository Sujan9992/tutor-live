import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tutor_live/app/modules/courses/course_frame.dart';
import 'package:tutor_live/app/modules/home/controller/homepage_controller.dart';
import 'package:tutor_live/app/modules/home/widgets/home_frame.dart';
import 'package:tutor_live/app/modules/notification/notification_frame.dart';
import 'package:tutor_live/app/modules/profile/profile_frame.dart';

import '../../../routes/pages.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final HomePageController controller = Get.put(HomePageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        toolbarHeight: Get.height * 0.12,
        backgroundColor: Colors.transparent,
        title: Image.asset('assets/images/logo.png', height: Get.height * 0.2),
        centerTitle: true,
        elevation: 0,
        actions: [
          Center(
            child: TextButton.icon(
              style: ButtonStyle(
                  overlayColor:
                      MaterialStateProperty.all<Color>(Colors.transparent)),
              onPressed: () {
                // Get.toNamed(Routes.TEXTING);
              },
              icon:
                  const Icon(Icons.chat_rounded, color: Colors.black, size: 30),
              label: const Text(''),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
            onTap: controller.onBottomNavigationBarChanged,
            currentIndex: controller.tabpageIndex.value,
            backgroundColor: Colors.white,
            elevation: 0,
            selectedItemColor: Colors.red,
            unselectedItemColor: Colors.black,
            selectedLabelStyle:
                TextStyle(fontFamily: GoogleFonts.suezOne().fontFamily),
            unselectedLabelStyle: TextStyle(
                fontFamily: GoogleFonts.sunflower().fontFamily,
                fontWeight: FontWeight.w100),
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(
                label: 'Home',
                icon: Icon(Icons.home_outlined),
                activeIcon: Icon(Icons.home_rounded),
              ),
              BottomNavigationBarItem(
                label: 'Courses',
                icon: Icon(Icons.video_library_outlined),
                activeIcon: Icon(Icons.video_library_rounded),
              ),
              BottomNavigationBarItem(
                  label: 'Notifications',
                  icon: Icon(Icons.notifications_outlined),
                  activeIcon: Icon(Icons.notifications_rounded)),
              BottomNavigationBarItem(
                  label: 'Profile',
                  icon: Icon(Icons.person_outline),
                  activeIcon: Icon(Icons.person_rounded)),
            ],
          )),
      body: Container(
        height: Get.height - Get.height * 0.12 - kBottomNavigationBarHeight,
        width: Get.width,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade300,
                offset: const Offset(0.0, 1.0), //(x,y)
                blurRadius: 6.0),
          ],
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: PageView(
          physics: const BouncingScrollPhysics(),
          onPageChanged: (index) {
            controller.targetPage = index;
            controller.onPageChanged(index);
          },
          controller: controller.pageController,
          children: [
            HomeFrame(),
            const CourseFrame(),
            const NotificationFrame(),
            const ProfileFrame(),
          ],
        ),
      ),
    );
  }
}
