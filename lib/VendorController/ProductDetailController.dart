import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import '../../constants/Networkconstants.dart';
import '../../utils/CommonToast.dart';
import '../../utils/Progressdialog.dart';
import '../../utils/Sharedutils.dart';
import '../constants/Stringconstants.dart';

class ProductDetailController extends GetxController{
  Rx<File?> selectedImage = Rx<File?>(null);
  final ImagePicker picker = ImagePicker();
  var image = Rx<File?>(null);
  // List<ModelVariantValues> listVariant = [];
  var productname_controller=TextEditingController();
  var productdesc_controller=TextEditingController();
  final List<String> sizes = [
    'Extra Large',
    'Large',
    'Medium',
    'Small',
  ];
  var categories=["item1,item2,item3"].obs;
  var no_of_layer_controller=<TextEditingController>[].obs;
  var weight_controller=<TextEditingController>[].obs;
  var pieces_controller=<TextEditingController>[].obs;
  var retailprice_controller=<TextEditingController>[].obs;
  var sellingprice_controller=<TextEditingController>[].obs;
  var quantity_controller=<TextEditingController>[].obs;
  RxString? selectedcategory="".obs;

  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    super.onInit();
    Future.microtask(() {
    });
  }

  Future<void> pickImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery,imageQuality: 50);
    if (pickedFile != null) {
      image.value = File(pickedFile.path);
    }
  }

  Future<void> pickImageFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera,imageQuality: 50);

    if (pickedFile != null) {
      image.value = File(pickedFile.path);
    }
  }
  void showPicker(context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Container(
            child: Wrap(
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.photo_library),
                  title: Text(gallery_txt),
                  onTap: () {
                    pickImageFromGallery();
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  leading: Icon(Icons.photo_camera),
                  title: Text(camera_txt),
                  onTap: () {
                    pickImageFromCamera();
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

}