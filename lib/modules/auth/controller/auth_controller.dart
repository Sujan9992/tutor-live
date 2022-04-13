import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../domain/repository/api_repository.dart';
import '../../../domain/repository/local_repository.dart';
import '../../../domain/request/login_request.dart';

import '../../../domain/request/register_request.dart';

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
      final loginResponse =
          await apiRepositoryInterface.login(LoginRequest(email, password));

      if (loginResponse != null) {
        await localRepositoryInterface.setToken(loginResponse.token);
        await localRepositoryInterface.setUser(loginResponse.user);
        return true;
      } else {
        isLoading(false);
        return false;
      }
    } on Exception {
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
      final registerResponse = await apiRepositoryInterface
          .register(RegisterRequest(fullname, email, password));
      if (registerResponse != null) {
        await localRepositoryInterface.setToken(registerResponse.token);
        await localRepositoryInterface.setUser(registerResponse.user);
        return true;
      } else {
        isLoading(false);
        return false;
      }
    } on Exception {
      isLoading(false);
      return false;
    }
  }
}
