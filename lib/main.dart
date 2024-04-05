import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:projnew/boxes.dart';
import 'package:projnew/screens/splash.dart'; // Added semicolon here

// Screens
import 'package:projnew/screens/addScreen.dart';
import 'package:projnew/screens/homeScreen.dart';
import 'package:projnew/services/sharedPrefs.dart';

import 'package:projnew/todo.dart';
import 'package:hive/hive.dart';

void main() async {
  // await SharedPreferencesMan().init();

  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  Hive.registerAdapter(TodoAdapter());
  await Hive.openBox<Todo>("myBox");

  // final boxes = Boxes.getBox();

  // SharedPreferencesMan.i.setAppFirstOpen(true);
  // debugPrint("${SharedPreferencesMan.i.getAppFirstOpen()}");
  //
  runApp(MaterialApp(initialRoute: "/", routes: {
    "/splash": (context) => SplashScreen(), // Added comma here
    "/": (context) => Home(), // Changed route name to "/"
    "/add": (context) => addScreen(), // Corrected capitalization of AddScreen
  }));
}
