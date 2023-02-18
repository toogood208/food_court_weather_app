import 'dart:async';

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../app/app.locator.dart';
import '../../app/app.router.dart';

class SplashScreenViewModel extends BaseViewModel {
  final _navigation = locator<NavigationService>();


  void navigateToCurrentLocationView() {
    Timer(
      const Duration(seconds: 3),
          () => _navigation.pushNamedAndRemoveUntil(Routes.currentLocationView),
    );
  }

}