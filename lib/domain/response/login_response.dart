import 'dart:convert';
import '../../modules/auth/model/user.dart';

LoginResponse loginResponseFromJson(String str) =>
    LoginResponse.fromJson(json.decode(str));

class LoginResponse {
  const LoginResponse({this.token, this.user});
  final String? token;
  final User? user;
  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        user: User.fromJson(json["user"]),
        token: json["token"],
      );
}
