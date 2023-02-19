import 'package:food_court_weather_app/core/services/location_service.dart';
import 'package:food_court_weather_app/core/services/network_services/api_service.dart';
import 'package:food_court_weather_app/core/services/network_services/network_services.dart';
import 'package:food_court_weather_app/core/services/server_service.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

import '../views/current_location/current_location_view.dart';
import '../views/home/home.dart';
import '../views/splash_screen/splash_screen_view.dart';

@StackedApp(
  routes: [
    AdaptiveRoute(page: SplashScreenView),
    AdaptiveRoute(page: CurrentLocationView),
    AdaptiveRoute(page: HomeView)
  ],
  dependencies: [
    // network
    LazySingleton(classType: APIService),
    LazySingleton(classType: NetworkService),
    LazySingleton(classType: ServerService),

    // stacked services
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: SnackbarService),

    // location
    LazySingleton(classType: LocationService),
  ],
  logger: StackedLogger(),
)
class App {}