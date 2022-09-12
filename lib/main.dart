import 'package:flutter/material.dart';
import 'package:flutter_application_7/screens/splashscreen.dart';

const SAVE_KEY_NAME = 'UserLoggedIn';
main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LOGIN PAGE',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ScreenSplash(),
    );
  }
}
