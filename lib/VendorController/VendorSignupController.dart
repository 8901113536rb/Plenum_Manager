import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Vendorsignupcontroller extends GetxController{
  var name_controller=TextEditingController();
  var businessname_controller=TextEditingController();
  var email_controller=TextEditingController();
  var phone_controller=TextEditingController();
  var password_controller=TextEditingController();
  var confirmpassword_controller=TextEditingController();
  final formKey = GlobalKey<FormState>();
  RxBool yourpasswordObscured = true.obs;
  RxBool confirmpasswordObscured = true.obs;

  void  yourPasswordVisibility() {
    yourpasswordObscured.value = !yourpasswordObscured.value;
  }
  void  confirmPasswordVisibility() {
    confirmpasswordObscured.value = !confirmpasswordObscured.value;
  }

}