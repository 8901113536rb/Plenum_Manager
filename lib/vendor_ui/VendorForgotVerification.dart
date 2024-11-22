import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:plenum_manager/vendor_ui/VendorResetPassword.dart';
import 'package:sizer/sizer.dart';
import '../../../constants/Appcolors.dart';
import '../../../utils/CommonValidations.dart';
import '../../../utils/Commonwidgets.dart';
import '../../utils/CommonImageWidget.dart';
import '../VendorController/VendorforgotverificationController.dart';
import '../constants/Appsizes.dart';
import '../constants/Stringconstants.dart';
import '../constants/Textstyles.dart';
import '../utils/CommonbtnWidget.dart';


class Vendorforgotverification extends StatefulWidget {
  Vendorforgotverification({Key? key,}) : super(key: key);

  @override
  State<Vendorforgotverification> createState() => _VendorforgotverificationState();
}

class _VendorforgotverificationState extends State<Vendorforgotverification> {
  final focusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  Vendorforgotverificationcontroller controller=Get.put(Vendorforgotverificationcontroller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: App_bar(bgcolor: white,backbtn: true),
      body: body(),
    );
  }
  Widget body(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: leftside_margin),
      height: double.infinity,
      width: double.infinity,
      child:Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: CommonImageWidget(imageSourceType: ImageSourceType.asset, imageUrl: images_baseurl+'applogo.png',height: 8.h,fit: BoxFit.fitHeight,)),
              SizedBox(height: 5.h,),
              Text(otp_verification,style: Common_textstyles.otpverificationtitlestyle,),
              SizedBox(height: 1.h,),
              Text(enter_the_verification_code,style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal,color: otpverificationdetailcolor),textAlign: TextAlign.center,),
              SizedBox(height: 4.h,),
              pin_input(),
              SizedBox(height: 30.h,),
              CommonbtnWidget(title: verify,onTap: (){
                if (formKey.currentState!.validate()) {
               Get.to(Vendorresetpassword());
                } }),

            ],
          ),
        ),
      ),
    );
  }

  Widget pin_input(){
    final defaultPinTheme = PinTheme(
      width: 55,
      height: 55,
      textStyle: const TextStyle(
        fontSize: 22,
        color: Color.fromRGBO(30, 60, 87, 1),
      ),
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: pinputborder),
      ),
    );

    return Directionality(
      // Specify direction if desired
      textDirection: TextDirection.ltr,
      child: Pinput(
        length: 6,
        controller: controller.pinController,
        focusNode: focusNode,
        androidSmsAutofillMethod:
        AndroidSmsAutofillMethod.smsUserConsentApi,
        listenForMultipleSmsOnAndroid: true,
        defaultPinTheme: defaultPinTheme,
        separatorBuilder: (index) => const SizedBox(width: 15),
        validator: (value) {
          return otpValidator(value);  // Return null if valid
        },
        // onClipboardFound: (value) {
        //   debugPrint('onClipboardFound: $value');
        //   pinController.setText(value);
        // },
        hapticFeedbackType: HapticFeedbackType.lightImpact,
        onCompleted: (pin) {
          debugPrint('onCompleted: $pin');
        },
        onChanged: (value) {
          debugPrint('onChanged: $value');
        },
        cursor: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 9),
              width: 22,
              height: 1,
              color: Colors.black,
            ),
          ],
        ),
        focusedPinTheme: defaultPinTheme.copyWith(
          decoration: defaultPinTheme.decoration!.copyWith(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: themecolor),
          ),
        ),
        submittedPinTheme: defaultPinTheme.copyWith(
          decoration: defaultPinTheme.decoration!.copyWith(
            color: white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.black),
          ),
        ),
        errorPinTheme: defaultPinTheme.copyBorderWith(
          border: Border.all(color: Colors.redAccent),
        ),
      ),
    );
  }

}
