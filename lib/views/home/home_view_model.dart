import 'package:food_court_weather_app/app/app.locator.dart';
import 'package:food_court_weather_app/core/model/city/city.dart';
import 'package:food_court_weather_app/core/services/local_storage_service.dart';
import 'package:food_court_weather_app/core/services/server_service.dart';
import 'package:stacked/stacked.dart';

import '../../app/app.logger.dart';
import '../../utils/string_helper.dart';

class HomeViewModel extends BaseViewModel {
  final log = getLogger("HomeViewModel");
  final _server = locator<ServerService>();
  final _storage = locator<SharedPreferencesService>();

  String temperature = "0";
  String description = "";

  List<String> _cityResponse = [];
  List<String> get cityResponse => _cityResponse;

  List<CityResponse> _city = [];
  List<CityResponse> get city => _city;

  List<String> selectedCities = [];

  void initiate(List<String> cities) {
    selectedCities = cities;
    log.v(selectedCities);
    notifyListeners();
  }

  Future<void> getWeather({required String lat, required String lon}) async {
    setBusy(true);
    final response = await _server.getWether(lat: lat, lon: lon);
    temperature = removeDecimal("${response?.main?.temp}");

    setBusy(false);
  }

  void persistCities(List<String> c) {
    _storage.saveData("localStorage", c);
  }

  void selectCity(String cityName, context) async {
    List cities = await _server.getCityName(context);
    cities.map((e) => null);
    for (var city in cities) {
      if (cityName == city.city) {
        await getWeather(lat: city.lat, lon: city.lng);
      }
    }
  }

  void changeCity(List<String>? results) {
    if (results != null && results.length <= 3) {
      selectedCities = results;
      _storage.saveData("localstorage",results);
      notifyListeners();
    }
  }

  Future<void> getCities(context) async {
    setBusy(true);
    final response = await _server.getCityName(context);
    _cityResponse = response.map((e) => e.city).toList();
    _city = response;
    log.v(_city);
    setBusy(false);
  }
}
