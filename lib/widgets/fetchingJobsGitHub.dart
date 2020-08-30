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
  List<Job> _listOfJobs = List<Job>();
  List<Job> _jobsForDisplay = List<Job>();
  @override

  // Calling the data fetched from GitHub API Future
  // once the widget is initialized
  void initState() {
    fetchJob().then((value) {
      setState(() {
        job = fetchJob();
        _listOfJobs.addAll(value);
        _jobsForDisplay = _listOfJobs;
      });
    });
    super.initState();
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
            return ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: _jobsForDisplay.length + 1,
                itemBuilder: (BuildContext context, int index) {
                  return index == 0
                      ? _searchBar()
                      : jobsDetailsContainer(
                          _jobsForDisplay[index - 1].companyName,
                          _jobsForDisplay[index - 1].companyLogo,
                          _jobsForDisplay[index - 1].postDate,
                          _jobsForDisplay[index - 1].linkToJob,
                          _jobsForDisplay[index - 1].jobTitle,
                          _jobsForDisplay[index - 1].location);
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

// This function is for filtering the jobs by location or position
  _searchBar() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
            hintText: 'Filter jobs by typing position or location..'),
        onChanged: (text) {
          text = text.toLowerCase();
          setState(() {
            _jobsForDisplay = _listOfJobs.where((position) {
              var jobPosition = position.jobTitle.toLowerCase();
              var jobPosition2 = position.location.toLowerCase();
              return jobPosition.contains(text) | jobPosition2.contains(text);
            }).toList();
          });
        },
      ),
    );
  }
}
