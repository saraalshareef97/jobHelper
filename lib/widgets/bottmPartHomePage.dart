import 'package:flutter/material.dart';

class BottomWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Image.asset(
        "images/jobSearch.png",
        fit: BoxFit.fill,
      ),
    );
  }
}
