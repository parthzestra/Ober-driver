import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';
import 'package:ober_driver_app/constant/colors.dart';
import 'package:ober_driver_app/constant/images.dart';
import 'package:ober_driver_app/constant/primarybutton.dart';
import 'package:ober_driver_app/constant/textwidget.dart';
import 'package:ober_driver_app/screen/home/controller/homcontroller.dart';
import 'package:ober_driver_app/screen/home/view/cancelridescreen.dart';
import 'package:ober_driver_app/screen/home/view/pickingupscreen2.dart';

class PickingupScreen extends StatefulWidget {
  const PickingupScreen({super.key});

  @override
  State<PickingupScreen> createState() => _PickingupScreenState();
}

class _PickingupScreenState extends State<PickingupScreen> {
  var homecontroller = Get.put(HomeController());
  final _controller01 = ValueNotifier<bool>(false);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        SizedBox(
          height: Get.height,
          width: Get.width,
          child: Image.asset(
            map,
            fit: BoxFit.fill,
          ),
        ),
       
        Positioned(
            left: 20,
            right: 20,
            top: Get.height * .20,
            child: Image.asset(direction2,height: Get.height*.30,),
            ),
             Positioned(
          left: 10,
          right: 10,
          top: 60,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              height: 70,
              width: Get.width,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20),
                  color: lightblue

                  ),
                  child: Row(children: [
                  Container(
                  
                    height: 40,
                    width: 40,
                    decoration:
                        BoxDecoration(color: white,borderRadius: BorderRadius.circular(10)),
                child: Center(child: SvgPicture.asset(location)),  ),
              const SizedBox(width: 15,),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  semiBoldText("The Shard", black, 14),
                  mediumText("32 London Bridge St, London SE1 9SG", grey, 14)
                ],
              ),

                  ],),
            )
        ),
        Positioned(
          bottom: Get.height*.40 + 20,
          right: 20,
          child: Container(
            height: 44,
            width: 44,
            decoration: const BoxDecoration(shape: BoxShape.circle, color: white),
            child:const  Icon(Icons.my_location_outlined),
          ),
        ),
        Positioned(
          bottom: 0,
          child: Container(
              height: Get.height * .40,
              width: Get.width,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    blurRadius: 30,
                    color: black.withOpacity(0.15),
                    offset: const Offset(04, -5),
                  )
                ],
                color: white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: ListView(
                  children: [
                        const SizedBox(
                          height: 15,
                        ),
                    Center(child: semiBoldText("Picking up Yarewan", black, 22)),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.center,children: [
                      SvgPicture.asset(call),
                    const SizedBox(width: 30,),
                       SvgPicture.asset(whatsapp),
                    ],),
                   const SizedBox(
                      height: 15,
                    ),
                    
                    
                    Column(
                      children: [
                        SizedBox(
                            width: Get.width * .70,
                            child: primaryButton(
                                text: 'Cancel Ride',
                                bordercolor: red,
                                color: red,
                                onpress: (){
                                  Get.to(()=>const CancelRideScreen());
                                }),),
                              const  SizedBox(height: 15,),
                        SizedBox(
                            width: Get.width * .70,
                            child: primaryButton(
                                text: 'Start Ride',
                                bordercolor: green,
                                color: green,onpress: (){
                                  Get.to(()=>const PickingupScreen2());
                                }),),
                      ],
                    ),
                     const SizedBox(
                      height: 120,
                    ),
                  ],
                ),
              )),
        )
      ]),
    );
  }

  Widget locationWidget() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      height: 175,
      width: Get.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: lightblue,
      ),
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 16,
                width: 16,
                decoration:
                    const BoxDecoration(color: white, shape: BoxShape.circle),
                child: Center(
                    child: Container(
                  height: 10,
                  width: 10,
                  decoration:
                      const BoxDecoration(shape: BoxShape.circle, color: green),
                )),
              ),
              SizedBox(
                width: 25,
                child: Dash(
                    direction: Axis.vertical,
                    length: Get.height * .10,
                    dashLength: 4,
                    dashThickness: 2,
                    dashColor: grey),
              ),
              Container(
                height: 16,
                width: 16,
                decoration:
                    const BoxDecoration(color: white, shape: BoxShape.circle),
                child: Center(
                    child: Container(
                  height: 10,
                  width: 10,
                  decoration:
                      const BoxDecoration(shape: BoxShape.circle, color: red),
                )),
              ),
            ],
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                height: 55,
                width: Get.width < 420 ? Get.width * .70 : Get.width * .75,
                decoration: BoxDecoration(
                    color: white, borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        semiBoldText("Pickup Location", green, 14),
                        semiBoldText(
                            "Buckingham Palace, London SW1A 1AA", black, 12),
                      ],
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  // Get.to(()=>const MapScreen());
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  height: 55,
                  width: Get.width < 420 ? Get.width * .70 : Get.width * .75,
                  decoration: BoxDecoration(
                      color: white, borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          semiBoldText("Destination", red, 14),
                          semiBoldText("The Shard, London SE1 9SG", black, 12),
                        ],
                      ),
                      // SvgPicture.asset(location)
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
