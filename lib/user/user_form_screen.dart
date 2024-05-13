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

  var carTypeController =  TextEditingController();

  var driverNoteController =  TextEditingController();

  var dateController =  TextEditingController();

  var timeController =  TextEditingController();

   DateTime? _selectedDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                                   CustomTextField(hintText: "Enter Name", controller: nameController),

                                   SizedBox(height: 20.0,),
                                   TextWidget(text: "Phone Number (Optional)", color: Colors.black, size: 14.0, isBold: true),
                                   SizedBox(height: 10.0,),
                                   CustomTextField(hintText: "Phone Number (Optional)", controller: phoneController),

                                   SizedBox(height: 20.0,),
                                   TextWidget(text: "Pick Up Location", color: Colors.black, size: 14.0, isBold: true),
                                   SizedBox(height: 10.0,),
                                   CustomTextField(hintText: "Pick Up Location", controller: pickUpController),

                                   SizedBox(height: 20.0,),
                                   TextWidget(text: "Drop Off Location", color: Colors.black, size: 14.0, isBold: true),
                                   SizedBox(height: 10.0,),
                                   CustomTextField(hintText: "Drop Off Location", controller: dropOffController),

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
                                               Container(
                                                 width: 200.0,
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
                                                     CustomTextField(
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
                                               Container(
                                                 width: 200.0,
                                                 padding: EdgeInsets.only(left: 5.0),
                                                 child: Column(
                                                   mainAxisAlignment: MainAxisAlignment.start,
                                                   crossAxisAlignment: CrossAxisAlignment.start,
                                                   children: [
                                                     SizedBox(height: 20.0,),
                                                     Text("Pickup Time",style: TextStyle(color: Colors.black),
                                                     ),
                                                     // child: TextWidget(text: "Pickup Time", color: Colors.black, size: 14.0, isBold: true)),
                                                     SizedBox(height: 10.0,),
                                                     CustomTextField(
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
                                   CustomTextField(hintText: "Car type", controller: carTypeController),

                                   SizedBox(height: 20.0,),
                                   TextWidget(text: "Note for driver", color: Colors.black, size: 14.0, isBold: true),
                                   SizedBox(height: 10.0,),
                                   CustomTextField(hintText: "Note for driver", controller: driverNoteController),


                                   SizedBox(height: 20.0,),
                                   Consumer<ValueProvider>(
                                     builder: (context,provider,child){
                                       return provider.isLoading == false ? ButtonWidget(text: "Submit Request", onClicked: (){
                                         provider.setLoading(true);
                                         Provider.of<DataProvider>(context,listen: false).uploadCustomerData(
                                             context: context,
                                             name: nameController.text.toString(),
                                             phone: phoneController.text.toString(),
                                             pickup: pickUpController.text.toString(),
                                             dropOff: dropOffController.text.toString(),
                                             bookStatus: provider.selectRadioValue == 0 ? "Book For Now" : "Book For Later",
                                             bookDate: dateController.text.toString(),
                                             bookTime: timeController.text.toString(),
                                             carType: carTypeController.text.toString(),
                                             driverNote: driverNoteController.text.toString()
                                         );
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
}


