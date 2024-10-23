import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ober_driver_app/constant/backbutton.dart';
import 'package:ober_driver_app/constant/colors.dart';
import 'package:ober_driver_app/constant/primarybutton.dart';
import 'package:ober_driver_app/screen/home/view/droppinoffscreen.dart';
import 'package:pinput/pinput.dart';

import '../../../constant/textwidget.dart';

class EnterPinScreen extends StatefulWidget {
  const EnterPinScreen({super.key});

  @override
  State<EnterPinScreen> createState() => _EnterPinScreenState();
}

class _EnterPinScreenState extends State<EnterPinScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: lightblue,
        leading: backIconButton(),
      ),
      backgroundColor: lightblue ,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SizedBox(
            height: Get.height,
            width: Get.width,
            child: Column(crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.center,children: [
                                      Container(
                            padding: const EdgeInsets.all(16.0),
                            height: 195,
                            width: Get.width * .90,
                            decoration: BoxDecoration(
                                color: white, borderRadius: BorderRadius.circular(20)),
                            child: Column(
                              children: [
                                semiBoldText("Enter Pin", black, 22),
                                const SizedBox(
                                  height: 05,
                                ),
                                mediumText(
                                    "Please enter the PIN number provided by \nthe customer.",
                                    black,
                                    14,
                                    maxline: 2,
                                    align: TextAlign.center),
                                const SizedBox(
                                  height: 30,
                                ),
                               Center(
                                child: Pinput(
                                  length: 4,
                                  followingPinTheme: PinTheme(
                                    height: 50,
                                    width: 50,
                                    textStyle: const TextStyle(
                                        fontFamily: "Roboto-SemiBold",
                                        fontSize: 20,
                                        color: black),
                                    decoration: BoxDecoration(
                                      color: blue,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  submittedPinTheme: PinTheme(
                                    height: 50,
                                    width: 50,
                                    textStyle: const TextStyle(
                                        fontFamily: "Roboto-SemiBold",
                                        fontSize: 20,
                                        color: black),
                                    decoration: BoxDecoration(
                                      color: lightblue,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  focusedPinTheme: PinTheme(
                                    height: 50,
                                    width: 50,
                                    textStyle: const TextStyle(
                                        fontFamily: "Roboto-Bold",
                                        fontSize: 20,
                                        color: black),
                                    decoration: BoxDecoration(
                                      border: Border.all(color: blue),
                                     
                                      color: lightblue,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  defaultPinTheme: PinTheme(
                                    height: 50,
                                    width: 50,
                                    textStyle: const TextStyle(
                                        fontFamily: "Roboto-Bold",
                                        fontSize: 20,
                                        color: black),
                                    decoration: BoxDecoration(
                                      color: blue,
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                  ),
                                ),
                              ),
            
                              
                              ],
                            ),
                          ),
                         const  SizedBox(height: 100,)
            ],),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 15.0),
            child: primaryButton(text: "Next",onpress: (){
              Get.to(()=>const DroppingOffScreen());
            }),
          )
        ],
      ),
    );
  }
}