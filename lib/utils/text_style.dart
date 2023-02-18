import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';
import 'dimension.dart';

var splashScreenTextStyles = GoogleFonts.syncopate(
  fontWeight: FontWeight.w700,
  fontSize: splashScreenTextSize,
  color: splashScreenTextColor,
);
var splashScreen2LetsCheckTextStyle = GoogleFonts.poppins(
  color: const Color.fromRGBO(252, 252, 252, 1),
  fontWeight: FontWeight.bold,
  fontSize: 20.sp,
);

var splashScreen2LetsWeatherTextStyle = GoogleFonts.poppins(
  color: const Color.fromRGBO(12, 24, 35, 1),
  fontWeight: FontWeight.w700,
  fontSize: 42.sp,
);