import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_court_weather_app/views/current_location/current_location_view_model.dart';
import 'package:food_court_weather_app/widgets/app_spinner.dart';
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
        body: model.isBusy ? const Center(child: AppSpinner(),): Padding(
          padding:  EdgeInsets.all(25.0.r),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[

              SizedBox(
                child: Text("Let’s See The ⭐ Weather Around you",
                    textAlign: TextAlign.center,
                    style: splashScreen2LetsWeatherTextStyle),
              ),
              SizedBox(height: 50.h),
              GestureDetector(
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
            ],
          ),
        ),
      ),
    );
  }
}
