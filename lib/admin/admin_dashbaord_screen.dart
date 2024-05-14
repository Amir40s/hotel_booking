import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotelbooking/helper/button_loading_widget.dart';
import 'package:hotelbooking/helper/button_widget.dart';
import 'package:hotelbooking/helper/custom_textfield.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import '../helper/text_widget.dart';
import '../provider/value_provider.dart';
class AdminDashboardScreen extends StatelessWidget {
   AdminDashboardScreen({super.key});

  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StreamBuilder(
          stream: firestore.collection("requests")
              .orderBy('timestamp',descending: false)
              .snapshots(),
          builder: (context, snapshot){
            return (snapshot.connectionState == ConnectionState.waiting) ?
            const Center(
              child: CircularProgressIndicator(color: hoverColor,),
            ) : snapshot.data!.docs.isEmpty ?
            Container(
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: secondaryColor,
              ),
              child: Center(child: Text("No Requests Found",style: TextStyle(
                  fontSize: 18.0,fontWeight: FontWeight.bold
              ),)
                ,),
            ) :
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10)
              ),
              child: PaginatedDataTable(
                  header: TextWidget(text: "Total Requests: ${snapshot.data!.docs.length}",size: 20,color: Colors.black, isBold: true,),
                  headingRowColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                      return primaryColor; // Default color
                    },
                  ),
                  columnSpacing: 20.0,
                  arrowHeadColor: Colors.black,
                  rowsPerPage: snapshot.data!.docs.length >10 ? 10 : snapshot.data!.docs.length,
                  columns: const [
                    DataColumn(label: TextWidget(text: "Name", color: Colors.black,
                      size: 14.0, isBold: true,),),
                    DataColumn(label: TextWidget(text: "Phone Number", color:  Colors.black,
                      size: 14.0, isBold: true,),),
                    DataColumn(label: TextWidget(text: "Pick Up", color:  Colors.black,
                      size: 14.0, isBold: true,),),
                    DataColumn(label: TextWidget(text: "Drop Off", color:  Colors.black,
                      size: 14.0, isBold: true,),),
                    DataColumn(label: TextWidget(text: "Book for now /later", color:  Colors.black,
                      size: 14.0, isBold: true,),),
                    DataColumn(label: TextWidget(text: "Book Date / Time", color:  Colors.black,
                      size: 14.0, isBold: true,),),
                    DataColumn(label: TextWidget(text: "Car Type", color:  Colors.black,
                      size: 14.0, isBold: true,),),
                    DataColumn(label: TextWidget(text: "Driver Notes", color:  Colors.black,
                      size: 14.0, isBold: true,),),
                    DataColumn(label: TextWidget(text: "Reply", color:  Colors.black,
                      size: 14.0, isBold: true,),),
                    DataColumn(label: TextWidget(text: "Action", color:  Colors.black,
                      size: 14.0, isBold: true,),),

                  ],
                  source: DataTableSourceImpl(
                      category: snapshot.data!.docs,
                      length: snapshot.data!.docs.length,
                      context: context
                  )),
            );
          },
        ),
      ],
    );
  }

}

class DataTableSourceImpl extends DataTableSource {
  final category;
  final length;
  final context;

  var comtroller  = TextEditingController();
  var nameController  = TextEditingController();
  var numController  = TextEditingController();

  
  DataTableSourceImpl({required this.category,required this.length,required this.context});

