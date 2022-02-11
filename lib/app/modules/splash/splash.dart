import 'package:flutter/material.dart';

class SplashPageScreen extends StatelessWidget {
  const SplashPageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: Hero(
                  tag: "logo",
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        child: Image.asset("assets/images/logo.png"),
                        width: 250,
                        height: 250,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
