import 'package:get/get.dart';
import 'package:tutor_live/app/modules/onboarding/onboarding_page.dart';

import '../app/modules/home/homepage.dart';

part './routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(name: Routes.onboard, page: () => const OnboardingPage()),
    GetPage(name: Routes.home, page: () => const HomePage()),
  ];
}
