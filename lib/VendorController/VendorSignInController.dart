import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Vendorsignincontroller extends GetxController{
  var emailcontroller=TextEditingController();
  var passwordcontroller=TextEditingController();
  RxBool isObscured = true.obs;

  void togglePasswordVisibility() {
      isObscured.value = !isObscured.value;
  }
}