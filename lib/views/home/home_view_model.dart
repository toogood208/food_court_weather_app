import 'package:food_court_weather_app/app/app.locator.dart';
import 'package:food_court_weather_app/core/model/city/city.dart';
import 'package:food_court_weather_app/core/services/server_service.dart';
import 'package:stacked/stacked.dart';

import '../../app/app.logger.dart';
import '../../utils/string_helper.dart';

class HomeViewModel extends BaseViewModel {
  final log = getLogger("HomeViewModel");
  final _server = locator<ServerService>();

  String temperature = "0";
  String description = "";

  List<String> _cityResponse = [];
  List<String> get cityResponse => _cityResponse;

  List<CityResponse> _city = [];
  List<CityResponse> get city => _city;

  List<String> selectedCities = ["Lagos"];

  Future<void> getWeather({required String lat, required String lon}) async {
    setBusy(true);
    final response = await _server.getWether(lat: lat, lon: lon);
    temperature = removeDecimal("${response?.main?.temp ?? "0"}");
    description = response!.weather![0].description!;
    setBusy(false);
  }

  void selectCity(String cityName) {
    for (var city in _city) {
      if (city.city == cityName) {
        getWeather(lat: city.lat, lon: city.lng);
      }
    }
  }

  void changeCity(List<String>? results) {
    if (results != null && results.length <= 3) {
      selectedCities = results;
      notifyListeners();
    }
  }

  Future<void> getCities(context) async {
    setBusy(true);
    final response = await _server.getCityName(context);
    _cityResponse = response.map((e) => e.city).toList();
    _city = response;
    setBusy(false);
    notifyListeners();
  }
}
