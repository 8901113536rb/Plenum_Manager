import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plenum_manager/vendor_ui/VendorSignInScreen.dart';
import 'package:sizer/sizer.dart';
import '../constants/Appcolors.dart';
import '../constants/Networkconstants.dart';
import '../constants/Stringconstants.dart';
import '../vendor_ui/AddNewProductScreen.dart';
import '../vendor_ui/MyEarningScreen.dart';
import '../vendor_ui/MyOrdersui.dart';
import '../vendor_ui/VendorAllProductsUi.dart';
import '../vendor_ui/VendorSetProfileUi.dart';
import 'Sharedutils.dart';

class CustomizeDrawerScreen extends StatefulWidget {
  @override
  _CustomizeDrawerScreenState createState() => _CustomizeDrawerScreenState();
}

class _CustomizeDrawerScreenState extends State<CustomizeDrawerScreen> {
  String vendor_name = "";
  String vendor_email = "";
  String vendor_image = "";

  @override
  void initState() {
    super.initState();
    getuserdetails();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 70.w,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Material(
              color: themecolor,
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).padding.top,
                    bottom: 3.h,
                  ),
                  child: Column(
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          // CircleAvatar with NetworkImage
                          CircleAvatar(
                            radius: 40,
                            backgroundImage: vendor_image.isNotEmpty
                                ? NetworkImage(vhImageBaseUrl + vendor_image)
                                : const AssetImage("assets/images/profilepic.png"),
                          ),
                          // CircularProgressIndicator
                          if (vendor_image.isNotEmpty)
                            FutureBuilder(
                              future: precacheImage(NetworkImage(vhImageBaseUrl + vendor_image), context),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState == ConnectionState.done) {
                                  return SizedBox.shrink(); // Hide the loader when image is done loading
                                }
                                return CircularProgressIndicator(); // Show loader while loading
                              },
                            ),
                        ],
                      ),
                      SizedBox(height: 2.h),
                      Text(
                        "Rohit Bukkel",
                        style: TextStyle(fontSize: 20, color: white),
                      ),
                      Text(
                        "rohit.one@gmail.com",
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            /// Header Menu items
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 5.w, top: 4.h),
                  child: GestureDetector(
                    onTap: () {
                      Get.back();
                      Get.to(Vendorallproductsui());
                    },
                    child: Row(
                      children: [
                        Image.asset(images_baseurl + "allproducts.png", width: 8.w),
                        SizedBox(width: 4.w),
                        Text(
                          allproducts,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: blackcolor,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 5.w, top: 4.h),
                  child: GestureDetector(
                    onTap: () {
                      Get.back();
                      Get.to(AddNewProductScreen());
                    },
                    child: Row(
                      children: [
                        Image.asset("assets/images/addproducts.png", width: 8.w),
                        SizedBox(width: 4.w),
                        Text(
                          addProduct,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: blackcolor,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 5.w, top: 4.h),
                  child: GestureDetector(
                    onTap: () {
                      Get.back();
                      Get.to(Vendorsetprofileui());
                    },
                    child: Row(
                      children: [
                        Image.asset("assets/images/editprofile.png", width: 7.w),
                        SizedBox(width: 4.w),
                        Text(
                          edit_profile,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: blackcolor,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 5.w, top: 4.h),
                  child: GestureDetector(
                    onTap: () {
                      Get.back();
                      Get.to(Myordersui());
                    },
                    child: Row(
                      children: [
                        Image.asset("assets/images/myorders.png", width: 6.w),
                        SizedBox(width: 4.w),
                        Text(
                          my_orders,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: blackcolor,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 5.w, top: 4.h),
                  child: GestureDetector(
                    onTap: () {
                      Get.back();
                      Get.to(Myearningscreen());
                    },
                    child: Row(
                      children: [
                        Image.asset("assets/images/myearnings.png", width: 7.w),
                        SizedBox(width: 4.w),
                        Text(
                          Earnings,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: blackcolor,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 5.w, top: 4.h),
                  child: GestureDetector(
                    onTap: () async {
                      await SharedUtils().cleardata();
                      Get.offAll(Vendorsigninscreen());
                    },
                    child: Row(
                      children: [
                        Container(
                          width: 8.w,
                          child: Icon(Icons.logout),
                        ),
                        SizedBox(width: 4.w),
                        Text(
                          logout,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: blackcolor,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Future<void> getuserdetails() async {
    vendor_name = await SharedUtils().get_username() ?? "";
    vendor_email = await SharedUtils().get_useremail() ?? "";
    vendor_image = await SharedUtils().get_userimage() ?? "";
    setState(() {});
  }
}
