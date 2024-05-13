import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

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
      onSubmitted: (String value) {
        debugPrint(value);
      },
    );
  }
}

class CustomizeTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  bool isPostFix;
   CustomizeTextField(
      {Key? key, required this.hintText, required this.controller,this.isPostFix = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      cursorColor: hoverColor,
      decoration: InputDecoration(
        hintText: hintText,
        suffixIcon: isPostFix ? Icon(Icons.calendar_month_sharp) : null,
        contentPadding: EdgeInsets.all(21),
        hintStyle: TextStyle(fontSize: 12),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 2.0),
        ),
      ),
      onSubmitted: (String value) {
        debugPrint(value);
      },
    );
  }
}
