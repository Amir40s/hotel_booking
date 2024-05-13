import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotelbooking/admin/admin_dashbaord_screen.dart';
import 'package:hotelbooking/admin/login_screen.dart';
import 'package:hotelbooking/constants.dart';
import 'package:hotelbooking/provider/data_provider.dart';
import 'package:hotelbooking/provider/value_provider.dart';
import 'package:hotelbooking/start_screen.dart';
import 'package:hotelbooking/user/user_form_screen.dart';
import 'package:hotelbooking/user/user_waiting_screen.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DataProvider()),
        ChangeNotifierProvider(create: (_) => ValueProvider()),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Hotel Booking',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
          useMaterial3: true,
        ),
        home:  UserWaitingScreen(id: "OXzwX3JohDXOtBTW6XyZ",),
        // home:  AdminDashboardScreen(),
      ),
    );
  }
}
