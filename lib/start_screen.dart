import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:hotelbooking/constants.dart';
import 'package:hotelbooking/helper/text_widget.dart';
import 'package:hotelbooking/user/user_form_screen.dart';
class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 3), () {

      // for user_form_screen
      Get.offAll(UserFormScreen());

    });
    return Scaffold(
      backgroundColor: primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          Center(child: TextWidget(text: "Hotel Booking", color: Colors.white, size: 18.0, isBold: true))

        ],
      ),
    );
  }
}
