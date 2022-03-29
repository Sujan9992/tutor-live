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

  Future<bool> login() async {
    final email = emailTextController.text;
    final password = passwordTextController.text;

    try {
      isLoading(true);
      debugPrint('---------------');
      debugPrint('loading {auth_controller.dart - login}');
      debugPrint('---------------');
      final loginResponse = await apiRepositoryInterface.login(
        LoginRequest(
          email,
          password,
        ),
      );

      if (loginResponse != null) {
        debugPrint('---------------');
        debugPrint('user logged in {auth_controller.dart - login}');
        debugPrint('---------------');
        await localRepositoryInterface.setToken(loginResponse.token);
        await localRepositoryInterface.setUser(loginResponse.user);
        debugPrint('-------------------');
        debugPrint('user is set on local storage {auth_controller - register}');
        debugPrint('-------------------');
        return true;
      } else {
        debugPrint('---------------');
        debugPrint('loginresponse is null {auth_controller.dart - login}');
        debugPrint('---------------');
        isLoading(false);
        return false;
      }
    } on Exception {
      debugPrint('---------------');
      debugPrint('exception {auth_controller.dart - login}');
      debugPrint('---------------');
      isLoading(false);
      return false;
    }
  }

  Future<bool> register() async {
    final fullname = fullnameTexController.text;
    final email = emailTextController.text;
    final password = passwordTextController.text;
    try {
      isLoading(true);
      debugPrint('-------------------');
      debugPrint('try {auth_controller - register}');
      debugPrint('-------------------');
      final registerResponse = await apiRepositoryInterface.register(
        RegisterRequest(
          fullname,
          email,
          password,
        ),
      );
      if (registerResponse != null) {
        debugPrint('user is registered {auth_controller - register}');
        debugPrint('-------------------');
        await localRepositoryInterface.setToken(registerResponse.token);
        await localRepositoryInterface.setUser(registerResponse.user);
        debugPrint('-------------------');
        debugPrint('user is set on local storage {auth_controller - register}');
        debugPrint('-------------------');
        return true;
      } else {
        debugPrint('-------------------');
        debugPrint('register response is null {auth_controller - register}');
        debugPrint('-------------------');
        isLoading(false);
        return false;
      }
    } on Exception {
      debugPrint('---------------');
      debugPrint('exception {auth_controller.dart - register}');
      debugPrint('---------------');
      isLoading(false);
      return false;
    }
  }
}
