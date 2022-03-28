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
      print('---------------');
      print('user is set');
      print('---------------');
      Get.offAllNamed(Routes.home);
    } else {
      print('---------------');
      print('user is null {auth_screen.dart - login}');
      print('---------------');
      Get.snackbar('Error', 'Incorrect email or password');
    }
  }

  void register() async {
    final result = await controller.register();
    if (result) {
      print('---------------');
      print('user is set');
      print('---------------');
      Get.offAllNamed(Routes.home);
    } else {
      print('---------------');
      print('user is null {auth_screen.dart - register}');
      print('---------------');
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
