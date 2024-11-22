import 'dart:ui';

import 'package:get/get.dart';

import '../../constants/Appcolors.dart';
import '../../constants/Networkconstants.dart';
import '../../utils/CommonToast.dart';
import '../../utils/Progressdialog.dart';

class Myearningcontroller extends GetxController{

  // MyEarningModel? earningdata;
  final colorList = <Color>[
    ordercmpt_color,
    ordercncl_color,
    singupcolor
  ];
  RxInt completedOrders=0.obs;
  RxInt pendingOrders=0.obs;
  RxInt totalOrders=0.obs;

  var totalsale = 0.0.obs;
  var pendingsale = 0.0.obs;
  var completedsale = 0.0.obs;
  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    super.onInit();
    Future.microtask(() {
      // my_earningspapi();
    });
  }
}