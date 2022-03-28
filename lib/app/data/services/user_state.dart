import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class UserState extends GetxController {
  Future<void> loginFunction(String email, String password) async {
    String url = '';
    try {
      http.Response response = await http.post(
        Uri.parse(url),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
        body: json.encode({
          'email': email,
          'password': password,
        }),
      );
      print(response.body);
    } catch (e) {
      print(e);
    }
  }
}
