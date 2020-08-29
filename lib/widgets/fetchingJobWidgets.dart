import 'package:flutter/material.dart';

import 'package:job_helper/utils/contants.dart';
import 'package:url_launcher/url_launcher.dart';

// The main Container widget for job's information
// which is used in search results page for both
// GitHub and USAJobs APIS
Container jobsDetailsContainer(String companyName, String companyLogo,
        String postDate, String linktoJob, String jobTitle, String location) =>
    Container(
        padding: EdgeInsets.all(25),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          ListTile(
            title: Text(companyName + " Company", style: secondTextStyle),
            subtitle: Text(
              'In ' + location,
            ),
            leading: Container(
                height: 100,
                width: 100,
                child: (companyLogo).isEmpty
                    ? Image.asset('images/search.png')
                    : Image.network(companyLogo, fit: BoxFit.contain)),
          ),
          Text(jobTitle, style: jobDetailsTextStyle),
          SizedBox(height: 5),
          Text(
            'Post Date: ' + postDate,
          ),
          SizedBox(height: 5),
          InkWell(
            child: Text(
              "Preview Job Details",
              style: previewJobDetails,
            ),
            // this "can Launch" funciton help us to open a hyperlink text
            // and open the link on web browser.
            onTap: () async {
              if (await canLaunch(linktoJob)) {
                await launch(linktoJob);
              }
            },
          ),
          SizedBox(height: 20),
          Divider(),
        ]));
