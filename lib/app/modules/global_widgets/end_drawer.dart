import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class EndDrawer extends StatefulWidget {
  const EndDrawer({Key? key}) : super(key: key);

  @override
  State<EndDrawer> createState() => _EndDrawerState();
}

class _EndDrawerState extends State<EndDrawer> {
  bool tutorMode = false;

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
    return Scaffold(
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.red.shade200,
            ),
            child: Center(
              child: Text(
                'Profile',
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
              value: tutorMode,
              onChanged: (bool value) {
                setState(
                  () {
                    tutorMode = value;
                  },
                );
              },
              title: const Text('Tutor Mode'),
              secondary: const Icon(Icons.person_outline),
            ),
          ),
          buildCard(
            Icons.language_outlined,
            'Language',
            Icons.arrow_forward_ios_rounded,
            () {},
          ),
          buildCard(
            Icons.support_outlined,
            'Support',
            Icons.arrow_forward_ios_rounded,
            () {},
          ),
          buildCard(
            Icons.info_outline,
            'About',
            Icons.arrow_forward_ios_rounded,
            () {},
          ),
          buildCard(
            Icons.info_outline,
            'About',
            Icons.arrow_forward_ios_rounded,
            () {},
          ),
          buildCard(
            Icons.info_outline,
            'About',
            Icons.arrow_forward_ios_rounded,
            () {},
          ),
          buildCard(
            Icons.info_outline,
            'About',
            Icons.arrow_forward_ios_rounded,
            () {},
          ),
          buildCard(
            Icons.info_outline,
            'About',
            Icons.arrow_forward_ios_rounded,
            () {},
          ),
          buildCard(
            Icons.info_outline,
            'About',
            Icons.arrow_forward_ios_rounded,
            () {},
          ),
          buildCard(
            Icons.info_outline,
            'About',
            Icons.arrow_forward_ios_rounded,
            () {},
          ),
        ],
      ),
      persistentFooterButtons: [
        Card(
          child: ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {},
          ),
        ),
      ],
    );
  }
}
