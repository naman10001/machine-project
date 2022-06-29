import 'package:flutter/material.dart';
import 'package:machine/Src/Constant/global.dart';
import 'package:machine/Src/View/auth/login_screen.dart';

import 'package:machine/Src/View/home/home_sacreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
    required this.preferences,
  }) : super(key: key);
  final SharedPreferences preferences;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Costing",
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: _handleScreen(),
    );
  }

  Widget _handleScreen() {
    prefObject = preferences;
    if (preferences.containsKey('id')) {
      return const HomeScreen();
    }
    return const LoginScreen();
  }
}
