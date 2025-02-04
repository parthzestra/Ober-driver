import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:ober_driver_app/screen/auth/view/otpscreen.dart';


import '../../../constant/colors.dart';
import '../../../constant/images.dart';
import '../../../constant/primarybutton.dart';
import '../../../constant/textwidget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: lightblue,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SizedBox(
            height: Get.height,
            width: Get.width,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ListView(
                children: [
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
                        semiBoldText("Welcome to the Ober", black, 22),
                        const SizedBox(
                          height: 05,
                        ),
                        mediumText(
                            "Log in to start accepting rides and earning \non the road.",
                            black,
                            14,
                            maxline: 2,
                            align: TextAlign.center),
                        const SizedBox(
                          height: 30,
                        ),
                        IntlPhoneField(
                          dropdownIconPosition: IconPosition.trailing,
                          disableLengthCheck: true,
                          decoration: InputDecoration(
                            fillColor: lightblue,
                            filled: true,
                            labelText: 'Mobile Number',
                            labelStyle: const TextStyle(
                                fontFamily: "Roboto-Medium",
                                fontSize: 14,
                                color: grey),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(color: lightblue),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(color: lightblue),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(color: lightblue),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(color: lightblue),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(color: lightblue),
                            ),
                          ),
                          initialCountryCode: 'IN',
                          onChanged: (phone) {
                            log(phone.completeNumber);
                          },
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        RichText(
                          textAlign: TextAlign.start,
                          text: TextSpan(
                            style: const TextStyle(
                                fontFamily: "Roboto-Medium",
                                color: grey,
                                fontWeight: FontWeight.w500,
                                fontSize: 14),
                            text: "By confirming, you agree to our ",
                            children: [
                              TextSpan(
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      // Get.to(()=>const SignupScreen());
                                    },
                                  text: "Privacy Policy ",
                                  style: const TextStyle(
                                    color: blue,
                                    decoration: TextDecoration.underline,
                                    fontSize: 14,
                                    fontFamily: "Roboto-SemiBold",
                                    fontWeight: FontWeight.w600,
                                  ),
                                  children: const [
                                    TextSpan(
                                        text: " and ",
                                        style: TextStyle(
                                          color: grey,
                                          decoration: TextDecoration.none,
                                          fontSize: 14,
                                          fontFamily: "Roboto-Medium",
                                          fontWeight: FontWeight.w500,
                                        ),
                                        children: [
                                          TextSpan(
                                            text: " Terms & Conditions ",
                                            style: TextStyle(
                                              color: blue,
                                              decoration:
                                                  TextDecoration.underline,
                                              fontSize: 14,
                                              fontFamily: "Roboto-SemiBold",
                                              fontWeight: FontWeight.w600,
                                            ),
                                          )
                                        ])
                                  ])
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20),
            child: primaryButton(
                text: "Send OTP",
                onpress: () {
                  Get.to(() => const OTPVerificationScreen());
                }),
          )
        ],
      ),
    );
  }
}
