import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;

  bool isPostFix;
  VoidCallback? press;
  var icons;
   CustomTextFormField(
      {Key? key, required this.hintText, required this.controller,this.isPostFix = false,this.icons = Icons.add,this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value){
       if(value!.isEmpty){
         return "Field is Required";
       }
       return null;
      },
      cursorColor: primaryColor,
      enableSuggestions: true,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.circle,color: primaryColor,size: 12,),
        suffixIcon: isPostFix==true ? InkWell(
            onTap: press,
            child: Icon(icons,color: primaryColor,size: 20,)) : null,
        hintText: hintText,
        contentPadding: EdgeInsets.only(top: 10, bottom: 10, left: 10),
        hintStyle: TextStyle(fontSize: 12),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: primaryColor),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: primaryColor, width: 2.0),
        ),

      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;

  bool isPostFix;
  VoidCallback? press;
  var icons;
  CustomTextField(
      {Key? key, required this.hintText, required this.controller,this.isPostFix = false,this.icons = Icons.add,this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      cursorColor: primaryColor,
      enableSuggestions: true,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.circle,color: primaryColor,size: 12,),
        suffixIcon: isPostFix==true ? InkWell(
            onTap: press,
            child: Icon(icons,color: primaryColor,size: 20,)) : null,
        hintText: hintText,
        contentPadding: EdgeInsets.only(top: 10, bottom: 10, left: 10),
        hintStyle: TextStyle(fontSize: 12),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: primaryColor),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: primaryColor, width: 2.0),
        ),

      ),
    );
  }
}
