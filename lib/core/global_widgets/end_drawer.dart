import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../modules/auth/controller/auth_controller.dart';

class EndDrawer extends StatefulWidget {
  const EndDrawer({Key? key}) : super(key: key);

  @override
  State<EndDrawer> createState() => _EndDrawerState();
}

class _EndDrawerState extends State<EndDrawer> {
  final controller = Get.find<AuthController>();
  int id = 0;
  String name = 'User';
  String email = '';
  String image = '';

  Widget buildCard(IconData leading, String text, Function() onTap) {
    return ListTile(
      onTap: onTap,
      autofocus: true,
      leading: Icon(leading),
      title: Text(text),
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
              child: FutureBuilder(
                future: controller.getProfile(),
                builder:
                    (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  if (snapshot.hasData) {
                    id = snapshot.data.id;
                    name = snapshot.data.fullName;
                    email = snapshot.data.email;
                    image = snapshot.data.avatar;
                    return Text(
                      snapshot.data.fullName ?? 'Null',
                      style: TextStyle(
                        fontFamily: GoogleFonts.suezOne().fontFamily,
                        color: Colors.red,
                        fontSize: Get.height * 0.05,
                      ),
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
          ),
          buildCard(
            Icons.person,
            'View Profile',
            () {
              Get.back();
              Get.toNamed('/userProfile', arguments: [
                id,
                name,
                email,
                image,
              ]);
            },
          ),
          buildCard(
            Icons.settings,
            'Manage Course',
            () {
              Get.back();
              Get.toNamed('/manageCourse', arguments: [
                id,
                name,
              ]);
            },
          ),
          buildCard(
            Icons.support_outlined,
            'Support',
            () {},
          ),
          buildCard(
            Icons.info_outline,
            'About',
            () {},
          ),
        ],
      ),
      persistentFooterButtons: [
        Card(
          child: ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () {
              controller.logout();
              Get.offAllNamed('/auth');
            },
          ),
        ),
      ],
    );
  }
}
