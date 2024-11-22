import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:sizer/sizer.dart';

import '../../constants/Appcolors.dart';
import '../../constants/Stringconstants.dart';
import '../../constants/Textstyles.dart';
import '../../utils/Commonwidgets.dart';
import '../VendorController/MyEarningController.dart';

class Myearningscreen extends StatefulWidget {
  const Myearningscreen({super.key});

  @override
  State<Myearningscreen> createState() => _MyearningscreenState();
}

class _MyearningscreenState extends State<Myearningscreen> {
  Myearningcontroller controller=Get.put(Myearningcontroller());

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: white,
      appBar: App_bar(title: Earnings, backbtn: true),
      body: Obx((){
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 8.h,),
            circulargraph(controller.totalsale.value,controller.pendingsale.value,controller.completedsale.value),
            SizedBox(height: 3.h,),
            earningtaxView(controller.totalsale.value.toString(),controller.pendingsale.value.toString(),controller.completedsale.value.toString())
          ],
        );
      })
    );
  }
  Widget circulargraph(double totalsale,double pendingsale,double completedsale){
    Map<String, double> dataMap = {
      Total_Sale: totalsale,
      Pending_Sale: pendingsale,
      Completed_Sale: completedsale,
    };

    return Padding(
      padding:  EdgeInsets.only(left: 17.w),
      child: PieChart(
        dataMap: dataMap,
        animationDuration: Duration(milliseconds: 800),
        chartLegendSpacing: 10.w,
        chartRadius: MediaQuery.of(context).size.width / 4.2,
        colorList: controller.colorList,
        initialAngleInDegree: 0,
        chartType: ChartType.ring,
        ringStrokeWidth: 17.w,
        centerText: "",

        legendOptions:   LegendOptions(
          showLegendsInRow: false,
          legendPosition: LegendPosition.right,
          showLegends: true,
          legendShape: BoxShape.circle,
        ),
        chartValuesOptions: const ChartValuesOptions(
          showChartValueBackground: false,
          showChartValues: true,
          chartValueStyle: TextStyle(
            color: Colors.white
          ),
          showChartValuesInPercentage: true,
          showChartValuesOutside: false,
          decimalPlaces: 1,
        ),
      ),
    );
  }
  Widget earningtaxView(String totalsale,String pendingsale,String completedsale) {
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(Total_Sale,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: create_acc_color,
                            overflow: TextOverflow.ellipsis)),
                    Text("$currency ${removeDecimalIfWhole(totalsale.toString())}",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: blackcolor),
                    ),
                  ],
                ),
                SizedBox(
                  height: 0.6.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(Pending_Sale,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: create_acc_color,
                            overflow: TextOverflow.ellipsis)),
                    Text("$currency ${removeDecimalIfWhole(pendingsale.toString())}",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: blackcolor),
                    ),
                  ],
                ),
                SizedBox(
                  height: 0.6.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(Completed_Sale,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: create_acc_color,
                            overflow: TextOverflow.ellipsis)),
                    Text("$currency ${removeDecimalIfWhole(completedsale)}",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: blackcolor),
                    )
                  ],
                ),
                SizedBox(
                  height: 0.6.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(total_orders,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: create_acc_color,
                            overflow: TextOverflow.ellipsis)),
                    Text(controller.totalOrders.value.toString(),
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: blackcolor),
                    )
                  ],
                ),
                SizedBox(
                  height: 0.6.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(completed_orders,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: create_acc_color,
                            overflow: TextOverflow.ellipsis)),
                    Text(controller.pendingOrders.value.toString(),
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: blackcolor),
                    )
                  ],
                ),
                SizedBox(
                  height: 0.6.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(Pending_orders,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: create_acc_color,
                            overflow: TextOverflow.ellipsis)),
                    Text(controller.completedOrders.value.toString(),
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: blackcolor),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 3.h,
        ),

      ],
    );
  }
  String removeDecimalIfWhole(String value) {
    double doubleValue = double.parse(value);  // Convert string to double
    if (doubleValue == doubleValue.toInt()) {
      return doubleValue.toInt().toString();  // If whole number, return as integer string
    } else {
      return value;  // If not whole, return the original string
    }
  }
}
