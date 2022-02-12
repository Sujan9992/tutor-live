import 'package:get/get.dart';
import 'package:tutor_live/app/modules/auth/login_page.dart';
import 'package:tutor_live/app/modules/auth/signup_page.dart';
import 'package:tutor_live/app/modules/auth/welcome_page.dart';
import 'package:tutor_live/app/modules/onboarding/onboarding_page.dart';

import '../app/modules/home/homepage.dart';

part './routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(name: Routes.onboard, page: () => const OnboardingPage()),
    GetPage(name: Routes.welcome, page: () => const WelcomePage()),
    GetPage(name: Routes.signup, page: () => SignupPage()),
    GetPage(name: Routes.login, page: () => LoginPage()),
    GetPage(name: Routes.home, page: () => HomePage()),
  ];
}
