import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class DrawerMenu extends StatefulWidget {
  const DrawerMenu({Key? key}) : super(key: key);

  @override
  State<DrawerMenu> createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  bool tutorMode = false;

  Widget buildCard(
    String text,
    IconData trailing,
    Function() onTap,
  ) {
    return Card(
      child: ListTile(
        autofocus: true,
        title: Text(text),
        trailing: Icon(trailing),
        onTap: onTap,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.red.shade200),
            child: Center(
              child: Text(
                'Courses',
                style: TextStyle(
                  fontFamily: GoogleFonts.suezOne().fontFamily,
                  color: Colors.red,
                  fontSize: Get.height * 0.05,
                ),
              ),
            ),
          ),
          buildCard(
            'Language',
            Icons.arrow_forward_ios_rounded,
            () {},
          ),
          buildCard(
            'Settings',
            Icons.arrow_forward_ios_rounded,
            () {},
          ),
          buildCard(
            'Support',
            Icons.arrow_forward_ios_rounded,
            () {},
          ),
          buildCard(
            'About',
            Icons.arrow_forward_ios_rounded,
            () {},
          ),
          buildCard(
            'Settings',
            Icons.arrow_forward_ios_rounded,
            () {},
          ),
          buildCard(
            'Support',
            Icons.arrow_forward_ios_rounded,
            () {},
          ),
          buildCard(
            'About',
            Icons.arrow_forward_ios_rounded,
            () {},
          ),
          buildCard(
            'Settings',
            Icons.arrow_forward_ios_rounded,
            () {},
          ),
          buildCard(
            'Support',
            Icons.arrow_forward_ios_rounded,
            () {},
          ),
          buildCard(
            'About',
            Icons.arrow_forward_ios_rounded,
            () {},
          ),
        ],
      ),
      persistentFooterButtons: [
        Card(
          child: ListTile(
            leading: const Icon(Icons.add),
            title: const Text('Create Course'),
            onTap: () {},
          ),
        ),
      ],
    );
  }
}
