import 'package:food_court_weather_app/app/app.locator.dart';
import 'package:geolocator/geolocator.dart';
import 'package:stacked_services/stacked_services.dart';

class LocationService {
 final _snackbar  = locator<SnackbarService>();
  Future<Position> getGeoLocationPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      _snackbar.showSnackbar(message: "Location Services are Dissabled");
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        _snackbar.showSnackbar(message: "Location permissions are denied");
      }
    }

    if (permission == LocationPermission.deniedForever) {
      _snackbar.showSnackbar(message: "Location permissions are permanently denied, we cannot request permissions.");
    }

    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }


}
