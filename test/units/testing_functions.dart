import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;

void main() {
  group('Fetching', () {
    test('Data can fetch from GitHub Api', () async {
      http.Response response = await http.get(
          'https://jobs.github.com/positions.json?description=ruby&page=1/');

      expect(response.statusCode, 200);
    });
    test("Data can fetch from JobsGov Api", () async {
      http.Response response2 = await http
          .get('https://data.usajobs.gov/api/search', headers: {
        "Authorization-Key": "WrrcxLDHnBnfrAAX5PvB521GVbRSxNPsvI7/P+eHVk8="
      });

      expect(response2.statusCode, 200);
    });
  });
}
