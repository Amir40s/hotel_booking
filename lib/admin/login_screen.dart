import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';

import '../helper/button_loading_widget.dart';
import '../helper/button_widget.dart';
import '../helper/custom_textfield.dart';
import '../helper/text_widget.dart';
import '../provider/data_provider.dart';
import '../provider/value_provider.dart';
class LoginScreen extends StatelessWidget {
   LoginScreen({super.key});


  var usernameController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: Get.width,
          height: Get.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              SizedBox(height: 20.0,),
              TextWidget(text: "Admin Login Portal", color: Colors.black, size: 20.0, isBold: true),

              SizedBox(height: 20.0,),
              Container(child:
              Container(
                  width: 400.0,
                  child: Column(
                    children: [
                      SizedBox(height: 20.0,),
                      CustomTextFormField(hintText: "Username", controller: usernameController),

                      SizedBox(height: 20.0,),
                      CustomTextFormField(hintText: "Password", controller: passwordController),


                      SizedBox(height: 20.0,),
                      Consumer<ValueProvider>(
                        builder: (context,provider,child){
                          return provider.isLoading == false ? ButtonWidget(text: "Login", onClicked: (){
                            provider.setLoading(true);
                            Provider.of<DataProvider>(context,listen: false).fetchAdminLoginDetails(
                                context: context,
                                username: usernameController.text.toString(),
                                password: passwordController.text.toString()
                            );
                          },
                              width: Get.width, height: 50.0) : ButtonLoadingWidget(width: Get.width, height: 50.0);
                        },

                      )
                    ],
                  )))

            ],
          ),
        ),
      ),
    );
  }
}
