import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotelbooking/constants.dart';
import 'package:hotelbooking/helper/button_widget.dart';
import 'package:hotelbooking/helper/text_widget.dart';
import 'package:hotelbooking/provider/data_provider.dart';
import 'package:hotelbooking/responsive.dart';
import 'package:hotelbooking/utils/custom_progress_bar.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
class UserWaitingScreen extends StatelessWidget {
  final String id;
  const UserWaitingScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        iconTheme: IconThemeData(color: Colors.white,),
        title: TextWidget(text: "Booking Approval Waiting",size: 18.0,color: Colors.white, isBold: false,),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 20.0,),
          Consumer<DataProvider>(
           builder: (context,provider,child){
             return Container(
               width: 400.0,

               padding: EdgeInsets.all(20.0),
               decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(10.0),
                   color: Colors.white,
                   boxShadow: [
                     BoxShadow(
                       color: Colors.black12,
                       blurRadius: 10.0,
                       spreadRadius: 5.0,
                       offset: Offset(0.0, 3.0), // changes position of shadow
                     ),
                   ]
               ),
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.start,
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     crossAxisAlignment: CrossAxisAlignment.center,
                     children: [
                       Text("Driver Name: \n${provider.name.toString()}",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20.0),),
                       Column(
                         mainAxisAlignment: MainAxisAlignment.center,
                         crossAxisAlignment: CrossAxisAlignment.center,
                         children: [
                           Container(
                             width: 50.0,
                             height: 50.0,
                             child: CircleAvatar(
                               backgroundColor: primaryColor,
                               backgroundImage: AssetImage("assets/images/user.png",),
                             ),
                           ),
                           SizedBox(height: 10.0,),
                           Container(
                             padding: EdgeInsets.all(5.0),
                               decoration: BoxDecoration(
                                 color: Colors.white,
                                 boxShadow: [
                                   BoxShadow(
                                     color: Colors.black12,
                                     blurRadius: 10.0,
                                     spreadRadius: 5.0,
                                     offset: Offset(0.0, 3.0), // changes position of shadow
                                   ),
                                 ]
                               ),
                               child: Text(provider.number.toString())),
                           Padding(
                             padding: const EdgeInsets.all(5.0),
                             child: TextWidget(text: "Taxi No", color: primaryColor, size: 16.0, isBold: true),
                           )
                         ],
                       )
                     ],
                   ),
                   SizedBox(height: 10.0,),
                   Text("Booked Date: ${provider.date.toString()}"),
                   SizedBox(height: 10.0,),
                   Text("Booked Time: ${provider.time}"),
                   SizedBox(height: 10.0,),
                   Text(provider.message !=null || provider.message == "" ? provider.message : "please wait your request is in que"),
                   SizedBox(height: 20.0,),
                   CustomProgressBar(width: Get.width, height: 20, progress: 90),
                   SizedBox(height: 10.0,),
                   TextWidget(text: "Est Arrival Time", color: Colors.black, size: 15.0, isBold: false),
                   SizedBox(height: 20.0,),


                   ButtonWidget(text: "Refresh", onClicked: (){
                     provider.fetchMessage(id: id);
                   }, width: Responsive.isMobile(context) ? 100.0 : Get.width * 0.090, height: 40.0)
                 ],
               ),
             );
           },
          ),

          SizedBox(height: 30.0,),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(child:
            DefaultTextStyle(
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 22.0,
                color: primaryColor,
                fontWeight: FontWeight.bold,
              ),
              child: AnimatedTextKit(
                repeatForever: true,
                animatedTexts: [
                  ScaleAnimatedText('Please wait few minutes for booking approval'),
                ],
                onTap: () {
                  print("Tap Event");
                },
              ),
            )
            ),
          ),




        ],
      ),
    );
  }
}
