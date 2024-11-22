import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:plenum_manager/vendor_ui/VendorOtpVerification.dart';
import 'package:sizer/sizer.dart';
import '../../utils/CommonImageWidget.dart';
import '../../utils/CommonValidations.dart';
import '../VendorController/VendorSignupController.dart';
import '../constants/Appcolors.dart';
import '../constants/Stringconstants.dart';
import '../utils/CommonbtnWidget.dart';
import '../utils/Commonformfield.dart';
import 'VendorSetProfileUi.dart';
import 'VendorSignInScreen.dart';

class Vendorsignup extends StatefulWidget {
  const Vendorsignup({Key? key}) : super(key: key);

  @override
  State<Vendorsignup> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<Vendorsignup> {
  Vendorsignupcontroller controller = Get.put(Vendorsignupcontroller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Icon(
              Icons.arrow_back_sharp,
              color: Colors.black,
            )),
        backgroundColor: white,
      ),
      body: body(),
    );
  }

  Widget body() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 3.w),
      child: SingleChildScrollView(
        child: Form(
          key: controller.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                sign_up,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Commonformfield(
                hinttext: owner_name,
                fieldcontroller: controller.name_controller,
                prefix: CommonImageWidget(
                  imageSourceType: ImageSourceType.svg,
                  imageUrl: icon_baseurl + "usericon.svg",
                ),
                validator: (value) {
                  return nameValidator(value);
                },
              ),
              SizedBox(
                height: 2.h,
              ),
              Commonformfield(
                hinttext: shop_business_name,
                fieldcontroller: controller.businessname_controller,
                prefix: CommonImageWidget(
                    imageSourceType: ImageSourceType.svg,
                    imageUrl: icon_baseurl + "usericon.svg"),
                validator: (value) {
                  return nameValidator(value);
                },
              ),
              SizedBox(
                height: 2.h,
              ),
              Commonformfield(
                hinttext: enter_your_email,
                fieldcontroller: controller.email_controller,
                prefix: CommonImageWidget(
                    imageSourceType: ImageSourceType.svg,
                    imageUrl: icon_baseurl + "messageicon.svg"),
                validator: (value) {
                  return emailValidator(value);
                },
              ),
              SizedBox(
                height: 2.h,
              ),
              Commonformfield(
                hinttext: "000-000-0000",
                fieldcontroller: controller.phone_controller,
                keyboardtype: TextInputType.number,
                prefix: CommonImageWidget(
                    imageSourceType: ImageSourceType.svg,
                    imageUrl: icon_baseurl + "phoneicon.svg"),
                validator: (value) {
                  return phoneNumberValidator(value);
                },
              ),
              SizedBox(
                height: 2.h,
              ),
             Obx((){
               return  Commonformfield(
                 obscuretxt: controller.yourpasswordObscured.value,
                 hinttext: your_password,
                 fieldcontroller: controller.password_controller,
                 suffix: IconButton(
                   splashColor: Colors.transparent,
                   icon: Icon(controller.yourpasswordObscured.value
                       ? Icons.visibility_off
                       : Icons.visibility,color: themecolor,),
                   onPressed: () {
                     controller.yourPasswordVisibility();
                   },
                 ),
                 prefix: CommonImageWidget(
                     imageSourceType: ImageSourceType.svg,
                     imageUrl: icon_baseurl + "lockicon.svg"),
                 validator: (value) {
                   return passwordValidator(value);
                 },
               );
             }),
              SizedBox(
                height: 2.h,
              ),
             Obx((){
               return  Commonformfield(
                 obscuretxt: controller.confirmpasswordObscured.value,
                 hinttext: confirm_password,
                 fieldcontroller: controller.confirmpassword_controller,
                 suffix: IconButton(
                   splashColor: Colors.transparent,
                   icon: Icon(controller.confirmpasswordObscured.value
                       ? Icons.visibility_off
                       : Icons.visibility,color: themecolor,),
                   onPressed: () {
                     controller.confirmPasswordVisibility();
                   },
                 ),
                 prefix: CommonImageWidget(
                     imageSourceType: ImageSourceType.svg,
                     imageUrl: icon_baseurl + "lockicon.svg"),
                 validator: (value) {
                   return confirmPasswordValidator(value,controller.password_controller);
                 },
               );
             }),
              SizedBox(
                height: 5.h,
              ),
              CommonbtnWidget(
                title: sign_up,
                onTap: () {
                  // if (controller.formKey.currentState!.validate()) {
                    Get.to(Vendorotpverification());
                  // }
                },
              ),
              SizedBox(
                height: 5.h,
              ),
              GestureDetector(
                onTap: () {
                  Get.to(Vendorsigninscreen());
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      already_have_an_account,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      signin,
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: singupcolor),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
