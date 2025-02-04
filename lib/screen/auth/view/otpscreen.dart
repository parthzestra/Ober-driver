import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:pinput/pinput.dart';

import '../../../constant/backbutton.dart';
import '../../../constant/colors.dart';
import '../../../constant/images.dart';
import '../../../constant/primarybutton.dart';
import '../../../constant/textwidget.dart';
import 'addprofilescreen.dart';

class OTPVerificationScreen extends StatefulWidget {
  const OTPVerificationScreen({super.key});

  @override
  State<OTPVerificationScreen> createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: lightblue,
      appBar: AppBar(leading: backIconButton(),backgroundColor: lightblue,surfaceTintColor: lightblue,),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SizedBox(
            height: Get.height,width: Get.width,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ListView(children: [
                             Image.asset(
                            logo,
                            height: 200,
                            width: 200,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            padding: const EdgeInsets.all(16.0),
                            height: 290,
                            width: Get.width * .90,
                            decoration: BoxDecoration(
                                color: white, borderRadius: BorderRadius.circular(20)),
                            child: Column(
                              children: [
                                semiBoldText("OTP Verification", black, 22),
                                const SizedBox(
                                  height: 05,
                                ),
                                mediumText(
                                    "OTP send to (+91 85641 58623)",
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
            
                                const SizedBox(
                                  height: 30,
                                ),
                                RichText(
                                  textAlign: TextAlign.start,
                                  text: TextSpan(
                                    style: const TextStyle(
                                        decoration: TextDecoration.underline,
                                        fontFamily: "Roboto-SemiBold",
                                        color: blue,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14),
                                    text: "Resend OTP ",
                                    children: [
                                      TextSpan(
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {
                                              // Get.to(()=>const SignupScreen());
                                            },
                                          text: "00:29",
                                          style: const TextStyle(
                                            color: black,
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
                          )
              ],),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:20.0,vertical: 15.0),
            child: primaryButton(text: "Confirm OTP",onpress: (){
              Get.to(()=>const AddProfileScreen());
            }),
          )
        ],
      ),
      
    );
  }
}