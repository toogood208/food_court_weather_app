import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_court_weather_app/utils/dimension.dart';
import 'package:food_court_weather_app/utils/text_style.dart';
import 'package:food_court_weather_app/views/home/home_view_model.dart';
import 'package:food_court_weather_app/widgets/app_spinner.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';

import '../../../widgets/custom_text_box.dart';

class WeatherWidget extends StatelessWidget {
  final String city;

  const WeatherWidget({
    super.key,
    required this.city,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    return ViewModelBuilder.reactive(
      fireOnViewModelReadyOnce:true ,
      onViewModelReady: (model) => model.selectCity(city, context),
      viewModelBuilder: () => HomeViewModel(),
      builder: (context, model, child) => Scaffold(
        body:model.isBusy ? const Center(
          child: AppSpinner(),
        ): SafeArea(
          child: Padding(
              padding: weatherWidgetLeftPadding,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: 40.h,
                    child: SizedBox(
                      width: 254.w,
                      child: Text(
                          "If you want to see the sunshine, you have to weather the storm.",
                          style: weatherWidgetMainTextTextStyle),
                    ),
                  ),
                  Positioned(
                    top: 170.h,
                    child: Container(
                      padding: EdgeInsets.all(100.r),
                      width: 264.96.w,
                      height: 264.96.h,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromRGBO(12, 24, 35, 1),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 230.h,
                    left: 83.w,
                    child: Text(
                      model.description,
                      style: GoogleFonts.poppins(
                          fontSize: 14.02.sp,
                          fontWeight: FontWeight.w400,
                          color: const Color.fromRGBO(255, 255, 255, 1)),
                    ),
                  ),
                  Positioned(
                    top: 240.h,
                    left: 92.w,
                    child: Text(
                      '${model.temperature}°',
                      style: weatherWidgeTempTextTextStyle,
                    ),
                  ),
                  Positioned(
                    top: 280.h,
                    left: 215.w,
                    child: Image.asset(
                      "assets/images/Clear_night_icon_by_devoart.png",
                      width: 55.w,
                      height: 55.h,
                    ),
                  ),
                  Positioned(
                    top: 407.h,
                    left: 110.w,
                    child: Image.asset(
                      "assets/images/thundersrtom_icon_by_devoart.png",
                      width: 55.w,
                      height: 55.h,
                    ),
                  ),
                  Positioned(
                    top: 298.h,
                    left: 5.w,
                    child: Image.asset(
                      "assets/images/windy_icon_by_devoart.png",
                      width: 55.w,
                      height: 55.h,
                    ),
                  ),
                  Positioned(
                    top: 185.h,
                    left: 24.w,
                    child: Image.asset(
                      "assets/images/Cloudy_day_icon_by_devoart.png",
                      width: 55.w,
                      height: 55.h,
                    ),
                  ),
                  Positioned(
                    top: 184.h,
                    left: 185.w,
                    child: Image.asset(
                      "assets/images/rain_icon_by_devoart.png",
                      width: 55.w,
                      height: 55.h,
                    ),
                  ),
                  Positioned(
                    bottom: 60.h,
                    child: Row(
                      children: [
                        const CustomTextBox(
                          mainText: "Today's Mood",
                          subText: "Very Good",
                        ),
                        SizedBox(
                          width: 30.w,
                        ),
                        const CustomTextBox(
                          mainText: "Tomorrow's Mood",
                          subText: "Excellent",
                        ),
                      ],
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
