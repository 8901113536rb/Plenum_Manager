import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:plenum_manager/utils/CommonImageWidget.dart';
import 'package:plenum_manager/vendor_ui/VendorSignInScreen.dart';
import 'package:sizer/sizer.dart';
import 'constants/Stringconstants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3),(){
      Get.to(Vendorsigninscreen());
      // Get.to(BottomNavScreen());
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: CommonImageWidget(imageSourceType: ImageSourceType.asset, imageUrl: images_baseurl+'applogo.png',width: 35.w,fit: BoxFit.contain,),
      ),
    );
  }
}
