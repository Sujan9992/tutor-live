import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));
List<User> usersFromJson(String str) =>
    List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

class User {
  User({
    this.id,
    this.fullName,
    this.email,
    this.avatar,
  });
  final int? id;
  final String? fullName;
  final String? email;
  final String? avatar;

  factory User.empty() => User(
        id: null,
        fullName: '',
        email: '',
        avatar: null,
      );

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['id'],
        fullName: json["full_name"],
        email: json["email"],
        avatar: json["avatar"],
      );
}
