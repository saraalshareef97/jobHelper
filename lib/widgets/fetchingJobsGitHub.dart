import 'package:flutter/material.dart';
import 'package:job_helper/api/gethubApi.dart';
import 'package:job_helper/models/jobModel.dart';
import 'package:job_helper/widgets/fetchingJobWidgets.dart';

class FetchingJobsGitHub extends StatefulWidget {
  @override
  FetchingJobsGitHubState createState() => FetchingJobsGitHubState();
}

class FetchingJobsGitHubState extends State<FetchingJobsGitHub> {
  Future<List<Job>> job;

  @override

  // Calling the data fetched from GitHub API Future
  // once the widget is initialized
  void initState() {
    super.initState();
    job = fetchJob();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 650,
      // Show data fetched from API on the UI using FutureBuilder
      child: FutureBuilder<List<Job>>(
        future: job,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var data = snapshot.data;
            return ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) {
                  return jobsDetailsContainer(
                      data[index].companyName,
                      data[index].companyLogo,
                      data[index].postDate,
                      data[index].linkToJob,
                      data[index].jobTitle,
                      data[index].location);
                });
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          // Return a circular progress indecator until all the data are finished fetching from the API
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
