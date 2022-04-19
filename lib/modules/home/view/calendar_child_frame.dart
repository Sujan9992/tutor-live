import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/utils/date_converter.dart';
import '../controller/homepage_controller.dart';

class CalendarChildFrame extends StatelessWidget {
  CalendarChildFrame({Key? key}) : super(key: key);
  final controller = Get.find<HomePageController>();

  @override
  Widget build(BuildContext context) => DefaultTabController(
        initialIndex: controller.weekTabIndex.value,
        length: 7,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(4, 12, 4, 0),
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: TabBar(
              physics: const BouncingScrollPhysics(),
              isScrollable: true,
              onTap: (index) => controller.weekTabIndex.value = index,
              unselectedLabelColor: Colors.black,
              unselectedLabelStyle: const TextStyle(fontSize: 12),
              labelColor: Colors.black,
              labelStyle:
                  const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              indicator: const BubbleTabIndicator(
                  indicatorHeight: 10.0,
                  indicatorRadius: 40.0,
                  indicatorColor: Colors.red,
                  tabBarIndicatorSize: TabBarIndicatorSize.label,
                  insets: EdgeInsets.symmetric(horizontal: 2.0),
                  padding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: -1.0)),
              tabs: [for (var day in DateConverter.weekDays()) Tab(text: day)],
            ),
            body: TabBarView(
              physics: const BouncingScrollPhysics(),
              children: [
                for (var day in DateConverter.weekDays())
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FutureBuilder(
                      future: controller.apiRepositoryInterface.getSchedules(),
                      builder: (BuildContext context,
                              AsyncSnapshot<dynamic> snapshot) =>
                          (snapshot.hasData)
                              ? ListView.builder(
                                  itemCount: snapshot.data.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    Text? subtitle;
                                    switch (day) {
                                      case 'Mon':
                                        subtitle =
                                            Text(snapshot.data[index].monday);
                                        break;
                                      case 'Tue':
                                        subtitle =
                                            Text(snapshot.data[index].tuesday);
                                        break;
                                      case 'Wed':
                                        subtitle = Text(
                                            snapshot.data[index].wednesday);
                                        break;
                                      case 'Thu':
                                        subtitle =
                                            Text(snapshot.data[index].thursday);
                                        break;
                                      case 'Fri':
                                        subtitle =
                                            Text(snapshot.data[index].friday);
                                        break;
                                      case 'Sat':
                                        subtitle =
                                            Text(snapshot.data[index].saturday);
                                        break;
                                      case 'Sun':
                                        subtitle =
                                            Text(snapshot.data[index].sunday);
                                        break;
                                    }
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Card(
                                        child: ListTile(
                                          title:
                                              Text(snapshot.data[index].title),
                                          subtitle: subtitle,
                                        ),
                                      ),
                                    );
                                  })
                              : const Center(
                                  child: CircularProgressIndicator()),
                    ),
                  ),
              ],
            ),
          ),
        ),
      );
}
