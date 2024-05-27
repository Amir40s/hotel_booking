import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotelbooking/constants.dart';
import 'package:hotelbooking/helper/button_loading_widget.dart';
import 'package:hotelbooking/helper/button_widget.dart';
import 'package:hotelbooking/helper/custom_textfield.dart';
import 'package:hotelbooking/helper/text_widget.dart';
import 'package:hotelbooking/provider/data_provider.dart';
import 'package:hotelbooking/provider/value_provider.dart';
import 'package:hotelbooking/utils/notification_widget.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';
import 'package:provider/provider.dart';

import '../responsive.dart';
import '../utils/utils.dart';
class UserFormScreen extends StatefulWidget {
   UserFormScreen({super.key});

  @override
  State<UserFormScreen> createState() => _UserFormScreenState();
}

class _UserFormScreenState extends State<UserFormScreen> {
  var nameController =  TextEditingController();

  var phoneController =  TextEditingController();

  var pickUpController =  TextEditingController();

  var dropOffController =  TextEditingController();


  var driverNoteController =  TextEditingController();

  var dateController =  TextEditingController();

  var timeController =  TextEditingController();
  var roomController =  TextEditingController();

   DateTime? _selectedDate;

   final _key = GlobalKey<FormState>();

   String? _token;
   Stream<String>? _tokenStream;


   notificationFunctions() async{
   await getPermissionNotification();

   await pushNotificationMessageListner();

   await FirebaseMessaging.instance.getToken().then(setToken);
   _tokenStream =  FirebaseMessaging.instance.onTokenRefresh;
   _tokenStream!.listen(setToken);

   }


  var  carType = ['Choose Car Type','Sedan (1-4 passengers)','MAXI TAXI (1-11 passengers)','Station Vegan Maxi (1-5 passengers)'];
   String? selectedCarType;

