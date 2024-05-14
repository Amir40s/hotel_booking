import 'package:flutter/material.dart';

import '../constants.dart';
class CustomProgressBar extends StatelessWidget {
  final double  width,height, progress;
  const CustomProgressBar({super.key, required this.width, required this.height, required this.progress,});

  @override
  Widget build(BuildContext context) {
    return Container(
    width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: [
          Container(
            width: 50,
            height: height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
