import 'package:get/get.dart';
import '../Profile/user_profile.dart';
import '../modules/chat/view/chat_details.dart';
import '../modules/courses/view/course_update.dart';
import '../modules/courses/view/manage_course.dart';
import '../modules/courses/view/course_page.dart';
import '../Profile/user_details_page.dart';
import '../modules/courses/view/lesson_detail.dart';
import '../modules/courses/view/quizz_page.dart';

import '../main_binding.dart';
import '../modules/add_course/add_course_page.dart';
import '../modules/auth/controller/auth_binding.dart';
import '../modules/auth/view/auth_screen.dart';
import '../modules/courses/controller/course_bindings.dart';
import '../modules/courses/view/course_details.dart';
import '../modules/courses/view/course_frame.dart';
import '../modules/home/controller/home_page_binding.dart';
import '../modules/home/homepage.dart';
import '../modules/onboarding/view/onboarding_page.dart';
import '../modules/splash/view/splash.dart';
import '../modules/splash/controller/splash_binding.dart';

part './routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.splash,
      page: () => const SplashPageScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.onboard,
      page: () => const OnboardingPage(),
    ),
    GetPage(
      name: Routes.auth,
      page: () => const AuthScreen(),
      binding: AuthBinding(),
      bindings: [
        MainBinding(),
        AuthBinding(),
      ],
    ),
    GetPage(
      name: Routes.home,
      page: () => HomePage(),
      binding: HomePageBinding(),
      bindings: [
        HomePageBinding(),
        MainBinding(),
        CourseBinding(),
        AuthBinding(),
      ],
    ),
    GetPage(
      name: Routes.courses,
      page: () => CourseFrame(),
      binding: CourseBinding(),
      bindings: [
        MainBinding(),
        CourseBinding(),
      ],
    ),
    GetPage(name: Routes.addCourse, page: () => AddCourse()),
    GetPage(name: Routes.courseDetail, page: () => CourseDetail()),
    GetPage(name: Routes.lessonDetail, page: () => LessonDetail()),
    GetPage(name: Routes.quizz, page: () => Quizz()),
    GetPage(name: Routes.profile, page: () => UserDetails()),
    GetPage(name: Routes.coursePage, page: () => CoursesPage()),
    GetPage(name: Routes.userProfile, page: () => UserProfile()),
    GetPage(name: Routes.manageCourse, page: () => ManageCourse()),
    GetPage(name: Routes.updateCourse, page: () => UpdateCourse()),
    GetPage(name: Routes.chatDetails, page: () => ChatDetails()),
  ];
}
