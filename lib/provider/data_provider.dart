import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:hotelbooking/provider/value_provider.dart';
import 'package:hotelbooking/user/user_waiting_screen.dart';
import 'package:hotelbooking/utils/utils.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../admin/admin_dashbaord_screen.dart';
import '../constants.dart';
import 'package:http/http.dart' as http;

class DataProvider extends ChangeNotifier{

  int _newMessage = 0;
  int _pendingMessage = 0;


  String _username = "";
  String _password = "";
  String _message = "";
  String _driverName = "";
  String _vehicleNumber = "";
  String _date = "";
  String _time = "";

  get username => _username;
  get password  => _password;
  get message  => _message;
  get name  => _driverName;
  get number  => _vehicleNumber;
  get date  => _date;
  get time  => _time;
  get newMessage  => _newMessage;
  get pendingMessage  => _pendingMessage;


  Future<void> uploadCustomerData({required context, required name,
    required phone,required pickup,required dropOff,required bookStatus,
    required carType, required driverNote,required bookDate, required bookTime,required token,
    required room}) async {


    DateTime time = DateTime.now();
    DateTime date = DateTime.now();
    String dateFormat = DateFormat('dd-MMM-yyyy').format(date);
    String formattedTime = DateFormat('h:mm a').format(time);
    print(dateFormat);
    var id = firestore.collection("requests").doc().id.toString();
    try {
      await firestore.collection("requests").doc(id).set({
        key_name : name,
        key_phone : phone,
        key_dropOff : dropOff,
        key_pickup : pickup,
        key_driverNote : driverNote,
        key_bookStatus : bookStatus,
        "room" : room,
        "code" : "1",
        "bookDate" : bookDate,
        "bookTime" : bookTime,
        "carType" : carType,
        "timestamp" :  time.millisecondsSinceEpoch.toString(),
        "token" :  token.toString(),
        key_status : "pending",
        "time" : formattedTime.toString(),
        "date" : dateFormat.toString(),
        "id" : id,
        key_date : "${time.day}/${time.month}/${time.year}",
      }).whenComplete(() {
        Provider.of<ValueProvider>(context,listen: false).setLoading(false);

        Utils().sendMail(customerName: name, phoneNumber: phone, context: context
        ,pickUp: pickup,
          dropOff: dropOff, bookStatus: bookStatus, carType: carType, driverNotes: driverNote,
        );
        Get.to(UserWaitingScreen(id: id,));
        Get.snackbar("Request Submitted", "Thanks for your booking request",backgroundColor: primaryColor,colorText: Colors.white);
      });
      notifyListeners();
    } catch (e) {
      print("Error fetching count value: $e");
    }
    notifyListeners();
  }

  Future<void> fetchAdminLoginDetails({required context, required username,required password}) async {
    try {
      final value = await firestore.collection("admin").doc("admin").get();
      if (value.exists) {
        _username = value.get("username").toString();
        _password = value.get("password").toString();

        if(_username == username){
          if(_password == password){
            Provider.of<ValueProvider>(context,listen: false).setLoading(false);
            Get.to(AdminDashboardScreen());
          }else{
            Provider.of<ValueProvider>(context,listen: false).setLoading(false);
            Get.snackbar("Login Failed", "Wrong Password",backgroundColor: primaryColor,colorText: Colors.white);
          }
        }else{
          Provider.of<ValueProvider>(context,listen: false).setLoading(false);
          Get.snackbar("Login Failed", "Wrong username",backgroundColor: primaryColor,colorText: Colors.white);
        }

      } else {
        _message = "";
        _password = "";
      }
      notifyListeners();
    } catch (e) {
      print("Error fetching count value: $e");
    }
    notifyListeners();
  }

  Future<void> fetchMessage({required id}) async {
    try {
      final value = await firestore.collection("reply").doc(id).get();
      if (value.exists) {
        _message = value.get("message").toString();
        _driverName = value.get("name").toString();
        _vehicleNumber = value.get("number").toString();
        _date = value.get("date").toString();
        _time = value.get("time").toString();
      } else {
       _message = "please wait refresh after 5 minutes";
       _driverName = "";
       _vehicleNumber = "";
       _date = "";
       _time = "";
      }
      notifyListeners();
    } catch (e) {
      print("Error fetching count value: $e");
    }
    notifyListeners();
  }





  Future<void> fetchCountValue() async {
    try {
       await firestore.collection("requests")
          .where("code", isEqualTo: "1").get().then((value) {
            _newMessage = value.size;
      });

      notifyListeners();
    } catch (e) {
      print("Error fetching count value: $e");
    }
    notifyListeners();
  }

  Future<void> fetchCountValue2() async {
    try {
      await firestore.collection("requests")
          .where("code", isEqualTo: "2").get().then((value) {
        _pendingMessage = value.size;
      });

      notifyListeners();
    } catch (e) {
      print("Error fetching count value: $e");
    }
    notifyListeners();
  }


}