import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'auth_form.dart';
import 'auth_controller.dart';

import '../../../routes/pages.dart';

class AuthScreen extends GetWidget<AuthController> {
  const AuthScreen({Key? key}) : super(key: key);

  void login() async {
    var result = await controller.login();
    if (result) {
      debugPrint('---------------');
      debugPrint('user is set {auth_screen.dart - login}');
      debugPrint('---------------');
      Get.offAllNamed(Routes.home);
    } else {
      debugPrint('---------------');
      debugPrint('user is null {auth_screen.dart - login}');
      debugPrint('---------------');
      Get.snackbar('Error', 'Incorrect email or password');
    }
  }

  void register() async {
    final result = await controller.register();
    if (result) {
      debugPrint('---------------');
      debugPrint('user is set {auth_screen.dart - register}');
      debugPrint('---------------');
      Get.offAllNamed(Routes.home);
    } else {
      debugPrint('---------------');
      debugPrint('user is null {auth_screen.dart - register}');
      debugPrint('---------------');
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
