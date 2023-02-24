import 'dart:async';

import 'package:food_court_weather_app/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../app/app.locator.dart';
import '../../app/app.logger.dart';
import '../../core/services/location_service.dart';

class CurrentLocationViewModel extends BaseViewModel {
  final _location = locator<LocationService>();
  final _navigation = locator<NavigationService>();
  final _logger = getLogger("SplashScreenViewModel");

  List<String> cities = [];

  Future<void> getCurrentLocation() async {
    setBusy(true);
    final position = await _location.getCityName();
    final c = position;
    setBusy(false);
    cities.add(c);
    navigateToHome(cities);

    _logger.v(cities);
  }

  void navigateToHome(List<String> c) {
    _navigation.pushNamedAndRemoveUntil(Routes.homeView,
        arguments: HomeViewArguments(cities: c));
  }
}
