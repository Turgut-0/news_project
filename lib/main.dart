import 'package:flutter/material.dart';

import 'View_scareen/main_scareeN.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News Version 1.0',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: main_ScreeN(),
    );
  }
}
