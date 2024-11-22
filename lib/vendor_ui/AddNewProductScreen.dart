
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import '../../constants/Appcolors.dart';
import '../../utils/CommonValidations.dart';
import '../VendorController/ProductDetailController.dart';
import '../constants/Appsizes.dart';
import '../constants/Stringconstants.dart';
import '../utils/Commonformfield.dart';

class AddNewProductScreen extends StatefulWidget {
  const AddNewProductScreen({super.key});

  @override
  State<AddNewProductScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<AddNewProductScreen> {
  ProductDetailController controller=Get.put(ProductDetailController());
  List<List<TextEditingController>> _controllers = [];
  List<ExpandablePanel> _panels = [];
  final formKey = GlobalKey<FormState>();

  // List<ModelVariantValues> listVariant = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Obx(()=> Scaffold(
      body: body(),
      bottomNavigationBar: Container(
          padding: EdgeInsets.all(10),
          child: GestureDetector(
            onTap: (){
            },
            child: Container(
              alignment: Alignment.center,
              width: 100.w,
              height: 5.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: themecolor,
              ),
              child:  Text("Add Product",style: TextStyle(color: white),),
            ),
          )
      ),
    ));
  }
  Widget body(){
    return Container(
     height: 100.h,
      child: SingleChildScrollView(
        child: Column(
          children: [
            imageview(),
            SizedBox(
              height: 2.h,
            ),
           Column(
             children: [
               product_inputs(),
             ],
           )
          ],
        ),
      ),
    );
  }
  Widget imageview(){
    return Stack(
      children: [
      Stack(
        alignment: Alignment.center,
        children: [
          Container(
            color: Colors.grey.shade300,
          width: double.infinity,
          height: 28.h,
          child: controller.image.value != null
              ? Image.file(controller.image.value!,fit: BoxFit.cover,)
              : Container(),
              ),
          GestureDetector(
              onTap: (){
                controller.showPicker(context);
              },
              child:
              CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.camera_alt,size: 25,color: Colors.black,),
              ),
              )
        ],
      ),
         Container(
          margin: EdgeInsets.only(left: leftside_margin,right: rightside_margin,top: 4.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 2.h,
              ),
              InkWell(
                  onTap: (){
                    Get.back();
                  },
                  child: CircleAvatar(
                      backgroundColor: themecolor.withOpacity(0.3),
                      radius: 16,
                      child: Icon(Icons.arrow_back_rounded,color: themecolor,size: 18,))),
              SizedBox(height: 2.h,)
            ],
          ),
        ),
      ],
    );
  }


  Widget product_inputs(){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: leftside_margin,),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Commonformfield(hinttext: enter_product_name, fieldcontroller: controller.productname_controller,title: product_name,validator: (value){
              return  txtValidator(value,"Please select product name");
            }),
            SizedBox(
              height: 2.h,
            ),
            Commonformfield(hinttext: enter_description, fieldcontroller: controller.productdesc_controller,title: product_description,validator: (value){
              return  txtValidator(value,"Please select description name");
            }),
            SizedBox(
              height: 2.h,
            ),
            Text(select_category,style: TextStyle(fontSize: 14,fontWeight: FontWeight.normal),),
            SizedBox(
              height: 1.h,
            ),
            DropdownButtonFormField2<String>(
              isExpanded: true,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(
                  left: (MediaQuery
                      .of(context)
                      .size
                      .width / 100) * 0,),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0),),
                    borderSide: BorderSide(color: emailinputbordercolor)
                ),
                border: OutlineInputBorder(
                    borderRadius:
                    BorderRadius.all(
                        Radius.circular(8.0)),
                    borderSide:
                    BorderSide(color: emailinputbordercolor)),
                enabledBorder: OutlineInputBorder(
                    borderRadius:
                    BorderRadius.all(
                        Radius.circular(8.0)),
                    borderSide:
                    BorderSide(
                        color: emailinputbordercolor
                    )),
                errorBorder:  OutlineInputBorder(
                    borderRadius:
                    BorderRadius.all(
                        Radius.circular(8.0)),
                    borderSide:
                    BorderSide(
                        color: emailinputbordercolor)),
                disabledBorder: InputBorder.none,
                // Add more decoration..
              ),
              hint: Text(
                choose_category,
                style: TextStyle(fontSize: 14),
              ),
              items: controller.categories
                  .map((category) => DropdownMenuItem<String>(
                value: category.toString(),
                child: Text(
                  category.toString(),
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                ),
              ))
                  .toList(),
              validator: (value) {
                if (value == null) {
                  return please_select_category;
                }
                return null;
              },
              onChanged: (value) {
                controller.selectedcategory!.value = value.toString();
                print("Category id:-"+ controller.selectedcategory!.value.toString());
              },
              onSaved: (value) {
                controller.selectedcategory!.value = value.toString();
                print("Category id:-"+ controller.selectedcategory!.value.toString());
              },
              buttonStyleData: const ButtonStyleData(
                padding: EdgeInsets.only(right: 8),
              ),
              iconStyleData: const IconStyleData(
                icon: Icon(
                  Icons.arrow_drop_down,
                  color: Colors.black45,
                ),
                iconSize: 24,
              ),
              dropdownStyleData: DropdownStyleData(
                decoration: BoxDecoration(
                  border: Border.all(color: emailinputbordercolor),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              menuItemStyleData: const MenuItemStyleData(
                padding: EdgeInsets.symmetric(horizontal: 16),
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
          ],
        ),
      ),
    );
  }


  Widget _buildRow(TextEditingController controller, String label) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: TextFormField(
                cursorColor: themecolor,
                controller: controller,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    filled: true,
                    fillColor:white,
                    // prefixIcon: prefix,
                    contentPadding: EdgeInsets.only(
                      left: (MediaQuery
                          .of(context)
                          .size
                          .width / 100) * 0.5,),
                    disabledBorder: InputBorder.none,
                    hintText: box_type_hint_text,
                    hintStyle: TextStyle(
                        fontWeight: FontWeight.w300,
                        color: emailhintcolor,
                        fontSize: 14)),

              ),
            ),
            SizedBox(width: 7.w,),
            Text(label,style: TextStyle(fontSize: 14,fontWeight: FontWeight.normal),),
          ],
        ),
        Divider(color: blackcolor,),
      ],
    );
  }

}
