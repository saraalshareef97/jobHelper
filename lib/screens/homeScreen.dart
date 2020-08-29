import 'package:flutter/material.dart';
import 'package:job_helper/widgets/homePageTopPart.dart';
import 'package:job_helper/widgets/bottmPartHomePage.dart';

//The Home screen of the Application
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: <Widget>[
            FirstPartHomeScreen(
              valueSelected: "",
            ),
            BottomWidget()
          ],
        ),
      ),
    );
  }
}
