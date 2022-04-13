import 'package:get/get.dart';
import '../app/modules/courses/course_bindings.dart';
import '../app/modules/courses/course_frame.dart';
import '../app/bindings/main_binding.dart';
import '../app/modules/auth/auth_binding.dart';
import '../app/modules/auth/auth_screen.dart';
import '../app/modules/splash/splash_binding.dart';
import '../app/modules/onboarding/onboarding_page.dart';
import '../app/modules/splash/splash.dart';

import '../app/modules/home/homepage.dart';

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
