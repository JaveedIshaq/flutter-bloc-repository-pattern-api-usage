// throw an Exception while looking for the Store Info Data

import 'package:blocwithapi/core/extensions.dart';
import 'package:blocwithapi/crews/data/crews_api_service.dart';
import 'package:blocwithapi/crews/data/spacex_crew_model.dart';

class RecipesRepositoryException implements Exception {}

class CrewRepository {
  CrewRepository({CrewsApiService? service})
      : _service = service ?? CrewsApiService();
  final CrewsApiService _service;

  Future<List<SpaceXCrew>> requestGetCrewsData() async {
    "requestGetCrewsData is called".log();
    try {
      return _service.getCrewsData();
    } on Exception {
      throw RecipesRepositoryException();
    }
  }
}
