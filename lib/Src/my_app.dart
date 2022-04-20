import 'package:flutter/material.dart';

import 'package:machine/Src/View/List/ListScreen.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Costing",
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const ListScreen(),
    );
  }
}
