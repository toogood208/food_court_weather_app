import 'package:flutter/material.dart';
import 'package:food_court_weather_app/views/splash_screen/splash_screen_view_model.dart';
import 'package:stacked/stacked.dart';

import '../../utils/colors.dart';
import '../../utils/dimension.dart';
import '../../utils/text_style.dart';
class SplashScreenView extends StatelessWidget {
  const SplashScreenView({super.key});
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      onViewModelReady: (model) => model.init(),
      viewModelBuilder: () => SplashScreenViewModel(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: splashScreenBackgroundColor,
        body: Center(
          child: Column(
            children: <Widget>[
              splashScreenCenterHeight,
              Image.asset(
                'assets/images/weather_splash_screen_icon.png',
                width: splashScreenIconWidth,
                height: splashScreenIconHeight,
              ),
              splashScreenIconToTextHeight,
              Text("weather X",
                  textAlign: TextAlign.center, style: splashScreenTextStyles),
            ],
          ),
        ),
      ),
    );
  }
}