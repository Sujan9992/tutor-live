class RegisterRequest {
  const RegisterRequest(
    this.fullName,
    this.email,
    this.password,
  );
  final String? fullName;
  final String? email;
  final String? password;
}
