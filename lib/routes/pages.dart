import 'package:get/get.dart';

import '../main_binding.dart';
import '../modules/auth/controller/auth_binding.dart';
import '../modules/auth/view/auth_screen.dart';
import '../modules/courses/controller/course_bindings.dart';
import '../modules/courses/view/course_frame.dart';
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
      bindings: [
        MainBinding(),
        CourseBinding(),
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
  ];
}
