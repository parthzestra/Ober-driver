import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:ober_driver_app/constant/textwidget.dart';
import 'package:ober_driver_app/screen/auth/view/chooseyourvehicalscreen.dart';

import '../../../constant/backbutton.dart';
import '../../../constant/colors.dart';
import '../../../constant/images.dart';
import '../../../constant/primarybutton.dart';
import '../../../constant/textboxwidget.dart';
import '../controller/addprofilecontroller.dart';

class AddProfileScreen extends StatefulWidget {
  const AddProfileScreen({super.key});

  @override
  State<AddProfileScreen> createState() => _AddProfileScreenState();
}

class _AddProfileScreenState extends State<AddProfileScreen> {
  var addprofilecontroller = Get.put(AddProfileController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: backIconButton(),
        title: semiBoldText("Add Profile", black, 22),
      ),
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
                  Center(
                    child: Stack(children: [
                      Image.asset(
                        profile,
                        height: 100,
                        width: 100,
                      ),
                      Positioned(
                          bottom: 0, right: 0, child: SvgPicture.asset(edit))
                    ]),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  textboxWidget(hinttext: "Yarewan Williomson|"),
                  const SizedBox(
                    height: 15,
                  ),
                  IntlPhoneField(
                    dropdownIconPosition: IconPosition.trailing,
                    disableLengthCheck: true,
                    decoration: InputDecoration(
                      fillColor: lightblue,
                      filled: true,
                      labelText: '98641 58623',
                      labelStyle: const TextStyle(
                          fontFamily: "Roboto-Medium",
                          fontSize: 14,
                          color: black),
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
                    height: 15,
                  ),
                  textboxWidget(hinttext: "Email"),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    height: 50,
                    width: Get.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: lightblue),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        mediumText("City of Earnings", black, 14),
                        SvgPicture.asset(downarrow)
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.bottomSheet(
                        isScrollControlled: true,
                        Container(
                          padding:const EdgeInsets.all(10.0),
                         
                          decoration: const BoxDecoration(
                             color: white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(30))),
                          height: Get.height * .80,
                          width: Get.width,
                          child: ListView(
                            physics:const BouncingScrollPhysics(),
                            children: [
                             const  SizedBox(height: 20,),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  semiBoldText("Cancel", white, 14),
                                  semiBoldText("Select Language", black, 22),
                                  semiBoldText("Cancel", blue, 14),
                                ],
                              ),
                             const SizedBox(height: 15,),
                              textfield(),
                            const SizedBox(height: 15,),
                            ListView.separated(
                              physics:const NeverScrollableScrollPhysics(),
                              separatorBuilder: (context, index) =>const Divider(color: grey,),
                              shrinkWrap: true,
                              itemCount: addprofilecontroller.languagelist.length,
                              itemBuilder: (context, index) =>  Padding(
                                padding: const EdgeInsets.symmetric(vertical: 10.0),
                                child: GestureDetector(
                                  onTap: (){
                                    if (addprofilecontroller.emptylist
                                          .contains(index)) {
                                        addprofilecontroller.emptylist
                                            .remove(index);
                                      } else {
                                        addprofilecontroller.emptylist
                                            .add(index);
                                      }
                                  },
                                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                                    mediumText(addprofilecontroller.languagelist[index], black, 16),
                                    Obx(
                                      ()=> addprofilecontroller.emptylist.contains(index) ? 
                                      const Icon(Icons.check_box,color: blue,) : const Icon(Icons.check_box_outline_blank,color: blue,),
                                    )
                                  ],),
                                ),
                              ),
                            )

                            ],
                          ),
                        ),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      height: 50,
                      width: Get.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: lightblue),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          mediumText("Select Language", black, 14),
                          SvgPicture.asset(downarrow),
                        ],
                      ),
 
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 15),
            child: primaryButton(
                text: 'Next',
                onpress: () {
                  Get.to(()=> ChooseYourVehicalScreen(isfromsetting: false,));
                }),

          ),

        ],
      ),
    );
  }


  Widget textfield(){
    return  TextFormField(
                              
                            style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: white,
                                fontFamily: "Roboto-Medium"),
                            decoration: InputDecoration(
                              fillColor: blue,
                                  filled: true,
                                  prefixIconConstraints: const BoxConstraints(
                                      maxHeight: 50, maxWidth: 50),
                                  prefixIcon: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal:10.0),
                                    child: SvgPicture.asset(search),
                                  ),
                                  border: UnderlineInputBorder(
                                      borderSide: const BorderSide(color: blue),
                                      borderRadius: BorderRadius.circular(10)),
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: const BorderSide(color: blue),
                                      borderRadius: BorderRadius.circular(10)),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: const BorderSide(color: blue),
                                      borderRadius: BorderRadius.circular(10)),
                                  hintText: "Search",
                                  hintStyle: const TextStyle(
                                    fontSize: 14,
                                    fontFamily: "Roboto-Medium",
                                    fontWeight: FontWeight.w400,
                                    color: white,
                                  ),
                                ),
                              );
  }
}
