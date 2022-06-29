import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:machine/Src/my_app.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await SharedPreferences.getInstance().then((pref) {
    runApp(MyApp(
      preferences: pref,
    ));
  });
}
