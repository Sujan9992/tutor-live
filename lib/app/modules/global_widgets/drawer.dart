import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class DrawerMenu extends StatefulWidget {
  const DrawerMenu({Key? key}) : super(key: key);

  @override
  State<DrawerMenu> createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  bool tutor_mode = false;

  Widget buildCard(
      IconData leading, String text, IconData trailing, Function onTap) {
    return Card(
      child: ListTile(
        autofocus: true,
        leading: Icon(leading),
        title: Text(text),
        trailing: Icon(trailing),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.red.shade200,
          ),
          child: Center(
            child: Text(
              'Settings',
              style: TextStyle(
                fontFamily: GoogleFonts.suezOne().fontFamily,
                color: Colors.red,
                fontSize: Get.height * 0.05,
              ),
            ),
          ),
        ),
        Card(
          child: SwitchListTile(
            activeColor: Colors.red,
            value: tutor_mode,
            onChanged: (bool value) {
              setState(() {
                tutor_mode = value;
              });
            },
            title: const Text('Tutor Mode'),
            secondary: const Icon(Icons.person_outline),
          ),
        ),
        buildCard(Icons.language_outlined, 'Language',
            Icons.arrow_forward_ios_rounded, () {}),
        buildCard(Icons.settings_outlined, 'Settings',
            Icons.arrow_forward_ios_rounded, () {}),
        buildCard(Icons.support_outlined, 'Support',
            Icons.arrow_forward_ios_rounded, () {}),
        buildCard(Icons.info_outline, 'About', Icons.arrow_forward_ios_rounded,
            () {}),
        buildCard(Icons.logout_outlined, 'Logout',
            Icons.arrow_forward_ios_rounded, () {}),
      ],
    );
  }
}
