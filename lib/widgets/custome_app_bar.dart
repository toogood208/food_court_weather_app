import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppbar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppbar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: Container(
        padding: EdgeInsets.all(8.r),
        child: Image.asset(
          "assets/images/avatar.png",
          width: 38.w,
          height: 40.11.h,
        ),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Lagos",
            style: GoogleFonts.poppins(
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              color: const Color.fromRGBO(
                9,
                21,
                30,
                1,
              ),
            ),
          ),
          Column(
            children: [
              SizedBox(height: 5.h,),
              Icon(Icons.location_on,
                size: 10.r,
                color:  const Color.fromRGBO(
                  9,
                  21,
                  30,
                  1,
                ),),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize =>const Size.fromHeight(kToolbarHeight);
}