  @override
  DataRow? getRow(int index) {
    return DataRow.byIndex(
      index: index,
      color: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
          return Colors.white; // Default color
        },
      ),
      cells: [
        DataCell(
          TextWidget(text: category[index][key_name].toString(), color: Colors.black,
            size: 14.0, isBold: false,),
        ),

        DataCell(
            Row(
              children: [
                Container(
                  width: 30,
                  height: 30,
                  margin: EdgeInsets.only(left: 2,top: 5,bottom: 10),
                  decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(3)
                  ),
                  child: const Center(child: Icon(Icons.phone)),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10,right: 5.0,bottom: 5.0,top: 5.0),
                  child: TextWidget(text: category[index][key_phone].toString(), color: Colors.black,
                    size: 14.0, isBold: false,),),
              ],
            )
        ),
        DataCell(
          TextWidget(text: category[index][key_pickup].toString(), color: Colors.black,
            size: 14.0, isBold: false,),
        ),
         DataCell(
          TextWidget(text: category[index][key_dropOff].toString(), color: Colors.black,
            size: 14.0, isBold: false,),
        ),

        DataCell(
          TextWidget(text: category[index][key_bookStatus].toString(), color: Colors.black,
            size: 14.0, isBold: false,),
        ),

        DataCell(
          TextWidget(text: "${category[index]["bookDate"].toString()} -- ${category[index]["bookDate"].toString()}", color: Colors.black,
            size: 14.0, isBold: false,),
        ),

        DataCell(
          TextWidget(text: category[index]["carType"].toString(), color: Colors.black,
            size: 14.0, isBold: false,),
        ),


        DataCell(
          TextWidget(text: category[index][key_driverNote].toString(), color: Colors.black,
            size: 14.0, isBold: false,),
        ),

        DataCell(
          TextWidget(text: category[index]["status"].toString(), color: Colors.black,
            size: 14.0, isBold: false,),
        ),

        DataCell(
          Row(
            children: [
              InkWell(
                  onTap: (){
                    Get.bottomSheet(Container(
                      width: Get.width,
                      height: Get.height/2,
                      padding: EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.0),
                            topRight: Radius.circular(20.0),
                        )
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(height: Get.width * 0.010),
                            Row(
                              children: [
                                TextWidget(text: "Customer Name: ", color: primaryColor, size: 18.0, isBold: true),
                                TextWidget(text: category[index][key_name].toString(), color: primaryColor, size: 14.0, isBold: false),
                              ],
                            ),
                            SizedBox(height: Get.width * 0.010),
                            CustomTextField(hintText: "Customer reply", controller: comtroller),
                        
                            SizedBox(height: Get.width * 0.010),
                            CustomTextField(hintText: "Driver Name", controller: nameController),
                        
                            SizedBox(height: Get.width * 0.010),
                            CustomTextField(hintText: "Vehicle Number", controller: numController),
                            SizedBox(height: Get.width * 0.010),
                          Consumer<ValueProvider>(
                          builder: (context,provider,child){
                            return provider.isLoading == false ? ButtonWidget(text: "Send Reply", onClicked: (){
                              provider.setLoading(true);
                              var id =  category[index]["id"].toString();
                              firestore.collection("reply").doc(id).set({
                                "message" :  comtroller.text.toString(),
                                "name" :  nameController.text.toString(),
                                "number" :  numController.text.toString(),
                                "date" :  category[index]["date"].toString(),
                                "time" :  category[index]["time"].toString(),
                              }).whenComplete(() {
                                firestore.collection("requests").doc(id).update({
                                  "status" : "complete"
                                }).whenComplete(() {
                                  Provider.of<ValueProvider>(context,listen: false).setLoading(false);
                                  //  Get.snackbar("Message Deliver", "Message Send Successfully",backgroundColor: primaryColor,colorText: Colors.white);
                                  Get.back();
                                });
                              });
                            }, width: 200.0, height: 50.0)
                            : ButtonLoadingWidget(width: 200.0, height: 50.0);
                          },
                          )
                          ],
                        ),
                      ),
                    ));
                  },
                  child: Icon(Icons.edit)),


              SizedBox(width: 10.0,),
              InkWell(
                  onTap: (){
                    firestore.collection("requests")
                        .doc(category[index]["id"]).delete();
                  },
                  child: Icon(Icons.delete,color: Colors.red,)),
            ],
          )
        ),

      ],
    );
  }

  @override
  int get rowCount => length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 0;
}
