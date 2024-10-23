import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ober_driver_app/constant/backbutton.dart';
import 'package:ober_driver_app/constant/colors.dart';
import 'package:ober_driver_app/constant/primarybutton.dart';
import 'package:ober_driver_app/constant/textwidget.dart';
import 'package:ober_driver_app/screen/bottomnavigation/view/bottomnavigationscreen.dart';

class CompleteRideScreen extends StatefulWidget {
  const CompleteRideScreen({super.key});

  @override
  State<CompleteRideScreen> createState() => _CompleteRideScreenState();
}

class _CompleteRideScreenState extends State<CompleteRideScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(leading: backIconButton(),title: semiBoldText("Collect Cash", black, 22),),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SizedBox(
            height: Get.height,
            width: Get.width,
            child: ListView(children: [
             const SizedBox(height: 15,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Container(
                    height: 150,
                    width: Get.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: lightblue,
                    ),
                    child: Column(mainAxisAlignment: MainAxisAlignment.center,children: [
                      semiBoldText("Due Amount", grey, 14),
                      semiBoldText("\$35.20", black, 60)
                    ],),
                  ),
                )
            ],),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 15.0),
            child: primaryButton(text: "Complete Ride",onpress: (){
              Get.offAll(()=>const BottomNavigationScreen());
            }),
          )
        ],
      ),
    );
  }
}