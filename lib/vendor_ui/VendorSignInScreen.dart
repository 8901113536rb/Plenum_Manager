import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:plenum_manager/vendor_ui/Vendordashboardui.dart';
import 'package:sizer/sizer.dart';
import '../../constants/Appcolors.dart';
import '../../constants/Stringconstants.dart';
import '../../utils/CommonImageWidget.dart';
import '../../utils/CommonValidations.dart';
import '../../utils/CommonbtnWidget.dart';
import '../../utils/Commonformfield.dart';
import '../VendorController/VendorSignInController.dart';


import '../constants/Appsizes.dart';
import 'VendorForgotScreen.dart';
import 'VendorOtpVerification.dart';
import 'VendorSignUp.dart';

class Vendorsigninscreen extends StatefulWidget {
  const Vendorsigninscreen({Key? key}) : super(key: key);

  @override
  State<Vendorsigninscreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<Vendorsigninscreen> {
  Vendorsignincontroller controller = Get.put(Vendorsignincontroller());
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: body(),
      ),
    );
  }

  Widget body() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: leftside_margin),
      height: double.infinity,
      width: double.infinity,
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 5.h,
              ),
              Center(
                  child: CommonImageWidget(
                imageSourceType: ImageSourceType.asset,
                imageUrl: images_baseurl + 'applogo.png',
                height: 8.h,
                fit: BoxFit.fitHeight,
              )),
              SizedBox(
                height: 5.h,
              ),
              Text(
                signin,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Commonformfield(
                  hinttext: email_phone_number,
                  fieldcontroller: controller.emailcontroller,
                  prefix: CommonImageWidget(
                    imageSourceType: ImageSourceType.svg,
                    imageUrl: icon_baseurl + 'messageicon.svg',
                  ),
                  validator: (value) {
                    return emailValidator(value);
                  }),
              SizedBox(height: 2.h),
              Obx(() {
                return Commonformfield(
                    obscuretxt: controller.isObscured.value,
                    hinttext: your_password,
                    fieldcontroller: controller.passwordcontroller,
                    suffix: IconButton(
                      splashColor: Colors.transparent,
                      icon: Icon(controller.isObscured.value
                          ? Icons.visibility_off
                          : Icons.visibility,color: themecolor,),
                      onPressed: () {
                        controller.togglePasswordVisibility();
                      },
                    ),
                    prefix: CommonImageWidget(
                      imageSourceType: ImageSourceType.svg,
                      imageUrl: icon_baseurl + "lockicon.svg",
                    ),
                    validator: (value) {
                      return passwordValidator(value);
                    });
              }),
              SizedBox(height: 2.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                      onTap: () {
                        Get.to(const Vendorforgotscreen());
                      },
                      child: const Text(
                        forgot_password,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ))
                ],
              ),
              SizedBox(height: 2.h),
              CommonbtnWidget(
                title: signin,
                onTap: () {
                  // if (formKey.currentState!.validate()) {
                  Get.to(VendorDashBoardUi());
                  // }
                },
              ),
              SizedBox(
                height: 15.h,
              ),
              GestureDetector(
                onTap: () {
                  Get.to(Vendorsignup());
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      dont_have_an_account,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      sign_up,
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: singupcolor),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
