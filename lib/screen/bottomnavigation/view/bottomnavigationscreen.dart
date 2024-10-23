import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../constant/colors.dart';
import '../../../constant/images.dart';
import '../../../constant/textwidget.dart';
import '../controller/bottomcontroller.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({super.key});

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  var bottomcontroller = Get.put(BottomController());
  @override
  Widget build(BuildContext context) {
    log("width::::${Get.width}");
    log("height::::${Get.height}");
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        extendBodyBehindAppBar: true,
        backgroundColor: white,
        body: WillPopScope(
          onWillPop: () async {
            if (bottomcontroller.bottomindex.value == 0) {
              return onBackPressed();
            } else {
              setState(() {
                bottomcontroller.bottomindex.value = 0;
              });
            }
            return false;
          },
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              SizedBox(
                height: Get.height,
                width: Get.width,
                child: Obx(() => bottomcontroller.pages
                    .elementAt(bottomcontroller.bottomindex.value)),
              ),
              Container(
                  height: 80,
                  width: Get.width,
                  color: lightblue,
                  child: Obx(
                    () => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            bottomcontroller.bottomindex.value = 0;
                          },
                          child: Stack(children: [
                            SvgPicture.asset(
                              select,
                              color: bottomcontroller.bottomindex.value == 0
                                  ? blue
                                  : lightblue,
                            ),
                            Positioned(
                                top: 15,
                                left: 15,
                                right: 15,
                                child: SvgPicture.asset(
                                    bottomcontroller.bottomindex.value == 0
                                        ? b1
                                        : b4),
                                        )
                          ]),
                        ),
                        GestureDetector(
                          onTap: () {
                            bottomcontroller.bottomindex.value = 1;
                          },
                          child: Stack(children: [
                            SvgPicture.asset(
                              select,
                              color: bottomcontroller.bottomindex.value == 1
                                  ? blue
                                  : lightblue,
                            ),
                            Positioned(
                                top: 15,
                                left: 15,
                                right: 15,
                                child: SvgPicture.asset(
                                    bottomcontroller.bottomindex.value == 1
                                        ? b2
                                        : b5)
                                        ,
                                        )
                          ]),
                        ),
                        GestureDetector(
                          onTap: () {
                            bottomcontroller.bottomindex.value = 2;
                          },
                          child: Stack(children: [
                            SvgPicture.asset(
                              select,
                              color: bottomcontroller.bottomindex.value == 2
                                  ? blue
                                  : lightblue,
                            ),
                            Positioned(
                                top: 15,
                                left: 15,
                                right: 15,
                                child: SvgPicture.asset(
                                    bottomcontroller.bottomindex.value == 2
                                        ? b3
                                        : b6))
                          ]),
                        ),
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> onBackPressed() async {
    return await showDialog(
          context: context,
          builder: (context) => SizedBox(
            height: 150,
            child: AlertDialog(
              backgroundColor: white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              title: Center(
                child: mediumText(
                  "Exit",
                  black,
                  17,
                ),
              ),
              content: mediumText(
                "Are you sure want to quit?",
                black,
                14,
              ),
              actions: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    exit(0);
                  }, //return true when click on "Yes"
                  child: mediumText(
                    "Yes",
                    white,
                    16,
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () => Navigator.of(context).pop(false),
                  //return false when click on "NO"
                  child: mediumText(
                    "No",
                    white,
                    16,
                  ),
                ),
              ],
            ),
          ),
        ) ??
        false;
  }
}
