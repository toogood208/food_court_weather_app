import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_court_weather_app/views/home/home_view_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';

import '../../widgets/custome_app_bar.dart';

class HomeView extends StatelessWidget {
  final String latitude;
  final String longitude;

  const HomeView({super.key,required this.latitude, required this.longitude});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
        disposeViewModel: false,
        initialiseSpecialViewModelsOnce: true,
        viewModelBuilder: () => HomeViewModel(),
        onViewModelReady: (model) => model.getWeather(lat: "10.99",lon: "44.34"),
        builder: (context, model, child) {
          return model.isBusy
              ? const Center(
            child: CircularProgressIndicator.adaptive(),
          )
              : Scaffold(
            appBar: const CustomAppbar(),
            body: SafeArea(
              child: Padding(
                  padding: EdgeInsets.only(
                    left: 37.w,
                  ),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        top: 58.h,
                        child: SizedBox(
                          width: 254.w,
                          child: Text(
                            "Feels like a good day to ride a bike ",
                            style: GoogleFonts.poppins(
                              fontSize: 24.sp,
                              fontWeight: FontWeight.w500,
                              color: const Color.fromRGBO(9, 21, 30, 1),
                            ),
                          ),
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
                              color:
                              const Color.fromRGBO(255, 255, 255, 1)),
                        ),
                      ),
                      Positioned(
                        top: 240.h,
                        left: 92.w,
                        child: Text(
                          '${model.temperature}°',
                          style: GoogleFonts.poppins(
                              fontSize: 43.89.sp,
                              fontWeight: FontWeight.w400,
                              color:
                              const Color.fromRGBO(255, 255, 255, 1)),
                        ),
                      ),
                      Positioned(
                        top: 260.h,
                        left: 118.w,
                        child: Image.network(
                          model.weatherIcon,
                          width: 84.w,
                          height: 85.h,
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
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Today's Mood ",
                                  style: GoogleFonts.poppins(
                                    fontSize: 14.4.sp,
                                    fontWeight: FontWeight.w400,
                                    color: const Color.fromRGBO(
                                        54, 66, 77, 1),
                                  ),
                                ),
                                Text(
                                  "Very Good ",
                                  style: GoogleFonts.poppins(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                    color: const Color.fromRGBO(
                                        12, 24, 35, 1),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 30.w,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Tommorow's Mood ",
                                  style: GoogleFonts.poppins(
                                    fontSize: 14.4.sp,
                                    fontWeight: FontWeight.w400,
                                    color: const Color.fromRGBO(
                                        54, 66, 77, 1),
                                  ),
                                ),
                                Text(
                                  "Excellent",
                                  style: GoogleFonts.poppins(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                    color: const Color.fromRGBO(
                                        12, 24, 35, 1),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  )),
            ),
          );
        });
  }
}