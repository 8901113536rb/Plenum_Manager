import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/Stringconstants.dart';

class VendorDashboardController extends GetxController{
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  TabController? tabController;

  RxString vendor_name="".obs;
  RxString vendor_email="".obs;
  RxString vendor_image="".obs;
  final List<Tab> myTabs = <Tab>[
    const Tab(text: neworders),
    const Tab(text: completedorders),
  ];
  RxInt selectedTabIndex = 0.obs;
}