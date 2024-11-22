import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../constants/Appcolors.dart';
import '../../constants/Networkconstants.dart';
import '../../constants/Textstyles.dart';
import '../../utils/CommonFunctions.dart';
import '../../utils/CommonImageWidget.dart';
import '../../utils/CommonbtnWidget.dart';
import '../../utils/CustomStepper.dart';
import '../VendorController/VendorOrderDetailController.dart';
import '../constants/Stringconstants.dart';

class Vendororderdetailui extends StatefulWidget {
   Vendororderdetailui({super.key,
  });

  @override
  State<Vendororderdetailui> createState() => _VendororderdetailuiState();
}

class _VendororderdetailuiState extends State<Vendororderdetailui> {
  Vendororderdetailcontroller controller =
      Get.put(Vendororderdetailcontroller());
  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.black, //change your color here
          ),
          centerTitle: false,
          automaticallyImplyLeading: true,
          titleSpacing: 0,
          backgroundColor: white,
          toolbarHeight: 9.h,
          flexibleSpace: Container(
            color: white,
            margin: EdgeInsets.only(left: 4.w, right: 4.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.arrow_back,
                      size: 20,
                      color: black,
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         Text(
                          "6545675678",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          "24",
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: create_acc_color),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        bottomSheet: deliverproduct(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 2.h,),
              productdetailView(),
              SizedBox(height: 1.h,),
              taxview(),
              SizedBox(height: 2.h,),
             // productdeiveryView(),
              buyerdetailview(),

            ],
          ),
        ),
      ),
    );
  }
  Widget taxview(){
    return Column(
      children: [
        SizedBox(
          height: 2.h,
        ),
        Container(
          width: double.infinity,
          // height: 21.5.h,
          margin: EdgeInsets.only(left: 5.w, right: 5.w, top: 2.h),
          decoration:  BoxDecoration(
            color: white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(.5),
                blurRadius: 20.0, // soften the shadow
                spreadRadius: 0.0, //extend the shadow
                offset: Offset(
                  5.0, // Move to right 10  horizontally
                  5.0, // Move to bottom 10 Vertically
                ),
              )
            ],
          ),
          child: Padding(
            padding:
            EdgeInsets.only(left: 3.w, right: 3.w, top: 2.h, bottom: 2.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                tax_detail_view(mrp_total,"$currency ${"6000"}"),
                SizedBox(
                  height: 0.3.h,
                ),
                tax_detail_view(total_tax,"$currency ${"1000"}"),
                SizedBox(
                  height: 0.3.h,
                ),
                 tax_detail_view("GST", "$currency ${"40"}"),
                SizedBox(
                  height: 0.3.h,
                ),
               tax_detail_view(Service_Charges,"$currency${"500"}"),
            SizedBox(
                  height: 0.3.h,
                ),
                tax_detail_view("Other","$currency${"400"}")
                  ,
               SizedBox(
                  height: 0.3.h,
                ),
                tax_detail_view(quantity,"8"),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget tax_detail_view(title,value) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title + ":",
            style: Common_textstyles.ordrdtltitleTextStyle,
          ),
          Text(
            value,
            style: Common_textstyles.ordrdtltitleTextStyle,
          ),
        ],
      ),
    );
  }

  Widget deliverproduct(){
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: CommonbtnWidget(title: order_deliver,onTap: (){

      },),
    );
  }
  Widget productdetailView(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 20.w,
            height: 9.h,
            child: CommonImageWidget(imageSourceType: ImageSourceType.asset, imageUrl: images_baseurl+"appledummy.png",fit: BoxFit.fill,),
          ),
          SizedBox(width: 3.w,),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("ALBINO -| Tab",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: blackcolor)),
              SizedBox(
                  width: 70.w,
                  child: Text("ALBINO 500mg + Liver 6mg",maxLines:2,overflow: TextOverflow.ellipsis,style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: emailhintcolor))),
              SizedBox(height: 0.6.h,),
              Text(currency+"500",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600,color: blackcolor))
            ],
          ),
        ],
      ),
    );
  }
  Widget productdeiveryView() {
    return Padding(
        padding: EdgeInsets.all(16.0),
        child: CustomStepper(ordercreatedat: "widget.order_created"));
  }

  Widget buyerdetailview() {
    return Container(
      width: 80.w,
      margin: EdgeInsets.only(left:15.w,right: 3.w, top: 6.h,),
      decoration: BoxDecoration(
        color: pinputborder,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.only(left: 3.w, top: 2.h, right: 3.w,bottom: 2.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                buyerdetail,
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: create_acc_color),
              ),
              Text("Rohit Bukkel",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: blackcolor)),
              Text(
                  "Mohali Phase 5",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: blackcolor)),
            ],
          ),
          SizedBox(
            height: 2.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    orderat,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: create_acc_color),
                  ),
                  Text("12 May 2000",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: blackcolor)),
                ],
              ),
              GestureDetector(
                onTap: (){
                  // launchUrlString(widget.buyer_mobile_number);
                },
                child: Container(
                  // margin: EdgeInsets.symmetric(horizontal: 15.w),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: themecolor,
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(1, 1),
                          blurRadius: 4,
                          color: themecolor,
                        )
                      ]),
                  height: 5.h,
                  width: 28.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.call,
                        color: white,
                        size: 15,
                      ),
                      SizedBox(
                        width: 2.w,
                      ),
                      Text(
                        call,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: white),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
