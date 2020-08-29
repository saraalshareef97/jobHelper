import 'package:flutter/material.dart';
import 'package:job_helper/utils/contants.dart';
import 'package:job_helper/widgets/bottmPartHomePage.dart';
import 'package:job_helper/widgets/customClipper.dart';

// This page will be shown if the user clicks on "See Results" Button
// Without choosing a provider from the dropDown Menu
class ErrorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              ClipPath(
                clipper: MyCustomClipper(),
                child: Container(
                    color: primaryBlue,
                    height: MediaQuery.of(context).size.height / 2,
                    padding: EdgeInsets.only(top: 80)),
              ),
              Center(
                child: Text(
                  'OOPS! You should choose one Provider..',
                  textAlign: TextAlign.center,
                  style: welcomeWidget,
                ),
              ),
              SizedBox(width: 50),
            ],
          ),
          BottomWidget(),
          SizedBox(height: 100),
          FlatButton(
            child: Row(
              children: [
                Icon(
                  Icons.keyboard_arrow_left,
                  color: primaryBlue,
                ),
                Text(
                  "Back",
                  style: (secondTextStyle),
                ),
              ],
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    ));
  }
}
