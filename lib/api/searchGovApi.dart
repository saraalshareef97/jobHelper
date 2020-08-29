import 'dart:io';
import 'dart:convert';

import 'package:http/http.dart' as http;

// Calling API Provider to fetch data from it
Future<List> fetchJobGov() async {
  http.Response response = await http.get('https://data.usajobs.gov/api/search',
      headers: {
        "Authorization-Key": "WrrcxLDHnBnfrAAX5PvB521GVbRSxNPsvI7/P+eHVk8="
      });
  // If the call to the server was successful, parse the JSON
  if (response.statusCode == 200) {
    Map<String, dynamic> responseJson = json.decode(response.body);
    List s = responseJson["SearchResult"]["SearchResultItems"];
    return s;
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load post');
  }
}
