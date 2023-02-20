import 'dart:async';

import 'package:food_court_weather_app/core/services/local_storage_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../app/app.locator.dart';
import '../../app/app.router.dart';

class SplashScreenViewModel extends BaseViewModel {
  final _navigation = locator<NavigationService>();
  final _storage = locator<SharedPreferencesService>();

  void init() async {
    List<String>? cities = await _storage.getData("localstorage");
    await Future.delayed(const Duration(seconds: 3),(){
      if (cities != null) {
      _navigation.pushNamedAndRemoveUntil(Routes.homeView,
          arguments: HomeViewArguments(cities: cities));
    }else{
       _navigation.pushNamedAndRemoveUntil(Routes.currentLocationView);

    }

    });
    
  }
}
