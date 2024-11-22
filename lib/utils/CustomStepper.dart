import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../constants/Appcolors.dart';
import '../constants/Stringconstants.dart';
import 'CommonFunctions.dart';

class CustomStepper extends StatelessWidget {
  String? ordercreatedat;
  String? ordercompletedat;
  CustomStepper({Key? key,this.ordercreatedat,this.ordercompletedat}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              margin:  EdgeInsets.only(left: 3.w, right: 3.w),
              height: 2.h,
              width: 3.w,
              decoration: BoxDecoration(
                color:themecolor,
                shape: BoxShape.circle,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(ordercreated,style: TextStyle(fontWeight: FontWeight.bold)),
                Text(formatDayAndTime(ordercreatedat??"")),
              ],
            ),
          ],
        ),
        Container(
          padding: EdgeInsets.zero,
          margin: EdgeInsets.only(left: 4.5.w),
          height: 7.h,
          // padding:  EdgeInsets.symmetric( vertical: 5.h),
          decoration:  BoxDecoration(
              border: Border(
                  left: BorderSide(
                    color: themecolor,
                  ))
          ),
        ),
        Row(
          children: [
            Container(
              margin:  EdgeInsets.only(left: 3.w, right: 3.w),
              height: 2.h,
              width: 3.w,
              decoration: BoxDecoration(
                color:themecolor,
                shape: BoxShape.circle,),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(ordercompleted,style: TextStyle(fontWeight: FontWeight.bold)),
                Text(formatDayAndTime(ordercompletedat??"")),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
