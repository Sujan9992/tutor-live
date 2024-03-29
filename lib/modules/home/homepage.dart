import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/global_widgets/end_drawer.dart';
import '../../core/global_widgets/drawer.dart';
import '../chat/view/chat_frame.dart';
import '../courses/view/course_frame.dart';
import 'controller/homepage_controller.dart';
import '../notification/view/notification_frame.dart';
import 'view/home_frame.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final controller = Get.find<HomePageController>();
  final GlobalKey _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        iconTheme: Theme.of(context).iconTheme,
        toolbarHeight: Get.height * 0.12,
        backgroundColor: Colors.transparent,
        title: Image.asset('assets/images/logo.png', height: Get.height * 0.2),
        centerTitle: true,
        elevation: 0,
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.library_books_rounded),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        actions: <Widget>[
          Center(
            child: Builder(
              builder: (context) {
                return IconButton(
                    onPressed: () {
                      Scaffold.of(context).openEndDrawer();
                    },
                    icon: const Icon(Icons.person_rounded));
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
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
            fontWeight: FontWeight.w100,
          ),
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
              activeIcon: Icon(Icons.notifications_rounded),
            ),
            BottomNavigationBarItem(
              label: 'Chat',
              icon: Icon(Icons.chat_outlined),
              activeIcon: Icon(Icons.chat_rounded),
            ),
          ],
        ),
      ),
      drawer: const Drawer(child: DrawerMenu()),
      endDrawer: const Drawer(child: EndDrawer()),
      body: Container(
        height: Get.height - Get.height * 0.12 - kBottomNavigationBarHeight,
        width: Get.width,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade300,
                offset: const Offset(0.0, 1.0), //(x,y) co-rdinates
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
            CourseFrame(),
            NotificationFrame(),
            ChatFrame(),
          ],
        ),
      ),
    );
  }
}
