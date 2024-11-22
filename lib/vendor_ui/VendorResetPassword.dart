import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:plenum_manager/vendor_ui/VendorSignInScreen.dart';
import 'package:sizer/sizer.dart';

import '../../constants/Appcolors.dart';
import '../../constants/Appsizes.dart';
import '../../constants/Stringconstants.dart';
import '../../constants/Textstyles.dart';
import '../../utils/CommonImageWidget.dart';
import '../../utils/CommonValidations.dart';
import '../../utils/Commonwidgets.dart';
import '../VendorController/VendorResetPasswrdController.dart';
import '../utils/CommonbtnWidget.dart';
import '../utils/Commonformfield.dart';

class Vendorresetpassword extends StatefulWidget {
  Vendorresetpassword({Key? key}) : super(key: key);

  @override
  State<Vendorresetpassword> createState() => _VendorresetpasswordState();
}

class _VendorresetpasswordState extends State<Vendorresetpassword> {
  Vendorresetpasswrdcontroller controller =
      Get.put(Vendorresetpasswrdcontroller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: App_bar(backbtn: true, bgcolor: white),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: leftside_margin),
        child: Form(
          key: controller.formKey,
          child: SingleChildScrollView(
            child: Column(
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
                  create_new_password,
                  style: Common_textstyles.otpverificationtitlestyle,
                ),
                SizedBox(
                  height: 3.h,
                ),
                Text(
                  your_new_password_must_unique,
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                      color: otpverificationdetailcolor),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 5.h,
                ),
                Obx(() {
                  return Commonformfield(
                    hinttext: new_password,
                    suffix: IconButton(
                      splashColor: Colors.transparent,
                      icon: Icon(
                        controller.newpasswordObscured.value
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: themecolor,
                      ),
                      onPressed: () {
                        controller.newPasswordVisibility();
                      },
                    ),
                    fieldcontroller: controller.newpassword_controller,
                    validator: (value) {
                      return passwordValidator(value);
                    },
                  );
                }),
                SizedBox(
                  height: 2.h,
                ),
                Obx(() {
                  return Commonformfield(
                    hinttext: confirm_password,
                    suffix: IconButton(
                      splashColor: Colors.transparent,
                      icon: Icon(
                        controller.confirmpasswordObscured.value
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: themecolor,
                      ),
                      onPressed: () {
                        controller.confirmPasswordVisibility();
                      },
                    ),
                    fieldcontroller: controller.confirmpassword_controller,
                    validator: (value) {
                      return confirmPasswordValidator(
                          value, controller.newpassword_controller);
                    },
                  );
                }),
                SizedBox(
                  height: 20.h,
                ),
                CommonbtnWidget(
                  title: reset_password,
                  onTap: () {
                    if (controller.formKey.currentState!.validate()) {
                     Get.to(Vendorsigninscreen());
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
