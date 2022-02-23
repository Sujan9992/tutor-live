import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tutor_live/routes/pages.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final _loginFormKey = GlobalKey<FormState>();

  void _login() {
    var _isValid = _loginFormKey.currentState!.validate();
    if (_isValid) {
      Get.offAllNamed(Routes.home);
    } else {
      return;
    }
    _loginFormKey.currentState!.save();
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                child: Image.asset("assets/lottie/4.gif"),
              ),
              Form(
                  key: _loginFormKey,
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: Get.width * 0.05,
                      right: Get.width * 0.05,
                      top: Get.height * 0.02,
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: Get.height * 0.08,
                          child: TextFormField(
                            validator: (value) =>
                                value!.isEmpty ? 'Email is required' : null,
                            controller: _emailController,
                            decoration: InputDecoration(
                              hintText: "Email",
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
                        const SizedBox(height: 15),
                        SizedBox(
                          height: Get.height * 0.08,
                          child: TextFormField(
                            validator: (value) =>
                                value!.isEmpty ? 'Password is required' : null,
                            controller: _passwordController,
                            obscureText: true,
                            decoration: InputDecoration(
                              hintText: "Password",
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
                      ],
                    ),
                  )),
              const SizedBox(height: 15),
              TextButton(
                onPressed: _login,
                child: const Text(
                  'Login',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w300),
                ),
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                ),
              ),
              const SizedBox(height: 15),
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
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('First time here? '),
                  TextButton(
                    onPressed: () => Get.offAllNamed(Routes.signup),
                    child: const Text(
                      'Sign up',
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
