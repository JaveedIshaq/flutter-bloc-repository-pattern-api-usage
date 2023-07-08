import 'dart:convert';
import 'package:blocwithapi/core/api_constants.dart';
import 'package:blocwithapi/core/extensions.dart';
import 'package:blocwithapi/crews/data/spacex_crew_model.dart';
import 'package:http/http.dart' as http;

class CrewsApiService {
  final http.Client _httpClient;

  CrewsApiService({http.Client? httpClient})
      : _httpClient = httpClient ?? http.Client();

  Future<List<SpaceXCrew>> getCrewsData() async {
    try {
      final response = await _httpClient.get(
        Uri.parse(crewsApi),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final responseBody = json.decode(response.body);

        "responseBody: $responseBody".log();

        final crewsList =
            (responseBody as List).map((i) => SpaceXCrew.fromJson(i)).toList();

        return crewsList;
      } else {
        throw Exception(['Error Fetching Data']);
      }
    } catch (exception) {
      throw Exception(['$exception']);
    }
  }
}
