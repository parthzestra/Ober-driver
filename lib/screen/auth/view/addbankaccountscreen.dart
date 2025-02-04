import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ober_driver_app/constant/backbutton.dart';
import 'package:ober_driver_app/constant/colors.dart';
import 'package:ober_driver_app/constant/primarybutton.dart';
import 'package:ober_driver_app/constant/textboxwidget.dart';
import 'package:ober_driver_app/constant/textwidget.dart';
import 'package:ober_driver_app/screen/bottomnavigation/view/bottomnavigationscreen.dart';

import '../../../constant/images.dart';

class AddBankAccountScreen extends StatefulWidget {
  const AddBankAccountScreen({super.key});

  @override
  State<AddBankAccountScreen> createState() => _AddBankAccountScreenState();
}

class _AddBankAccountScreenState extends State<AddBankAccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: white,
        surfaceTintColor: white,
        leading: backIconButton(),
        title: semiBoldText("Add a Bank Acocunt", black, 22),
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SizedBox(
            height: Get.height,
            width: Get.width,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ListView(children: [
                  mediumText(
                      "Please enter your bank account details for seamless transactions.",
                      grey,
                      14,
                      maxline: 2),
                      const SizedBox(height: 15,),
                      textboxWidget(hinttext: "Account Holder Name"),
                        const SizedBox(height: 15,),
                          textboxWidget(hinttext: "Account Number"),
                                    const SizedBox(height: 15,),
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
                              mediumText("Bank Name", black, 14),
                              SvgPicture.asset(downarrow)
                            ],
                          ),
                        ),
                           const SizedBox(height: 15,),
                          textboxWidget(hinttext: "Branch Name"),
                           const SizedBox(height: 15,),
                          textboxWidget(hinttext: "IFSC code"),
                                      const SizedBox(height: 15,),
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
                              mediumText("City", black, 14),
                              SvgPicture.asset(downarrow)
                            ],
                          ),
                        ),
              ],),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: primaryButton(text: "Submit",onpress: (){
              successWidget();
            }),
          )
        ],
      ),
    );
  }

  successWidget() {
    return showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0)), //this right here
            child: Container(
              height: 257,
              width: Get.width * .90,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    semiBoldText("Congratulations You’re Ready to Drive", black, 22,
                        maxline: 2, align: TextAlign.center),
                    const SizedBox(
                      height: 15,
                    ),
                    mediumText(
                        "You're all set to hit the road. Start your \njourney!",
                        grey,
                        14,
                        maxline: 2,
                        align: TextAlign.center,
                        textoverflow: TextOverflow.ellipsis),
                    const SizedBox(
                      height: 20,
                    ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: primaryButton(text: "Ok",onpress: (){
                         Get.offAll(()=>const BottomNavigationScreen());
                    }),
                  )
                  ],
                ),
              ),
            ),
          );
        });
  }
}