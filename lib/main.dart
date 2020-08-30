import 'package:flutter/material.dart';
import 'package:job_helper/screens/splashScreen.dart';
import 'package:job_helper/utils/contants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: primaryBlue,
        body: SplashPage(),
      ),
    );
  }
}
