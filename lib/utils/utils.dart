import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hotelbooking/constants.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';
import 'package:provider/provider.dart';

import '../provider/value_provider.dart';

class Utils{
  // Send Mail function
  void sendMail({
    required String customerName,
    required String phoneNumber,
    required String pickUp,
    required String dropOff,
    required String bookStatus,
    required String carType,
    required String driverNotes,
    required BuildContext context,
    String request = "",
  }) async {
    // change your email here
    print("Enter Functon");
    String username = 'hotelbooking740@gmail.com';
    // change your password here
    String password = "zwdc oglc ghzq yiri";
    final smtpServer = gmail(username, password);
    final message = Message()
      ..from = Address(username, 'Hotel Booking')
      ..recipients.add('rehmanamjid1@gmail.com')
      ..subject = 'New Customer Booking Request'
      ..text = "Y0yrh sh sh sh sh";

    try {
      // final sendReport = await send(message, smtpServer);
      // print('Message sent: ' + sendReport.toString());
     await send(message, smtpServer);
      print("run try");
      Get.snackbar("Email Send", "Email sent successfully");
      // if(!context.mounted) return;
      // Provider.of<ValueProvider>(context,listen: false).setLoading(false);
    } on MailerException catch (e)  {
      if (kDebugMode) {
        print('Message not sent.');
        for (var p in e.problems) {
          print('Problem: ${p.code}: ${p.msg}');
        }
      }
    }
  }
}