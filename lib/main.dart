import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:job_helper/screens/splashScreen.dart';
import 'package:job_helper/utils/contants.dart';
import 'package:device_preview/device_preview.dart';

void main() {
  debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
  runApp(DevicePreview(enabled: false, builder: (context) => MyApp()));
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
