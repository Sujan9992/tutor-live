class User {
  User({
    this.id,
    this.fullName,
    this.email,
  });
  final int? id;
  final String? fullName;
  final String? email;

  factory User.empty() => User(
        id: null,
        fullName: '',
        email: '',
      );

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['id'],
        fullName: json["full_name"],
        email: json["email"],
      );
}
