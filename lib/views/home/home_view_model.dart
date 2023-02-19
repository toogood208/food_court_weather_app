
import 'package:food_court_weather_app/app/app.locator.dart';
import 'package:food_court_weather_app/core/services/server_service.dart';
import 'package:stacked/stacked.dart';

import '../../app/app.logger.dart';
import '../../utils/string_helper.dart';

class HomeViewModel extends BaseViewModel {
  final log = getLogger("WeatherViewModel");
  final _server = locator<ServerService>();
  String temperature = "";
  String weatherIcon = "";
  String description = "";


  Future<void> getWeather({required String lat, required String lon}) async{
    setBusy(true);
    final response = await _server.getWether(lat: lat, lon: lon);
    temperature = removeDecimal("${response?.main?.temp ?? ""}");
    description = response?.weather![0].description ?? "";
    weatherIcon =
    "http://openweathermap.org/img/w/${response!.weather![0].icon}.png";
    setBusy(false);
  }
}