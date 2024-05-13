import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotelbooking/constants.dart';
import 'package:hotelbooking/helper/text_widget.dart';
import 'package:hotelbooking/provider/data_provider.dart';
import 'package:provider/provider.dart';
class UserWaitingScreen extends StatelessWidget {
  final String id;
  const UserWaitingScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        iconTheme: IconThemeData(color: Colors.white),
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
               height: 250.0,

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
                 crossAxisAlignment: CrossAxisAlignment.center,
                 children: [
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Column(
                         mainAxisAlignment: MainAxisAlignment.center,
                         crossAxisAlignment: CrossAxisAlignment.center,
                         children: [
                           Text(provider.name.toString(),style: TextStyle(color: Colors.black),),
                         ],
                       ),
                       Column(
                         mainAxisAlignment: MainAxisAlignment.start,
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Container(
                             width: 50.0,
                             height: 50.0,
                             child: CircleAvatar(
                               backgroundColor: primaryColor,
                               backgroundImage: AssetImage("assets/images/user.png",),
                             ),
                           ),
                           SizedBox(width: 10.0,),
                           Text(provider.name.toString()),
                         ],
                       )
                     ],
                   ),
                   SizedBox(height: 10.0,),
                   Text(provider.number.toString()),
                   SizedBox(height: 10.0,),
                   Text(provider.message.toString()),
                   SizedBox(height: 20.0,),
                   InkWell(
                       onTap: (){
                         provider.fetchMessage(id: id);
                       },
                       child: Text("Refresh")),
                 ],
               ),
             );
           },
          ),
          
          
          

          Image.asset("assets/images/image.webp",width: 400.0,height: 300.0,),

          Center(child: TextWidget(text: "Please wait few minutes for booking approval", color: primaryColor, size: 18.0, isBold: false))

        ],
      ),
    );
  }
}
