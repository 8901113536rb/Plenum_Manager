import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../constants/Networkconstants.dart';
import '../../utils/CommonToast.dart';
import '../../utils/Progressdialog.dart';

class Vendorresetpasswrdcontroller extends GetxController{
  var newpassword_controller=TextEditingController();
  var confirmpassword_controller=TextEditingController();
  final formKey = GlobalKey<FormState>();
  RxBool newpasswordObscured = true.obs;
  RxBool confirmpasswordObscured = true.obs;

  void  newPasswordVisibility() {
    newpasswordObscured.value = !newpasswordObscured.value;
  }
  void  confirmPasswordVisibility() {
    confirmpasswordObscured.value = !confirmpasswordObscured.value;
  }
}