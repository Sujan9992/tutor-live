import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../routes/pages.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        toolbarHeight: Get.height * 0.12,
        backgroundColor: Colors.transparent,
        title: Image.asset(
          'assets/images/logo.png',
          height: Get.height * 0.15,
        ),
        centerTitle: true,
        elevation: 0,
        actions: [
          Center(
            child: TextButton.icon(
              onPressed: () {
                // Get.toNamed(Routes.TEXTING);
              },
              icon: const Icon(
                Icons.chat_rounded,
                color: Colors.black,
                size: 30,
              ),
              label: const Text(''),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
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
            icon: Icon(Icons.home),
            activeIcon: Icon(Icons.home_rounded),
          ),
          BottomNavigationBarItem(
            label: 'Courses',
            icon: Icon(Icons.video_library_outlined),
            activeIcon: Icon(Icons.video_library_rounded),
          ),
          BottomNavigationBarItem(
              label: 'Notifications',
              icon: Icon(Icons.notifications),
              activeIcon: Icon(Icons.notifications_rounded)),
          BottomNavigationBarItem(
            label: 'Profile',
            icon: Icon(Icons.person),
            activeIcon: Icon(Icons.person_rounded),
          ),
        ],
      ),
      body: Container(
        height: Get.height - Get.height * 0.12 - kBottomNavigationBarHeight,
        width: Get.width,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
      ),
    );
  }
}
