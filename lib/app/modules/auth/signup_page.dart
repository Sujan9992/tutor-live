import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../routes/pages.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController _fullnameController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _confirmPasswordController =
      TextEditingController();

  late String _password;
  final _registrationFormKey = GlobalKey<FormState>();

  void _register() {
    var _isValid = _registrationFormKey.currentState!.validate();
    if (_isValid) {
      Get.offAllNamed(Routes.home);
    } else {
      return;
    }
    _registrationFormKey.currentState!.save();
  }

  @override
  void dispose() {
    super.dispose();
    _fullnameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: Get.height * 0.4,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/lottie/5.gif"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Form(
                  key: _registrationFormKey,
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: Get.width * 0.05,
                      right: Get.width * 0.05,
                      top: Get.height * 0.02,
                    ),
                    child: Column(
                      children: [
                        const SizedBox(height: 12),
                        SizedBox(
                          height: Get.height * 0.08,
                          child: TextFormField(
                            validator: (value) => value!.isEmpty
                                ? 'Please enter your full name'
                                : null,
                            controller: _fullnameController,
                            decoration: InputDecoration(
                              hintText: 'Full Name',
                              hintStyle: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                  color: Colors.red,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              suffixIcon:
                                  const Icon(Icons.person, color: Colors.red),
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.red.shade100),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.red.shade100),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        SizedBox(
                          height: Get.height * 0.08,
                          child: TextFormField(
                            validator: (value) => value!.isEmpty
                                ? 'Please enter your email'
                                : null,
                            controller: _emailController,
                            decoration: InputDecoration(
                              hintText: 'Email',
                              hintStyle: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                  color: Colors.red,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              suffixIcon: const Icon(Icons.email_outlined,
                                  color: Colors.red),
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.red.shade100),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.red.shade100),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        SizedBox(
                          height: Get.height * 0.08,
                          child: TextFormField(
                            validator: ((value) => value!.isEmpty
                                ? 'Please enter your password'
                                : null),
                            controller: _passwordController,
                            obscureText: true,
                            decoration: InputDecoration(
                              hintText: 'Password',
                              hintStyle: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                  color: Colors.red,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              suffixIcon: const Icon(Icons.password_outlined,
                                  color: Colors.red),
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.red.shade100),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.red.shade100),
                              ),
                            ),
                            onChanged: (value) {
                              setState(() {
                                _password = value;
                              });
                              _password = value;
                            },
                          ),
                        ),
                        const SizedBox(height: 12),
                        SizedBox(
                          height: Get.height * 0.08,
                          child: TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please confirm your password';
                              } else if (value != _password) {
                                return 'Passwords do not match';
                              }
                              return null;
                            },
                            obscureText: true,
                            controller: _confirmPasswordController,
                            decoration: InputDecoration(
                              hintText: 'Re-type Password',
                              hintStyle: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                  color: Colors.red,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              suffixIcon: const Icon(Icons.password_outlined,
                                  color: Colors.red),
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.red.shade100),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.red.shade100),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                      ],
                    ),
                  )),
              TextButton(
                onPressed: _register,
                child: const Text(
                  'Signup',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w300),
                ),
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                ),
              ),
              const SizedBox(height: 8),
              SizedBox(
                width: Get.width * 0.55,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Divider(
                        color: Colors.red.shade100,
                        thickness: 1,
                      ),
                    ),
                    const Text('  or  '),
                    Expanded(
                      child: Divider(
                        color: Colors.red.shade100,
                        thickness: 1,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('Already a user? '),
                  TextButton(
                    onPressed: () => Get.offAllNamed(Routes.login),
                    child: const Text(
                      'Login',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w200),
                    ),
                    style: ButtonStyle(
                      visualDensity: VisualDensity.compact,
                      padding: MaterialStateProperty.all(
                        const EdgeInsets.all(0),
                      ),
                      overlayColor:
                          MaterialStateProperty.all(Colors.transparent),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
