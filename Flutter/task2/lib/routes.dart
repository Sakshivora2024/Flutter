import 'package:flutter/material.dart';
import 'package:task2/main_screen.dart';

import 'main.dart';

class Routes {
  static Map<String, Widget Function(BuildContext)> routes = {
    "/": (context) => const MyHomePage(title: 'Gallery',),
    mainScreen: (context) =>  const MainScreen(),
  };

  static const String mainScreen = "/main";

}