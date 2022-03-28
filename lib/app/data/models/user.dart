class User {
  User({
    required this.fullName,
    this.email,
  });
  final String? fullName;
  final String? email;

  factory User.empty() => User(
        fullName: '',
        email: '',
      );

  factory User.fromJson(Map<String, dynamic> json) => User(
        fullName: json["fullName"],
        email: json["email"],
      );
}
