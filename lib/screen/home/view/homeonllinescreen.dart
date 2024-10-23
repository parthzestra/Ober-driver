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
import 'package:ober_driver_app/screen/home/view/pickingscreen.dart';

class HomeOnlineScreen extends StatefulWidget {
  const HomeOnlineScreen({super.key});

  @override
  State<HomeOnlineScreen> createState() => _HomeOnlineScreenState();
}

class _HomeOnlineScreenState extends State<HomeOnlineScreen> {
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
          left: 10,
          right: 10,
          top: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset(pp),
              Obx(() => semiBoldText(
                  homecontroller.isonline.value ? 'Online' : 'Offline',
                  black,
                  22)),
              AdvancedSwitch(
                onChanged: (value) {
                  homecontroller.isonline.value = value;
                },
                activeColor: blue,
                inactiveColor: grey,
                width: 45,
                height: 20,
                controller: _controller01,
              ),
            ],
          ),
        ),
        Positioned(
            left: 20,
            right: 20,
            top: Get.height * .08,
            child: Image.asset(direction,height: Get.height*.30,)),
        Positioned(
          bottom: 0,
          child: Container(
              height: Get.height * .60,
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
                    Column(
                      children: [
                        const SizedBox(
                          height: 15,
                        ),
                        semiBoldText("3 min away", black, 22),
                        const SizedBox(
                          height: 15,
                        ),
                        SizedBox(
                          width: Get.width * .70,
                          child: LinearProgressBar(
                            maxSteps: 5,
                            progressType: LinearProgressBar.progressTypeLinear,
                            minHeight: 6,
                            // Use Linear progress
                            currentStep: 1,
                            progressColor: blue,
                            backgroundColor: lightblue,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          height: 80,
                          width: Get.width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: lightblue),
                          child: Row(
                            children: [
                              Image.asset(
                                customer,
                                height: 50,
                                width: 50,
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  semiBoldText("Yarewan Williomson", black, 16),
                                  RichText(
                                    textAlign: TextAlign.start,
                                    text: TextSpan(
                                      style: const TextStyle(
                                          decoration: TextDecoration.none,
                                          fontFamily: "Roboto-SemiBold",
                                          color: black,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14),
                                      text: "Payment by ",
                                      children: [
                                        TextSpan(
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {
                                              // Get.to(()=>const SignupScreen());
                                            },
                                          text: "Cash",
                                          style: const TextStyle(
                                            color: grey,
                                            decoration: TextDecoration.none,
                                            fontSize: 14,
                                            fontFamily: "Roboto-SemiBold",
                                            fontWeight: FontWeight.w500,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  semiBoldText("\$35.20", black, 16),
                                  mediumText('2.3 km', grey, 14)
                                ],
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        locationWidget(),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                                width: Get.width * .40,
                                child: primaryButton(
                                    text: 'Decline',
                                    bordercolor: red,
                                    color: white,
                                    textcolor: red,onpress: (){
                                      Get.back();
                                    }),),
                            SizedBox(
                                width: Get.width * .40,
                                child: primaryButton(
                                    text: 'Accept',
                                    bordercolor: green,
                                    color: green,onpress: (){
                                      Get.to(()=>const PickingupScreen());
                                    }),)
                          ],
                        ),
                          const SizedBox(
                          height: 15,
                        ),
                      ],
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
                        SizedBox(
                          width: Get.width < 420 ? Get.width * .60 : Get.width * .75,
                          child: semiBoldText(
                              "Buckingham Palace, London SW1A 1AA", black, 12),
                        ),
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
