import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/utils/date_converter.dart';
import '../controller/homepage_controller.dart';

class CalendarChildFrame extends StatelessWidget {
  CalendarChildFrame({Key? key}) : super(key: key);
  final HomePageController controller = Get.put(HomePageController());

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            const SizedBox(height: 10),
            DefaultTabController(
              initialIndex: controller.weekTabIndex.value,
              length: 7,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(4, 0, 4, 0),
                child: TabBar(
                  physics: const BouncingScrollPhysics(),
                  isScrollable: true,
                  onTap: (index) {
                    controller.weekTabIndex.value = index;
                  },
                  unselectedLabelColor: Colors.black,
                  unselectedLabelStyle: const TextStyle(fontSize: 12),
                  labelColor: Colors.black,
                  labelStyle: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.bold),
                  indicator: const BubbleTabIndicator(
                    indicatorHeight: 10.0,
                    indicatorRadius: 40.0,
                    indicatorColor: Colors.red,
                    tabBarIndicatorSize: TabBarIndicatorSize.label,
                    insets: EdgeInsets.symmetric(horizontal: 2.0),
                    padding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: -1.0),
                  ),
                  tabs: [
                    for (var day in DateConverter.weekDays()) Tab(text: day),
                  ],
                ),
              ),
            ),
            Flexible(
              child: Column(
                children: [
                  Expanded(
                    flex: 4,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ConstrainedBox(
                            constraints: BoxConstraints(
                              maxWidth: Get.width - 80,
                              maxHeight: Get.width - 80,
                            ),
                            child: Image.asset(
                              'assets/lottie/8.gif',
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            'A break-day! 🤩'.tr,
                            style: GoogleFonts.nunitoSans(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "Enjoy yourself, have a nice day".tr,
                            style: GoogleFonts.nunitoSans(
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}
