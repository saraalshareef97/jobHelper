import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:job_helper/screens/homeScreen.dart';
import 'package:job_helper/utils/contants.dart';

// The first page will shown when the application is opened
class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    // Set the time for the appearing of the splash page
    // and when time's out, it will navigate to the home page dynamically
    Timer(
        Duration(seconds: 7),
        () => Navigator.of(context).pushReplacement(
            CupertinoPageRoute(builder: (BuildContext context) => Home())));
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Image.asset('images/search.png'), splashText(context)],
      ),
    );
  }

  Row splashText(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Find the",
            style: maintTextStyle,
          ),
          RotateAnimatedTextKit(
            text: [" Best", " Optimum", " Suitable"],
            textStyle: maintTextStyle,
          ),
          Text(
            " Job",
            style: maintTextStyle,
          ),
        ],
      );
}
