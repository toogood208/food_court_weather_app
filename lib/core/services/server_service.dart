import 'package:flutter/material.dart';
import 'package:food_court_weather_app/core/services/network_services/api_service.dart';
import 'package:food_court_weather_app/core/services/network_services/network_constant.dart';

import '../../app/app.locator.dart';
import '../../app/app.logger.dart';
import '../model/weather/weather.dart';
import '../model/city/city.dart';
import 'network_services/network_services.dart';

class ServerService {
  final _log = getLogger("ServerService");
  final _apiService = locator<APIService>();
  final _network = locator<NetworkService>();

  Future<DataResponse?> getWether(
      {required String lat, required String lon}) async {
    final response = await _network.fmt(() {
      return _apiService.get(route: currentRoute, query: {
        'lat': lat,
        'lon': lon,
        "units": "metric",
        "appid": "57890fca5990380d37c02afd38bbdf4a"
      });
    });
    return response.fold((l) => null, (r) {
      final dataResponse = DataResponse.fromJson(r);
      _log.v(dataResponse);
      return dataResponse;
    });
  }

  Future<DataResponse?> getCityNameFromOpenWeather(
      {required String lat, required String lon}) async {
    final response = await _network.fmt(() {
      return _apiService.get(route: geolocationRoute, query: {
        'lat': lat,
        'lon': lon,
        "limit": "1",
        "appid": "57890fca5990380d37c02afd38bbdf4a"
      });
    });
    return response.fold((l) => null, (r) {
      final dataResponse = DataResponse.fromJson(r);
      _log.v(dataResponse);
      return dataResponse;
    });
  }

  Future<List<CityResponse>> getCityName(context) async {
    var response = await DefaultAssetBundle.of(context)
        .loadString("assets/data/cities.json");
    _log.v(response.toString());

    return cityResponseFromJson(response);
  }
}
