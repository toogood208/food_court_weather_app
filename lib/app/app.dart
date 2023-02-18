import 'package:food_court_weather_app/core/services/location_service.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

import '../views/current_location/current_location_view.dart';
import '../views/splash_screen/splash_screen_view.dart';

@StackedApp(
  routes: [
    AdaptiveRoute(page: SplashScreenView),
    AdaptiveRoute(page: CurrentLocationView)
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: LocationService),
  ],
  logger: StackedLogger(),
)
class App {}