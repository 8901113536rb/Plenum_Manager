import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:sizer/sizer.dart';
import 'SplashScreen.dart';
import 'constants/Appcolors.dart';
import 'constants/Stringconstants.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return
    Sizer(
      builder: (context, orientation, deviceType) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: appname,
          theme: ThemeData(
            useMaterial3: false,
            scaffoldBackgroundColor: white,
            fontFamily: "Montserrat",
            primarySwatch: Colors.deepOrange,
          ),
          // home: Reward_listing(),
          home:SplashScreen()
          // home: SplashScreen()
          // home: Password_update_success(),
        );
      },
    );
  }
}

