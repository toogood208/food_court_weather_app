import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

import '../views/splash_screen/splash_screen_view.dart';

@StackedApp(
  routes: [
    AdaptiveRoute(page: SplashScreenView),
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
  ],
  logger: StackedLogger(),
)
class App {}