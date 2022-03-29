import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'splash_controller.dart';

class SplashPageScreen extends GetWidget<SplashController> {
  const SplashPageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SafeArea(
          child: Column(
            children: const [
              SizedBox(),
              CircularProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}
