import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:sizer/sizer.dart';
import '../constants/Appcolors.dart';
import '../constants/Stringconstants.dart';

AppBar App_bar({bool backbtn = false,List<Widget>? action,String title="",Color? bgcolor}){
  return AppBar(
    elevation: 0,
    backgroundColor: bgcolor??screenbgcolor,
    title: Text(title,style: TextStyle(color: primarycolor,fontWeight: FontWeight.w500,fontSize: 18),),
    centerTitle: true,
    actions: action,
    leading: backbtn?GestureDetector(
        onTap: (){
          Get.back();
        },
        child: Icon(Icons.arrow_back_rounded,color: primarycolor,)):SizedBox(),
  );
}


Widget common_button(String title,BuildContext context,Callback? click){
  return Container(
    height: MediaQuery.of(context).size.height/100*5.5,
    width: MediaQuery.of(context).size.width,
    child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(8.0),
            ), backgroundColor: themecolor,
            textStyle: TextStyle(fontWeight: FontWeight.bold)),
        // style: ButtonStyle(backgroundColor: MaterialStateProperty.all(themecolor),
        // ),
        onPressed: (){
          click!();
        }, child: Text(title,)),
  );
}

Widget text_field(BuildContext context,String title,TextEditingController controller,String hinttext,{bool number=false}){
  return Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,),
        SizedBox(
          height: 1.h,
        ),
        TextFormField(
          cursorColor: primarycolor,
          inputFormatters: [
            new LengthLimitingTextInputFormatter(35),
            // for mobile
          ],
          keyboardType: number?TextInputType.number:TextInputType.text,
          autofocus: false,
          textInputAction: TextInputAction.next,
          enableSuggestions: false,
          autocorrect: false,
          toolbarOptions: ToolbarOptions(
            cut: true,
            copy: true,
            selectAll: true,
            paste: true,
          ),
          // onChanged: (v) =>
          //     _formKey.currentState?.validate(),
          validator: (value) {
            String pattern =
                r'\S+@\S+\.\S+';
            RegExp regex = RegExp(pattern);
            if (value == null || value.isEmpty || !regex.hasMatch(value)) {
              return 'Please enter correct email';
            }
            return null;
          },
          controller: controller,
          decoration: InputDecoration(
              filled: true,
              fillColor:white,
              contentPadding: EdgeInsets.only(
                left: (MediaQuery
                    .of(context)
                    .size
                    .width / 100) * 3,),
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
              hintText: hinttext,
              hintStyle: TextStyle(
                  fontWeight: FontWeight.w300,
                  color: emailhintcolor,
                  fontSize: 14)),
        ),
      ],
    ),
  );
}


Widget appbar_with_search(TextEditingController controller,BuildContext context,bool homescreen,{String username=""}){
  return SliverAppBar(
    pinned: true,
    snap: true,
    floating: true,
    titleSpacing: 0,
    elevation: 0,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(30.0),
      ),
    ),
    backgroundColor: searchbgcolor,
    title:
    Container(
      margin: EdgeInsets.only(left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {

            },
            child: Text(
              welcome,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500,color: blackcolor),
            ),
          ),
          GestureDetector(
            onTap: () {

            },
            child: Text(
              "Hi, $username",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500,color: blackcolor),
            ),
          ),
        ],
      ),
    ),
    toolbarHeight: 6.h, // Set this height,
  );
}
Widget searchbar(TextEditingController controller,BuildContext context,Callback suffixcall) {
  return Container(
    width: double.infinity,
    decoration: BoxDecoration(
        color: searchbgcolor,
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10))),
    child: TextFormField(
      cursorColor: Colors.black,
      inputFormatters: [
        new LengthLimitingTextInputFormatter(35),
        // for mobile
      ],
      autofocus: false,
      textInputAction: TextInputAction.next,
      enableSuggestions: false,
      autocorrect: false,
      style: TextStyle(
          color: blackcolor, fontSize: 16, fontWeight: FontWeight.w400),
      toolbarOptions: ToolbarOptions(
        cut: true,
        copy: true,
        selectAll: true,
        paste: true,
      ),
      // onChanged: (v) =>
      //     _formKey.currentState?.validate(),
      validator: (value) {
        String pattern = r'\S+@\S+\.\S+';
        RegExp regex = RegExp(pattern);
        if (value == null || value.isEmpty || !regex.hasMatch(value)) {
          return 'Please enter search data!';
        }
        return null;
      },
      controller: controller,
      decoration: InputDecoration(
          filled: true,
          fillColor: searchbgcolor,
          contentPadding: EdgeInsets.only(
            left: (MediaQuery.of(context).size.width / 100) * 3,
          ),
          suffixIcon: GestureDetector(
            onTap: suffixcall,
            child: Icon(
              Icons.search,
              color: searchtext,
            ),
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(8.0),
              ),
              borderSide: BorderSide(color: searchtext)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              borderSide: BorderSide(color: searchtext)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              borderSide: BorderSide(color: searchtext)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              borderSide: BorderSide(color: searchtext)),
          disabledBorder: InputBorder.none,
          hintText: "Search apple...",
          hintStyle: TextStyle(
            fontWeight: FontWeight.w400,
            color: searchtext,
            fontSize: 15,
          )),
    ),
  );
}
