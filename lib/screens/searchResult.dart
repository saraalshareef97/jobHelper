import 'package:flutter/material.dart';
import 'package:job_helper/screens/errorSearching.dart';
import 'package:job_helper/utils/contants.dart';
import 'package:job_helper/widgets/customClipper.dart';
import 'package:job_helper/widgets/fetchingJobsGitHub.dart';
import 'package:job_helper/widgets/fetchingJobsGov.dart';

// The results from the API will be shown in this page
class SearchResult extends StatelessWidget {
  final String value;

  SearchResult({Key key, @required this.value}) : super(key: key);

  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              // This widget is used to show a custom clipper on the top of the page
              ClipPath(
                clipper: MyCustomClipper(),
                child: Container(
                    color: primaryBlue,
                    height: 170,
                    padding: EdgeInsets.only(top: 80)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.keyboard_arrow_left),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Center(
                    child: Text(
                      'Search Results',
                      style: welcomeWidget,
                    ),
                  ),
                  SizedBox(width: 50),
                ],
              ),
            ],
          ),
          if (value == "zero")
            FetchingJobsGitHub()
          else if (value == "one")
            FetchingJobsGov()
          else
            ErrorPage()
        ],
      ),
    ));
  }
}
