import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/tutor_live_user.dart';

class HomePageController extends GetxController {
  var tabpageIndex = 0.obs;
  var isOnMain = true.obs;
  var childTabIndex = 0.obs;
  var targetPage = 0;
  var weekTabIndex = 0.obs;
  var isFetching = false.obs;
  var needChangeNavigator = true;
  TutorLiveUser? mainUser;

  PageController pageController = PageController();

  @override
  void onInit() {
    super.onInit();
    isFetching.value = true;
    weekTabIndex.value = DateTime.now().weekday - 1;
    isFetching.value = false;
  }

  oncChildTabChanged(int index) {
    childTabIndex.value = index;
  }

  onPageChanged(int index) {
    if (index == targetPage && needChangeNavigator) {
      tabpageIndex.value = index;
      switch (index) {
        case 1:
          break;
        default:
          break;
      }
    }
  }

  onBottomNavigationBarChanged(int index) async {
    tabpageIndex.value = index;
    needChangeNavigator = false;
    await pageController.animateToPage(
      tabpageIndex.value,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
    switch (index) {
      case 1:
        break;
      case 2:
        break;
      case 3:
        break;
      default:
        break;
    }
    targetPage = index;
    needChangeNavigator = true;
  }
}

extension TimeOfDayExtension on TimeOfDay {
  int compareTo(TimeOfDay other) {
    if (hour < other.hour) return -1;
    if (hour > other.hour) return 1;
    if (minute < other.minute) return -1;
    if (minute > other.minute) return 1;
    return 0;
  }
}
