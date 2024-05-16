import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String text;
  final Color color;
  final double size;
  final bool isBold;

  TextAlign align;

   TextWidget({
    required this.text,
    required this.color,
    required this.size,
    required this.isBold,
    this.align = TextAlign.left
  });

  @override
  Widget build(BuildContext context) {
    return SelectableText(
      text,
      textAlign: align,
      style: TextStyle(
        color: color,
        fontSize:  size,
        fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
      ),
    );
  }
}