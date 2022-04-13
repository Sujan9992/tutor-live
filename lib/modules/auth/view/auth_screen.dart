import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'auth_form.dart';
import '../controller/auth_controller.dart';

import '../../../../routes/pages.dart';

class AuthScreen extends GetWidget<AuthController> {
  const AuthScreen({Key? key}) : super(key: key);

  void login() async {
    var result = await controller.login();
    if (result) {
      Get.offAllNamed(Routes.home);
    } else {
      Get.snackbar('Error', 'Incorrect email or password');
    }
  }

  void register() async {
    final result = await controller.register();
    if (result) {
      Get.offAllNamed(Routes.home);
    } else {
      Get.snackbar('Error', 'Invalid');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Obx(
                () => AuthForm(
                  fullname: controller.fullnameTexController,
                  email: controller.emailTextController,
                  password: controller.passwordTextController,
                  confirmPassword: controller.confirmPasswordTextController,
                  authType: controller.isLoggedIn.value
                      ? () => register()
                      : () => login(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
