import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'my_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // instantiating shared preferences object
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  var boolValue = prefs.getBool('isFirst');
  boolValue ??= true;
  // reset the system's orientation to portrait
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) => runApp(MyApp(toLoad: boolValue)));
}
