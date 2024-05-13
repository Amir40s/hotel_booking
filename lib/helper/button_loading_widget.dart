import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants.dart';


class ButtonLoadingWidget extends StatelessWidget {
  var backgroundColor;
  final width,height;
  final loadingMesasge;
  var textColor,borderColor,isShadow;

  double radius;

  ButtonLoadingWidget({
    Key? key,
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
      Container(
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
          child:   Text(
            '$loadingMesasge, please wait',
            style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold),
          ),
        ),
      );
}