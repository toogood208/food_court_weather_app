import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextBox extends StatelessWidget {
  const CustomTextBox({
    super.key,
    required this.mainText,
    required this.subText,
  });
  final String mainText;
  final String subText;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment:
      CrossAxisAlignment.start,
      children: [
        Text(
          mainText,
          style: GoogleFonts.poppins(
            fontSize: 14.4.sp,
            fontWeight: FontWeight.w400,
            color: const Color.fromRGBO(
                54, 66, 77, 1),
          ),
        ),
        Text(
          subText,
          style: GoogleFonts.poppins(
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
            color: const Color.fromRGBO(
                12, 24, 35, 1),
          ),
        ),
      ],
    );
  }
}