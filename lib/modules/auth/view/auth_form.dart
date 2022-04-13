import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/global_widgets/textfield.dart';
import '../controller/auth_controller.dart';

class AuthForm extends StatelessWidget {
  AuthForm({
    Key? key,
    this.fullname,
    this.email,
    this.password,
    this.confirmPassword,
    this.authType,
  }) : super(key: key);

  void create() async {
    Get.snackbar('Error', 'Invalid details!');
  }

  final TextEditingController? fullname;
  final TextEditingController? email;
  final TextEditingController? password;
  final TextEditingController? confirmPassword;
  final VoidCallback? authType;

  final _formKey = GlobalKey<FormState>();
  final bool remember = false;
  final controller = Get.find<AuthController>();

  Widget authFormType() {
    final buttonText = controller.isLoggedIn.value ? 'Register' : 'Log in';
    final secondary =
        controller.isLoggedIn.value ? 'Already a user?' : 'First time here? ';

    final signInOrRegister =
        controller.isLoggedIn.value ? 'Log in' : 'Register';

    return Form(
      key: _formKey,
      child: Padding(
        padding: EdgeInsets.only(
          left: Get.width * 0.05,
          right: Get.width * 0.05,
          top: Get.height * 0.02,
        ),
        child: Column(
          children: [
            SizedBox(
              height: Get.height * 0.2,
              child: Image.asset('assets/images/logo.png'),
            ),
            if (controller.isLoggedIn.value)
              CustomTextField(
                obscureText: false,
                validator: (value) =>
                    value!.isEmpty ? 'Please enter your full name' : null,
                controller: fullname!,
                hintText: 'Full name',
                icon: Icons.person,
              ),
            const SizedBox(height: 12),
            CustomTextField(
              obscureText: false,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your email';
                }
                if (!value.contains('@')) {
                  return 'A valid email is required';
                } else {
                  return null;
                }
              },
              controller: email!,
              hintText: 'Email',
              icon: Icons.email_outlined,
            ),
            const SizedBox(height: 12),
            CustomTextField(
              obscureText: true,
              validator: ((value) =>
                  value!.isEmpty ? 'Please enter your password' : null),
              controller: password!,
              hintText: 'Password',
              icon: Icons.password_outlined,
            ),
            const SizedBox(height: 12),
            if (controller.isLoggedIn.value)
              CustomTextField(
                obscureText: true,
                validator: ((value) {
                  if (value!.isEmpty) {
                    return 'Please confirm your password';
                  } else if (value != password!.text) {
                    return 'Passwords do not match';
                  } else {
                    return null;
                  }
                }),
                controller: confirmPassword!,
                hintText: 'Confirm password',
                icon: Icons.password_outlined,
              ),
            const SizedBox(height: 12),
            TextButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  authType!();
                } else {
                  create();
                }
              },
              child: Text(
                buttonText,
                style:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.w300),
              ),
              style: ButtonStyle(
                overlayColor: MaterialStateProperty.all(Colors.transparent),
              ),
            ),
            const SizedBox(height: 12),
            Obx(
              () {
                if (controller.isLoading.value) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return const SizedBox.shrink();
                }
              },
            ),
            const SizedBox(height: 12),
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
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(secondary),
                TextButton(
                  onPressed: () {
                    controller.toggleFormType();
                  },
                  child: Text(
                    signInOrRegister,
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.w200),
                  ),
                  style: ButtonStyle(
                    visualDensity: VisualDensity.compact,
                    padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
                    overlayColor: MaterialStateProperty.all(Colors.transparent),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => authFormType());
  }
}
