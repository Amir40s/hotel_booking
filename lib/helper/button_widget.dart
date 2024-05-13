import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants.dart';


class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;
  var backgroundColor;
  final width,height;
  final loadingMesasge;
  var textColor,borderColor,isShadow;

  double radius;

   ButtonWidget({
    Key? key,
    required this.text,
    required this.onClicked,
    this.backgroundColor,
    required this.width,
   required this.height,
     this.radius = 10.0,
     this.textColor = Colors.white,
     this.borderColor = primaryColor,
     this.isShadow = true,
     this.loadingMesasge = "Loading.."
  }) : super(key: key);

  @override
  Widget build(BuildContext context) =>

      InkWell(
        onTap: onClicked,
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(radius),
              border: Border.all(color: borderColor,width: 1.0),
              color: backgroundColor!=null ? backgroundColor : primaryColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: isShadow ? 2 : 0,
                  blurRadius: isShadow ? 5 : 0,
                  offset: Offset( isShadow ? 0 : 0, isShadow ? 3 : 0), // changes position of shadow
                ),
              ]
          ),
          child: Center(
            child: Text(
              text,
              style:  TextStyle(fontSize: 15, color: textColor,fontWeight: FontWeight.w900),
            ),
          ),
        ),
      );
}