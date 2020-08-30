import 'package:flutter/material.dart';
import 'package:job_helper/api/searchGovApi.dart';
import 'package:job_helper/widgets/fetchingJobWidgets.dart';

class FetchingJobsGov extends StatefulWidget {
  @override
  FetchingJobsGovState createState() => FetchingJobsGovState();
}

class FetchingJobsGovState extends State<FetchingJobsGov> {
  Future<List<dynamic>> job;

  @override
  // Calling the data fetched from GitHub API Future
  // once the widget is initialized
  void initState() {
    super.initState();
    job = fetchJobGov();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 650,
      // Show data fetched from API on the UI using FutureBuilder
      child: FutureBuilder<List>(
        future: job,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var data = snapshot.data;
            return ListView.builder(
                itemCount: data.length,
                padding: EdgeInsets.zero,
                itemBuilder: (BuildContext context, int index) {
                  var dataValue = data[index]["MatchedObjectDescriptor"];
                  return jobsDetailsContainer(
                      dataValue["OrganizationName"],
                      "",
                      dataValue["PositionStartDate"],
                      dataValue["PositionURI"],
                      dataValue["PositionTitle"],
                      dataValue["PositionLocationDisplay"]);
                });
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          // Return a circular progress indecator until all the data is finished fetching from the API
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
