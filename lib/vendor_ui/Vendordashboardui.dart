import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../constants/Appcolors.dart';
import '../../constants/Networkconstants.dart';
import '../../constants/Stringconstants.dart';
import '../../constants/Textstyles.dart';
import '../../utils/CommonFunctions.dart';
import '../../utils/CustomizeDrawerScreen.dart';
import '../../utils/Sharedutils.dart';
import '../VendorController/VenderDashboardController.dart';
import 'VendorOrderDetailUi.dart';

class VendorDashBoardUi extends StatefulWidget {
  const VendorDashBoardUi({super.key});

  @override
  State<VendorDashBoardUi> createState() => _VendorDashBoardUiState();
}

class _VendorDashBoardUiState extends State<VendorDashBoardUi>
    with SingleTickerProviderStateMixin {
  VendorDashboardController controller = Get.put(VendorDashboardController());

  @override
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.tabController = TabController(length: 2, vsync: this);
    controller.tabController?.addListener(() {
      if (controller.tabController!.indexIsChanging) {
        print("Tab changed to index: ${controller.tabController?.index}");
      }
    });
  }

  @override
  void dispose() {
    controller.tabController
        ?.dispose(); // Dispose the controller when the widget is destroyed
    super.dispose();
  }

  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          key: controller.scaffoldKey,
          drawer: CustomizeDrawerScreen(),
          appBar: AppBar(
            centerTitle: false,
            automaticallyImplyLeading: false,
            titleSpacing: 0,
            backgroundColor: white,
            toolbarHeight: 6.h,
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(kToolbarHeight),
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  width: MediaQuery.of(context).size.width / 1.1,
                  margin: EdgeInsets.only(left: 6.w, right: 6.w),
                  child: TabBar(
                    controller: controller.tabController,
                    splashFactory: NoSplash.splashFactory,
                    labelPadding: const EdgeInsets.all(0),
                    labelColor: blackcolor,
                    indicatorColor: themecolor,
                    tabs: controller.myTabs,
                  ),
                ),
              ),
            ), // Set this height

            flexibleSpace: Container(
              color: white,
              margin: EdgeInsets.only(left: 2.w, right: 4.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.menu,
                      color: blackcolor,
                    ),
                    onPressed: () async {
                      print("tap me..");
                      controller.scaffoldKey.currentState?.openDrawer();
                    },
                  ),
                  SizedBox(
                    width: 0.5.w,
                  ),
                  profile_picture(),
                  SizedBox(
                    width: 3.w,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Rohit Bukkel",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "rohit.23@gmail.com",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          body: TabBarView(
            controller: controller.tabController,
            children: [
              newOrderview(),
              completedOrderview(),
            ],
          ),
        ));
  }

  Widget newOrderview() {
    return ListView.builder(
        padding: EdgeInsets.only(bottom: 2.h),
        itemCount: 6,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Get.to(Vendororderdetailui());
            },
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.only(left: 3.w, right: 3.w, top: 2.h),
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
                padding: EdgeInsets.only(left: 3.w, right: 3.w, top: 2.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          ordernumber,
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: create_acc_color),
                        ),
                        Text(billamount,
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: create_acc_color)),
                      ],
                    ),
                    SizedBox(
                      height: 0.4.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "346789098765",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: blackcolor),
                        ),
                        Text(currency + "4000",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: blackcolor)),
                      ],
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
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
                      ],
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                            Text("12 may 2000",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: blackcolor)),
                          ],
                        ),
                        Container(
                          // margin: EdgeInsets.symmetric(horizontal: 15.w),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2),
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
                          child: Text(
                            "Pending",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                color: white),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  Widget completedOrderview() {
    return ListView.builder(
        padding: EdgeInsets.only(bottom: 2.h),
        itemCount: 6,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Get.to(Vendororderdetailui());
            },
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.only(left: 3.w, right: 3.w, top: 2.h),
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
                padding: EdgeInsets.only(left: 3.w, right: 3.w, top: 2.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          ordernumber,
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: create_acc_color),
                        ),
                        Text(billamount,
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: create_acc_color)),
                      ],
                    ),
                    SizedBox(
                      height: 0.4.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "3456789876",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: blackcolor),
                        ),
                        Text(currency + "4000",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: blackcolor)),
                      ],
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
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
                        Text("Rohit",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: blackcolor)),
                      ],
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                            Text("34 may 2000",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: blackcolor)),
                          ],
                        ),
                        Container(
                          // margin: EdgeInsets.symmetric(horizontal: 15.w),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2),
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
                          child: Text(
                            "Completed",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                color: white),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    /*Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 15.w,
                          height: 7.h,
                          child: CommonImageWidget(imageSourceType: ImageSourceType.cached_image, imageUrl: completedOrders.elementAt(index).orderedItems?[0].product?.image.toString()??"",fit: BoxFit.fill,),
                        ),
                        SizedBox(width: 3.w,),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(completedOrders[index].orderedItems?[0].product?.name.toString()??"",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: blackcolor)),
                            SizedBox(
                                width: 70.w,
                                child: Text(completedOrders[index].orderedItems?[0].product?.description.toString()??"",overflow: TextOverflow.ellipsis,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: emailhintcolor))),
                          ],
                        ),
                      ],
                    ),*/
                    SizedBox(
                      height: 2.h,
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  Widget profile_picture() {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Obx(() {
          return CircleAvatar(
            radius: 20,
            backgroundImage: controller.vendor_image.isNotEmpty
                ? NetworkImage(vhImageBaseUrl + controller.vendor_image.value)
                : const AssetImage(
                    "assets/images/profilepic.png"), // Default avatar
          );
        }),
      ],
    );
  }

  Future<void> getuserdetails() async {
    controller.vendor_name.value = await SharedUtils().get_username() ?? "";
    controller.vendor_email.value = await SharedUtils().get_useremail() ?? "";
    controller.vendor_image.value = await SharedUtils().get_userimage() ?? "";
    setState(() {});
  }
}
