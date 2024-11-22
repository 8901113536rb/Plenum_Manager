import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../constants/Appcolors.dart';
import '../../constants/Stringconstants.dart';
import '../../constants/Textstyles.dart';
import '../VendorController/vendorAllProductsController.dart';
import '../utils/CommonAppBarWidget.dart';
import '../utils/CommonImageWidget.dart';
import 'AddNewProductScreen.dart';

class Vendorallproductsui extends StatefulWidget {
  const Vendorallproductsui({super.key});

  @override
  State<Vendorallproductsui> createState() => _VendorallproductsuiState();
}

class _VendorallproductsuiState extends State<Vendorallproductsui> {
  vendorAllProductsController controller=Get.put(vendorAllProductsController());

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () async {
             Get.to(AddNewProductScreen());
            },
            child: Icon(Icons.add),
            backgroundColor: themecolor,
          ),
      appBar: const Commonappbarwidget(
        leftText: products,
        showBackArrow: true,
      ),
        body: productlistview(),
      );
  }
 Widget productlistview(){
    return ListView.builder(
        padding: EdgeInsets.only(bottom: 2.h),
        itemCount: 6,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            width: double.infinity,
            // height: 21.5.h,
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
              padding: EdgeInsets.only(left: 2.w,right: 2.w,top: 1.h,bottom: 1.h),
              child: Row(
                children: [
                  SizedBox(
                    width: 25.w,
                    height: 15.5.h,
                    child: CommonImageWidget(imageSourceType: ImageSourceType.asset, imageUrl: images_baseurl+"appledummy.png",fit: BoxFit.fill,),
                  ),
                  SizedBox(width: 3.w,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("ALBINO -| Tab",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600,color: blackcolor),),
                      SizedBox(height: 0.3.h,),
                      SizedBox(width:50.w,child: Text("descri hdhhd hhhdh  jdjdj jdjdjj jdjjdj dd dddption",maxLines: 2,style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: create_acc_color,overflow: TextOverflow.ellipsis))),
                      SizedBox(height: 1.h,),
                      // Text("categoryname",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: create_acc_color)),
                      SizedBox(height: 0.3.h,),
                      Text("$selling_price $currency ${"200"}",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w600,color: blackcolor)),
                      SizedBox(height: 1.h,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: (){
                              // removeproductDialog(context,controller.products[index].id.toString()??"");
                            },
                            child: Container(
                              // margin: EdgeInsets.symmetric(horizontal: 15.w),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(2),
                                  color: themecolor,),
                              height: 5.h,
                              width: 25.w,
                              child: Text(
                                remove,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.w500, color: white),
                              ),
                            ),
                          ),
                          SizedBox(width: 3.w,),
                          Container(
                            // margin: EdgeInsets.symmetric(horizontal: 15.w),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(2),
                                color: ordercmpt_color,),
                            height: 5.h,
                            width: 25.w,
                            child: Text(
                              edit,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.w500, color: white),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }
  void removeproductDialog(BuildContext context,String product_id) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          insetPadding: EdgeInsets.all(20),
          title: Text(remove_product),
          content: Text(do_you_want_remove_product),
          actions: <Widget>[
            TextButton(
              child: Text(Dismiss),
              onPressed: () {
                Get.back();
              },
            ),
            ElevatedButton(
              child: Text(
                yes_delete_product,
                style: Common_textstyles.checkoutTextStyle,
              ),
              onPressed: () {
              },
            ),
          ],
        );
      },
    );
  }
}
