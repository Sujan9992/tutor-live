import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../domain/request/login_request.dart';

import '../../domain/repository/api_repository.dart';
import '../../domain/repository/local_repository.dart';
import '../../domain/request/register_request.dart';

enum AuthType { signIn, signUp }

class AuthController extends GetxController {
  final LocalRepositoryInterface localRepositoryInterface;
  final ApiRepositoryInterface apiRepositoryInterface;

  AuthController(this.localRepositoryInterface, this.apiRepositoryInterface);

  final passwordTextController = TextEditingController();
  final confirmPasswordTextController = TextEditingController();
  final fullnameTexController = TextEditingController();
  final emailTextController = TextEditingController();

  var isLoading = false.obs;
  RxBool isLoggedIn = true.obs;
  RxBool showPassword = true.obs;
  var isValidPassword = false.obs;

  toggleFormType() {
    isLoggedIn(!isLoggedIn.value);
  }

  toggleShowPassword() {
    showPassword(!showPassword.value);
  }

  Future<bool> login() async {
    final email = emailTextController.text;
    final password = passwordTextController.text;

    try {
      isLoading(true);
      print('---------------');
      print('loading {auth_controller.dart - login}');
      print('---------------');
      final loginResponse =
          await apiRepositoryInterface.login(LoginRequest(email, password));
      print('---------------');
      print('loginResponse {auth_controller.dart - login}');
      print('---------------');
      if (loginResponse != null) {
        await localRepositoryInterface.setToken(loginResponse.token);
        await localRepositoryInterface.setUser(loginResponse.user);
        print('---------------');
        print('user is set {auth_controller.dart - login}');
        print('---------------');
        return true;
      } else {
        print('---------------');
        print('user is null {auth_controller.dart - login}');
        print('---------------');
        isLoading(false);
        return false;
      }
    } on Exception {
      print('---------------');
      print('exception {auth_controller.dart - login}');
      print('---------------');
      isLoading(false);
      return false;
    }
  }

  Future<bool> register() async {
    final fullname = fullnameTexController.text;
    final email = emailTextController.text;
    final password = passwordTextController.text;
    final confirmPassword = passwordTextController.text;
    try {
      isLoading(true);
      print('-------------------');
      print('try {auth_controller - register}');
      print('-------------------');
      final registerResponse = await apiRepositoryInterface.register(
        RegisterRequest(
          fullName: fullname,
          email: email,
          password: password,
          confirmPassword: confirmPassword,
        ),
      );
      print('-------------------');
      print(registerResponse);
      print('-------------------');
      if (registerResponse != null) {
        await localRepositoryInterface.setToken(registerResponse.token);
        await localRepositoryInterface.setUser(registerResponse.user);
        return true;
      } else {
        print('-------------------');
        print('success {auth_controller - register}');
        print('-------------------');
        isLoading(false);
        return false;
      }
    } on Exception {
      isLoading(false);
      return false;
    }
  }
}