  _UserFormScreenState(){
     selectedCarType = carType[0];
  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: Form(
        key: _key,
          child: Row(
            children: [

              Expanded(
                flex: 4,
                child: Container(
                  width: Get.width,
                  height: Get.height,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [

                        Container(
                          width: Get.width,
                          padding: EdgeInsets.all(20.0),
                          color: primaryColor,
                          // child: TextWidget(text: "HOTEL BOOKING",size: 18.0,color: Colors.white, isBold: true,),
                          child: Center(
                            child: Text("HOTEL BOOKING",style: GoogleFonts.openSans(
                                fontSize: 22,
                                fontWeight: FontWeight.w700,
                                color: Colors.black

                            ),),
                          ),
                        ),

                       Padding(
                         padding: const EdgeInsets.all(20.0),
                         child: Column(
                           mainAxisAlignment: MainAxisAlignment.start,
                           crossAxisAlignment: CrossAxisAlignment.center,
                           children: [
                             SizedBox(height: 20.0,),
                             TextWidget(text: "Coporate Booking", color: Colors.black, size: 20.0, isBold: true),


                             SizedBox(height: 10.0,),
                             TextWidget(text: "Please fill your correct data for instant booking", color: Colors.black, size: 16.0, isBold: false),
                             SizedBox(height: 20.0,),
                             Container(child:
                             Container(
                                 width: 400.0,
                                 child: Column(
                                   mainAxisAlignment: MainAxisAlignment.start,
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   children: [
                                     SizedBox(height: 20.0,),
                                     TextWidget(text: "Name", color: Colors.black, size: 14.0, isBold: true),
                                     SizedBox(height: 10.0,),
                                     CustomTextFormField(hintText: "Enter Name", controller: nameController),

                                     SizedBox(height: 20.0,),
                                     TextWidget(text: "Phone Number (Optional)", color: Colors.black, size: 14.0, isBold: true),
                                     SizedBox(height: 10.0,),
                                     CustomTextField(hintText: "Phone Number (Optional)", controller: phoneController),

                                     SizedBox(height: 20.0,),
                                     TextWidget(text: "Room No", color: Colors.black, size: 14.0, isBold: true),
                                     SizedBox(height: 10.0,),
                                     CustomTextFormField(hintText: "Room No", controller: roomController),

                                     SizedBox(height: 20.0,),
                                     TextWidget(text: "Pick Up Location", color: Colors.black, size: 14.0, isBold: true),
                                     SizedBox(height: 10.0,),
                                     CustomTextFormField(hintText: "Pick Up Location", controller: pickUpController),

                                     SizedBox(height: 20.0,),
                                     TextWidget(text: "Drop Off Location", color: Colors.black, size: 14.0, isBold: true),
                                     SizedBox(height: 10.0,),
                                     CustomTextFormField(hintText: "Drop Off Location", controller: dropOffController),

                                     SizedBox(height: 20.0,),
                                     Consumer<ValueProvider>(
                                       builder: (context,provider,child){
                                         return Column(
                                           children: [
                                             Row(
                                               mainAxisAlignment: MainAxisAlignment.center,
                                               children: [
                                                 Radio(value: 0, groupValue: provider.selectRadioValue,
                                                     onChanged: (value){
                                                       provider.setRadio(value!);
                                                     }),
                                                 TextWidget(text: "Book For Now", color: Colors.black, size: 14.0, isBold: true),

                                                 SizedBox(width: 20.0,),

                                                 Radio(value: 1, groupValue: provider.selectRadioValue,
                                                     onChanged: (value){
                                                       provider.setRadio(value!);
                                                     }),
                                                 TextWidget(text: "Book For Later", color: Colors.black, size: 14.0, isBold: true)
                                               ],
                                             ),

                                             SizedBox(height: 20.0,),
                                             provider.selectRadioValue == 1 ?
                                             Row(
                                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                               children: [
                                                 Expanded(
                                                   child: Container(
                                                     width: Get.width * 0.150,
                                                     padding: EdgeInsets.only(right: 5.0),
                                                     child: Column(
                                                       mainAxisAlignment: MainAxisAlignment.start,
                                                       crossAxisAlignment: CrossAxisAlignment.start,
                                                       children: [
                                                         SizedBox(height: 20.0,),
                                                         Text("Pickup Date",style: TextStyle(color: Colors.black),
                                                         ),
                                                         // child: TextWidget(text: "Pickup Date", color: Colors.black, size: 14.0, isBold: true)),
                                                         SizedBox(height: 10.0,),
                                                         CustomTextFormField(
                                                             isPostFix: true,
                                                             press: (){
                                                               _selectDate(context);
                                                             },
                                                             icons : Icons.calendar_month_sharp,
                                                             hintText: provider.selectedDate == null ?
                                                         "Select Date" :
                                                         dateController.text = "${provider.selectedDate.day}/${provider.selectedDate.month}/${provider.selectedDate.year}",
                                                             controller: dateController),
                                                       ],
                                                     ),
                                                   ),
                                                 ),
                                                 Expanded(
                                                   child: Container(
                                                     width: Get.width * 0.150,
                                                     padding: EdgeInsets.only(left: 5.0,right: 5.0),
                                                     child: Column(
                                                       mainAxisAlignment: MainAxisAlignment.start,
                                                       crossAxisAlignment: CrossAxisAlignment.start,
                                                       children: [
                                                         SizedBox(height: 20.0,),
                                                         Text("Pickup Time",style: TextStyle(color: Colors.black),
                                                         ),
                                                         // child: TextWidget(text: "Pickup Time", color: Colors.black, size: 14.0, isBold: true)),
                                                         SizedBox(height: 10.0,),
                                                         CustomTextFormField(
                                                             isPostFix: true,
                                                             press: (){
                                                               _openTimePicker(context);
                                                             },
                                                             icons : Icons.access_time_outlined,
                                                             hintText: provider.selectedTime == null ?
                                                         "Select Time" :
                                                         timeController.text = "${provider.selectedTime.hour}:${provider.selectedTime.minute}", controller: timeController),
                                                       ],
                                                     ),
                                                   ),
                                                 )
                                               ],
                                             ) : SizedBox(),
                                           ],
                                         );
                                       },
                                     ),





                                     SizedBox(height: 20.0,),
                                     TextWidget(text: "Car type", color: Colors.black, size: 14.0, isBold: true),
                                     SizedBox(height: 10.0,),
                                     Container(
                                       decoration: BoxDecoration(
                                           border: Border.all(width: 1, color: primaryColor),
                                           borderRadius: BorderRadius.circular(5)),
                                       child: Padding(
                                         padding: const EdgeInsets.only(
                                             left: 10.0, right: 5.0, top: 5.0, bottom: 5.0),
                                         child: DropdownButtonFormField(
                                           value: selectedCarType,
                                           items: carType
                                               .map((e) => DropdownMenuItem(
                                             child: TextWidget(
                                               text: e,
                                               color: Colors.black,
                                               size: 12.0,
                                               isBold: false,
                                             ),
                                             value: e,
                                           ))
                                               .toList(),
                                           onChanged: (value) {
                                             setState(() {
                                               selectedCarType = value as String;
                                             });
                                             // selectedGroup = value as String;
                                           },
                                           icon: const Icon(
                                             Icons.arrow_drop_down_circle,
                                             color: hoverColor,
                                           ),
                                           dropdownColor: Colors.white,
                                           decoration: const InputDecoration(border: InputBorder.none),
                                         ),
                                       ),
                                     ),



                                     SizedBox(height: 20.0,),
                                     TextWidget(text: "Note for driver", color: Colors.black, size: 14.0, isBold: true),
                                     SizedBox(height: 10.0,),
                                     CustomTextFormField(hintText: "Note for driver", controller: driverNoteController),


                                     SizedBox(height: 20.0,),
                                     Consumer<ValueProvider>(
                                       builder: (context,provider,child){
                                      //   notificationFunctions();
                                         return provider.isLoading == false ? ButtonWidget(text: "Submit Request", onClicked: (){
                                           sendMail();
                                          if(_key.currentState!.validate()){

                                            if(selectedCarType == "Choose Car Type"){
                                              Get.snackbar("Cart Type Required", "Please Choose Car Type");
                                              return;
                                            }else{
                                              provider.setLoading(true);
                                              Provider.of<DataProvider>(context,listen: false).uploadCustomerData(
                                                  context: context,
                                                  name: nameController.text.toString(),
                                                  room: roomController.text.toString(),
                                                  phone: phoneController.text.toString(),
                                                  pickup: pickUpController.text.toString(),
                                                  dropOff: dropOffController.text.toString(),
                                                  bookStatus: provider.selectRadioValue == 0 ? "Book For Now" : "Book For Later",
                                                  bookDate: dateController.text.toString(),
                                                  bookTime: timeController.text.toString(),
                                                  carType: selectedCarType.toString(),
                                                  driverNote: driverNoteController.text.toString(),
                                                  token: _token.toString()
                                              );
                                            }

                                            // sendMail();

                                          }

                                           // Utils().sendMail(customerName: "name", phoneNumber: "phone", context: context
                                           //   ,pickUp: "pickup",
                                           //   dropOff: "dropOff", bookStatus: "bookStatus", carType: "carType", driverNotes: "driverNote",
                                           //
                                           // );
                                         },
                                             width: Get.width, height: 50.0) : ButtonLoadingWidget(width: Get.width, height: 50.0);
                                       },

                                     ),
                                     SizedBox(height: 20.0,)
                                   ],
                                 )))
                           ],
                         ),
                       )

                      ],
                    ),
                  ),
                ),
              ),

             if(Responsive.isDesktop(context))
              Expanded(
                flex: 9,
                child: Container(
                  width: Get.width,
                  height: Get.height,
                  child: Image.asset("assets/images/back.jpg",fit: BoxFit.cover,),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

   Future<void> _selectDate(context) async {
    print("RUn");
     final DateTime? picked = await showDatePicker(
       context: context,
       initialDate: DateTime.now(),
       firstDate: DateTime(1990),
       lastDate: DateTime(2025),
     );
     if (picked != null && picked != _selectedDate) {
      Provider.of<ValueProvider>(context,listen: false).setSelectedDate(picked);
     }
   }

  Future<void> _openTimePicker(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (picked != null) {
      Provider.of<ValueProvider>(context,listen: false).setSelectedTime(picked);
      print('Selected Time: ${picked.hour}:${picked.minute}');
    }
  }

   getPermissionNotification() async{

     FirebaseMessaging messaging = FirebaseMessaging.instance;

     await messaging.requestPermission(
       alert: true,
       announcement: true,
       badge: true,
       carPlay: false,
       criticalAlert: false,
       provisional: false,
       sound: true,
     );
  }

  pushNotificationMessageListner() async{
     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
       if(message.notification!=null){
         showDialog(context: context, builder: (BuildContext context){
              return NotificationDialogWidget(
                  title: message.notification!.title,
                  body: message.notification!.body
              );
         });
       }
     });
  }

  setToken(String? token){
     
     print("\n\n FCM USER REGISTRATION TOKEN: " + token.toString());
     
    setState(() {
      _token = token;
    });
  }

  void sendMail() async{
    print("Enter Functon");
    log("sendMail");
    String username = 'hotelbooking740@gmail.com';
    // change your password here
    String password = "leip jmux eime fyqd";
    final smtpServer = gmail(username, password);
    final message = Message()
      ..from = Address(username, 'Hotel Booking')
      ..recipients.add('hotelbooking740@gmail.com')
      ..subject = 'New Customer Booking Request'
      ..text = "text";

    try {
      // final sendReport = await send(message, smtpServer);
      // print('Message sent: ' + sendReport.toString());
      await send(message, smtpServer);
      // var connection = PersistentConnection(smtpServer);
      // await connection.send(message);
      // await connection.send(message);
      // await connection.close();

      //await send(message, smtpServer);
      print("run try");
      Get.snackbar("Email Send", "Email sent successfully");
      if(!context.mounted) return;
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


