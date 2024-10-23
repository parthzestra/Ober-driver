import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constant/images.dart';
import '../../auth/view/loginscreen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2),(){
      Get.to(()=>const LoginScreen());
    });
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: Get.height,
            width: Get.width,),
            Center(child: Image.asset(logo,width: Get.width*.60,)),
            
            Positioned(bottom: 0,child: Image.asset(splash,height: Get.height*.30,width: Get.width,fit: BoxFit.fill,))
        
        ],
      ),
    );
  }
}