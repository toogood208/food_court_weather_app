import 'dart:async';

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../app/app.locator.dart';
import '../../app/app.logger.dart';
import '../../app/app.router.dart';
import '../../core/services/location_service.dart';

class CurrentLocationViewModel extends BaseViewModel {
  final _navigation = locator<NavigationService>();
  final _location = locator<LocationService>();
  final _logger = getLogger("SplashScreenViewModel");

  String? latitude;
  String? longitude;

  Future<void> getCurrentLocation() async {
    final position = await _location.getGeoLocationPosition();
    latitude = "${position.latitude}";
    longitude = "${position.longitude}";
    notifyListeners();
    _logger.v("Latitude:$latitude, Longitude:$longitude");
  }

}

