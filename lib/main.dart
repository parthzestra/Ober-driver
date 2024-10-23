import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ober_driver_app/constant/colors.dart';
import 'package:ober_driver_app/screen/bottomnavigation/view/bottomnavigationscreen.dart';
import 'package:ober_driver_app/screen/splashscreen/view/splashscreen.dart';

import 'screen/auth/view/driverdetailscreen.dart';





void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ober-Driver',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: blue),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}


