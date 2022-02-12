import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../routes/pages.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Hero(
                  tag: "logo",
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        child: Image.asset("assets/images/logo.png"),
                        width: 100,
                        height: 100,
                      ),
                      Material(
                        color: Colors.transparent,
                        child: Text(
                          "Tutor Live",
                          style: GoogleFonts.suezOne(
                            color: Colors.white,
                            fontSize: 32,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                      Material(
                        color: Colors.transparent,
                        child: Text(
                          "Move forward",
                          style: GoogleFonts.nunitoSans(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Expanded(
                      child: Hero(
                        tag: "bottom bar",
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(200),
                              topRight: Radius.circular(200),
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 4,
                                child: Image.asset(
                                    "assets/images/welcome_page_img.png"),
                              ),
                              Expanded(
                                flex: 2,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    SizedBox(
                                      width: double.infinity,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10.0, right: 10.0),
                                        child: ElevatedButton(
                                          onPressed: () {
                                            //Get.toNamed(Routes.AUTH);
                                          },
                                          child: const Text('login'),
                                          //style: primaryButtonSytle,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    SizedBox(
                                      width: double.infinity,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10.0, right: 10.0),
                                        child: OutlinedButton(
                                          onPressed: () {
                                            //Get.toNamed(Routes.SIGNUP);
                                          },
                                          child: Text('sign_up'.tr),
                                          //style: outlinedButtonStyle,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
