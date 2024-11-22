import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../constants/Appcolors.dart';
import '../../constants/Networkconstants.dart';
import '../../utils/CommonValidations.dart';
import '../VendorController/VendorSetProfileController.dart';
import '../constants/Appsizes.dart';
import '../constants/Stringconstants.dart';
import '../constants/Textstyles.dart';
import '../utils/CommonbtnWidget.dart';
import '../utils/Commonformfield.dart';

class Vendorsetprofileui extends StatefulWidget {
  const Vendorsetprofileui({Key? key}) : super(key: key);

  @override
  State<Vendorsetprofileui> createState() => _SetupProfileScreenState();
}

class _SetupProfileScreenState extends State<Vendorsetprofileui> {
  Vendorsetprofilecontroller controller = Get.put(Vendorsetprofilecontroller());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: CommonbtnWidget(
            title: update_profile,
            onTap: () {
              print(controller.profileimage);
              if (controller.formKey.currentState!.validate()) {
              }
            },
          ),
        ),
        // appBar: App_bar(),
        body: body(),
      ),
    );
  }

  Widget body() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: leftside_margin),
      child: Form(
        key: controller.formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 2.h,
              ),
              Center(
                  child: Text(
                setup_your_profile,
                style: Common_textstyles.otpverificationtitlestyle,
              )),
              SizedBox(
                height: 2.h,
              ),
              Center(
                child: Stack(
                  children: [
                    // Profile picture (avatar)
                    Obx(() {
                      return CircleAvatar(
                        radius: 55,
                        backgroundImage: controller.profileimage.value != null
                            ? FileImage(controller.profileimage.value!)
                            : controller.selectedImage.value.isNotEmpty
                                ? NetworkImage(vhImageBaseUrl +
                                    controller.selectedImage.value)
                                : const AssetImage(
                                    "assets/images/profilepic.png"), // Default avatar
                      );
                    }),
                    // Edit pencil icon
                    // https://himachaliapples.com/storage/app/profile_images/Eu9ieuWw3E10og4hT9t1A20p2bwoZWCw4vgFsxZ0.png
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: GestureDetector(
                        onTap: () {
                          controller.showPicker(
                              context); // Trigger image picker on tap
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color:
                                themecolor, // Background color of the edit icon
                          ),
                          padding: EdgeInsets.all(6),
                          child: const Icon(
                            Icons.edit,
                            color: Colors.white,
                            size: 22, // Size of the edit icon
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // CommonImageWidget(imageSourceType: ImageSourceType.asset, imageUrl: images_baseurl+"profilepic.png",height: 12.h,fit: BoxFit.fill,),
              // Text(upload_image,style: TextStyle(fontWeight: FontWeight.normal,fontSize: 14,color:singupcolor),),
              SizedBox(
                height: 3.h,
              ),
              Commonformfield(
                hinttext: owner_name,
                fieldcontroller: controller.ownernameController,
                validator: (value) {
                  return nameValidator(value);
                },
              ),
              SizedBox(
                height: 2.h,
              ),
              Commonformfield(
                hinttext: shop_business_name,
                fieldcontroller: controller.shopnameController,
                validator: (value) {
                  return nameValidator(value);
                },
              ),
              SizedBox(
                height: 2.h,
              ),
              Commonformfield(
                hinttext: email_address,
                fieldcontroller: controller.emailController,
                validator: (value) {
                  return emailValidator(value);
                },
              ),
              SizedBox(
                height: 2.h,
              ),
              Commonformfield(
                keyboardtype: TextInputType.number,
                hinttext: phonenumber,
                fieldcontroller: controller.phonenumberController,
                validator: (value) {
                  return phoneNumberValidator(value);
                },
              ),
              SizedBox(
                height: 2.h,
              ),
              SizedBox(
                height: 2.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
