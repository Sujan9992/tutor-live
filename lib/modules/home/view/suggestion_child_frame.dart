import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../courses/controller/course_controller.dart';

class SuggestionChildFrame extends StatefulWidget {
  const SuggestionChildFrame({Key? key}) : super(key: key);

  @override
  State<SuggestionChildFrame> createState() => _SuggestionChildFrameState();
}

class _SuggestionChildFrameState extends State<SuggestionChildFrame> {
  final controller = Get.find<CourseController>();

  int _index = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: controller.enrolledCourseList.length,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(4, 12, 4, 4),
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: TabBar(
              physics: const BouncingScrollPhysics(),
              isScrollable: true,
              onTap: controller.onChildTabChanged,
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
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: -1.0),
              ),
              tabs: [
                for (var course in controller.enrolledCourseList)
                  Tab(text: course.title)
              ]),
          body: TabBarView(
            physics: const BouncingScrollPhysics(),
            children: [
              for (var course in controller.enrolledCourseList)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FutureBuilder(
                    future: controller.apiRepositoryInterface
                        .getLessons(course.courseId),
                    builder: (BuildContext context,
                            AsyncSnapshot<dynamic> snapshot) =>
                        (snapshot.hasData)
                            ? ListView.builder(
                                shrinkWrap: true,
                                physics: const BouncingScrollPhysics(),
                                itemCount: 1,
                                itemBuilder: (BuildContext context,
                                        int index_) =>
                                    Stepper(
                                      physics: const BouncingScrollPhysics(),
                                      currentStep: _index,
                                      onStepCancel: () {
                                        if (_index > 0) {
                                          setState(() {
                                            _index--;
                                          });
                                        }
                                      },
                                      onStepContinue: () {
                                        if (_index <= 0) {
                                          setState(() {
                                            _index++;
                                          });
                                        }
                                      },
                                      onStepTapped: (int index) {
                                        setState(() {
                                          _index = index;
                                        });
                                      },
                                      steps: [
                                        for (var lesson in snapshot.data)
                                          Step(
                                            title: Text(lesson.title),
                                            content: Text(lesson.description),
                                          )
                                      ],
                                      // steps: <Step>[
                                      //   // Step(
                                      //   //   title: const Text('Step 1 title'),
                                      //   //   content: Container(
                                      //   //       alignment: Alignment.centerLeft,
                                      //   //       child: const Text(
                                      //   //           'Content for Step 1')),
                                      //   // ),
                                      //   // const Step(
                                      //   //   title: Text('Step 2 title'),
                                      //   //   content: Text('Content for Step 2'),
                                      //   // ),
                                      // ],
                                    ))
                            : const Center(child: CircularProgressIndicator()),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
    // return Expanded(
    //   child: Column(
    //     children: [
    //       Row(
    //         children: [
    //           Padding(
    //             padding: const EdgeInsets.all(12.0),
    //             child: Container(
    //               decoration: BoxDecoration(
    //                 borderRadius: BorderRadius.circular(10),
    //                 color: Colors.red,
    //               ),
    //               child: const Padding(
    //                 padding: EdgeInsets.all(4.0),
    //                 child: Text(
    //                   'Law',
    //                   style: TextStyle(
    //                     color: Colors.black,
    //                     fontSize: 18,
    //                     fontWeight: FontWeight.bold,
    //                   ),
    //                 ),
    //               ),
    //             ),
    //           )
    //         ],
    //       ),
    //       Stepper(
    //         currentStep: _index,
    //         onStepCancel: () {
    //           if (_index > 0) {
    //             setState(() {
    //               _index -= 1;
    //             });
    //           }
    //         },
    //         onStepContinue: () {
    //           if (_index <= 0) {
    //             setState(() {
    //               _index += 1;
    //             });
    //           }
    //         },
    //         onStepTapped: (int index) {
    //           setState(() {
    //             _index = index;
    //           });
    //         },
    //         steps: <Step>[
    //           Step(
    //             title: const Text('Lesson 1 Intro to law'),
    //             content: Container(
    //                 alignment: Alignment.centerLeft,
    //                 child: const Text('Content for Step 1')),
    //           ),
    //           const Step(
    //             title: Text('Lesson 2 Importance of law'),
    //             content: Text('Content for Step 2'),
    //           ),
    //         ],
    //       ),
    //     ],
    //   ),
    // );
  }
}
