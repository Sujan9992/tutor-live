import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app/bindings/main_binding.dart';
import 'routes/pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  var boolValue = prefs.getBool('isFirst');
  boolValue ??= true;
  // reset the system's orientation to portrait
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MyApp(
      toLoad: boolValue,
    ));
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, this.toLoad}) : super(key: key);

  final bool? toLoad;
  @override
  Widget build(BuildContext context) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Tutor Live',
        theme: ThemeData(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          hoverColor: Colors.transparent,
          fontFamily: GoogleFonts.poppins().fontFamily,
          colorScheme: ColorScheme.fromSwatch(
                  primarySwatch: Colors.red, brightness: Brightness.light)
              .copyWith(secondary: Colors.red.shade400),
          iconTheme: const IconThemeData(color: Colors.black),
        ),
        getPages: AppPages.pages,
        initialRoute: (toLoad!) ? Routes.onboard : Routes.splash,
        initialBinding: MainBinding(),
      );
}
