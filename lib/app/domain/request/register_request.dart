class RegisterRequest {
  const RegisterRequest({
    this.fullName,
    this.email,
    this.password,
    this.confirmPassword,
  });
  final String? fullName;
  final String? email;
  final String? password;
  final String? confirmPassword;
}
