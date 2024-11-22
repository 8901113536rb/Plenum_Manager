import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';

import '../constants/Appcolors.dart';

class OrderDeliveredScreen extends StatefulWidget {
  final String title;
  final String description;
  final String buttontxt;
  final VoidCallback? onTap;
   OrderDeliveredScreen({Key? key, required this.title,required this.description,required this.buttontxt,required this.onTap}) : super(key: key);

  @override
  State<OrderDeliveredScreen> createState() => _CommonbtnWidgetState();
}
class _CommonbtnWidgetState extends State<OrderDeliveredScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text( widget.title),
        backgroundColor: themecolor,
        automaticallyImplyLeading: false, // No back button
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.shopping_cart_outlined,
              color: themecolor,
              size: 80.sp,
            ),
            SizedBox(height: 3.h),
            Text(
              widget.title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 2.h),
            Text(
              widget.description,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 5.h),
            GestureDetector(
              onTap: (){
                widget.onTap!();
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 15.w),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: themecolor,
                ),
                height: 6.h,
                width: double.infinity,
                child: Text(
                  widget.buttontxt,
                  style: TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w500, color: white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

