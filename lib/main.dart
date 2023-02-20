import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_court_weather_app/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

import 'app/app.locator.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
 await setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'First Method',
          // You can use the library anywhere in the app even in theme
          theme: ThemeData(
            primarySwatch: Colors.grey,
            textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
          ),
         initialRoute: Routes.splashScreenView,
         onGenerateRoute: StackedRouter().onGenerateRoute,
         navigatorKey: StackedService.navigatorKey,
        );
      },

    );

  }
}


