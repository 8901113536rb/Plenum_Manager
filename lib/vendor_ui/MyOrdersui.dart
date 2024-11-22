import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../constants/Appcolors.dart';
import '../../constants/Networkconstants.dart';
import '../../constants/Stringconstants.dart';
import '../../constants/Textstyles.dart';
import '../../utils/CommonFunctions.dart';
import '../../utils/CommonImageWidget.dart';
import '../../utils/CommonbtnWidget.dart';
import '../../utils/Commonwidgets.dart';
import '../../utils/CustomizeDrawerScreen.dart';
import '../../utils/Sharedutils.dart';
import '../VendorController/MyOrdersController.dart';
import '../utils/CommonAppBarWidget.dart';
import 'VendorOrderDetailUi.dart';

class Myordersui extends StatefulWidget {
  const Myordersui({super.key});

  @override
  State<Myordersui> createState() => _MyordersuiState();
}

class _MyordersuiState extends State<Myordersui>{
  Myorderscontroller controller=Get.put(Myorderscontroller());

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
        drawer: CustomizeDrawerScreen(),
        appBar: Commonappbarwidget(
          leftText: myorders,
          showBackArrow: true,
        ),
        body:myOrdersView()
      );

  }
  Widget myOrdersView(){
    return
    ListView.builder(
        padding: EdgeInsets.only(bottom: 2.h),
        itemCount: 4,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap:(){
              // Get.to(Vendororderdetailui(
              //   order_no: newOrders[index].orderNo.toString(),
              //   order_status: newOrders[index].status.toString(),
              //   order_id: newOrders[index].orderedItems?[0].orderId.toString()??"0",
              //   orde_price: newOrders[index].amount.toString(),
              //   order_created: newOrders[index].createdAt.toString(),
              //   buyer_name: newOrders[index].vendor?.name ?? "",
              //   buyer_order_at: newOrders[index].vendor?.createdAt ?? "",
              //   buyer_mobile_number: newOrders[index].vendor?.phone ?? "",
              //   product_name: (newOrders[index].orderedItems != null && newOrders[index].orderedItems!.isNotEmpty)
              //       ? newOrders[index].orderedItems![0].product?.name?.toString() ?? ""
              //       : no_product_name,
              //   product_description: (newOrders[index].orderedItems != null && newOrders[index].orderedItems!.isNotEmpty)
              //       ? newOrders[index].orderedItems![0].product?.description?.toString() ?? ""
              //       : no_description_name,
              //   product_image: (newOrders[index].orderedItems != null && newOrders[index].orderedItems!.isNotEmpty)
              //       ? newOrders[index].orderedItems![0].product?.image?.toString() ?? ""
              //       : no_image_name,
              //   product_address: (newOrders[index].address != null && newOrders[index].address!.isNotEmpty)
              //       ? newOrders[index].address.toString() ?? ""
              //       : no_address_name,
              //
              //   total_tax: (newOrders[index].orderedItems?[0].totalTax != null && newOrders[index].orderedItems![0].totalTax!.isNotEmpty)
              //       ? newOrders[index].orderedItems![0].totalTax.toString() ?? ""
              //       : no_total_tax,
              //
              //   tax_values: (newOrders[index].orderedItems?[0].taxBriefValues != null && newOrders[index].orderedItems![0].taxBriefValues!.isNotEmpty)
              //       ? newOrders[index].orderedItems![0].taxBriefValues.toString() ?? ""
              //       : no_tax_value,
              //
              //   tax_titles: (newOrders[index].orderedItems?[0].taxBriefTitles != null && newOrders[index].orderedItems![0].taxBriefTitles!.isNotEmpty)
              //       ? newOrders[index].orderedItems![0].taxBriefTitles.toString() ?? ""
              //       : no_tax_title,
              //
              //   quantity: (newOrders[index].orderedItems?[0].quantity != null && newOrders[index].orderedItems![0].quantity!.toString().isNotEmpty)
              //       ? newOrders[index].orderedItems![0].quantity.toString() ?? ""
              //       : no_quantity,
              //
              // ))?.then((value){
              //   Future.microtask(() {
              //     controller.myOrders.clear();
              //     controller.myOrders.refresh();
              //     controller.fetchNewOrders();
              //   });
              // });
            },
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.only(left: 3.w,right: 3.w,top: 2.h),
              decoration: new BoxDecoration(
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
                padding: EdgeInsets.only(left: 3.w,right: 3.w,top: 2.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(ordernumber,style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: create_acc_color),),
                        Text(billamount,style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: create_acc_color)),
                      ],
                    ),
                    SizedBox(height: 0.4.h,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("34",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: blackcolor),),
                        Text(currency+"500",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: blackcolor)),
                      ],
                    ),
                    SizedBox(height: 1.h,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(buyerdetail,style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: create_acc_color),),
                        Text("Rohit Bukkel",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: blackcolor)),
                      ],
                    ),
                    SizedBox(height: 1.h,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(orderat,style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: create_acc_color),),
                            Text("21 july",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: blackcolor)),
                          ],
                        ),
                        Container(
                          // margin: EdgeInsets.symmetric(horizontal: 15.w),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2),
                              color: themecolor, boxShadow: [
                            BoxShadow(
                              offset: Offset(1, 1),
                              blurRadius: 4,
                              color: themecolor,
                            )
                          ]),
                          height: 5.h,
                          width: 28.w,
                          child: Text(
                            "Pending",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.w500, color: white),
                          ),
                        ),
                      ],
                    ),
                   // SizedBox(height: 2.h,),

                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.start,
                    //   crossAxisAlignment: CrossAxisAlignment.center,
                    //   children: [
                    //     Container(
                    //       width: 15.w,
                    //       height: 7.h,
                    //       child: CommonImageWidget(imageSourceType: ImageSourceType.cached_image, imageUrl: newOrders.elementAt(index).orderedItems?[0].product?.image.toString()??"",fit: BoxFit.fill,),
                    //     ),
                    //     SizedBox(width: 3.w,),
                    //     Column(
                    //       mainAxisAlignment: MainAxisAlignment.start,
                    //       crossAxisAlignment: CrossAxisAlignment.start,
                    //       children: [
                    //         Text(newOrders[index].orderedItems?[0].product?.name.toString()??"",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: blackcolor)),
                    //         SizedBox(
                    //           width: 70.w,
                    //             child: Text(newOrders[index].orderedItems?[0].product?.description.toString()??"",overflow: TextOverflow.ellipsis,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: emailhintcolor))),
                    //       ],
                    //     ),
                    //   ],
                    // ),
                    SizedBox(height: 2.h,),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
