import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:job_helper/models/jobModel.dart';

// Calling API Provider to fetch data from it
Future<List<Job>> fetchJob() async {
  http.Response response = await http
      .get('https://jobs.github.com/positions.json?description=ruby&page=1/');

  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON
    List responseJson = json.decode(response.body);
    print(responseJson);
    return responseJson.map<Job>((m) => new Job.fromJson(m)).toList();
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load post');
  }
}
