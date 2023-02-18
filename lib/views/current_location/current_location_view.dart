import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_court_weather_app/views/current_location/current_location_view_model.dart';
import 'package:stacked/stacked.dart';

import '../../utils/colors.dart';
import '../../utils/dimension.dart';
import '../../utils/text_style.dart';

class CurrentLocationView extends StatelessWidget {
  const CurrentLocationView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => CurrentLocationViewModel(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: splashScreen2BackgroundColor,
        body: Stack(
          children: <Widget>[
            Positioned(
              right: 0,
              top: 0,
              width: splash2Iconwidth,
              height: splashScreen2IconHeight,
              child: Image.asset(
                'assets/images/star.png',
              ),
            ),
            Positioned(
              //<-- SEE HERE
              top: splashScreen2WeatherTextPositionTop,
              left: splashScreen2WeatherTestPositionLeft = 61.w,

              child: Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  width: splashScreen2ButtonWeatherSizedBoxWidth,
                  height: splashScreen2ButtonWeatherSizedBoxHeight,
                  child: Text("Let’s See The ⭐ Weather Around you",
                      textAlign: TextAlign.left,
                      style: splashScreen2LetsWeatherTextStyle),
                ),
              ),
            ),
            Positioned(

              top: splashScreen2ButtonPositionTop,
              left: splashScreen2ButtonPositionLeft,
              child: GestureDetector(
                onTap: () async {
                  model.getCurrentLocation();
                },
                child: Container(
                  width: splashScreen2ButtonWidth,
                  height: splashScreen2ButtonHeight,
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(12, 24, 35, 1),
                      borderRadius:
                      BorderRadius.circular(splashScreen2ButtonRadius)),
                  child: Center(
                    child: Text(
                      "Let’s check",
                      style: splashScreen2LetsCheckTextStyle,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
