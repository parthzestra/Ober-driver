import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ober_driver_app/constant/backbutton.dart';
import 'package:ober_driver_app/constant/colors.dart';
import 'package:ober_driver_app/constant/primarybutton.dart';
import 'package:ober_driver_app/constant/textwidget.dart';

import '../../bottomnavigation/view/bottomnavigationscreen.dart';

class CashoutScreen extends StatefulWidget {
  const CashoutScreen({super.key});

  @override
  State<CashoutScreen> createState() => _CashoutScreenState();
}

class _CashoutScreenState extends State<CashoutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: backIconButton(),title: semiBoldText("Cash out", black, 22),
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SizedBox(
            height: Get.height,
            width: Get.width,
            child: ListView(
              children: [
                 Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 16.0),
                   child: Column(
                     children: [
                       Container(
                         padding: const EdgeInsets.all(16.0),
                         height: 150,
                         width: Get.width,
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(20),
                           color: lightblue,
                         ),
                         child: Column(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.start,children: [
                           semiBoldText("Balance", grey, 14),
                           semiBoldText("\$700.00", black, 60)
                         ],),
                       ),
                      const SizedBox(height: 10,),
                         Container(
                          padding:const  EdgeInsets.all(16.0),
                  height: 50,
                  width: Get.width,
                  decoration: BoxDecoration(
                      color: lightblue,
                      borderRadius: BorderRadius.circular(10)),
                      child: mediumText("Bank Account - xxxxxxxxxxxx", black, 14),
                ),
               const SizedBox(height: 15,),
                semiBoldText("Securely withdraw your funds with ease.", grey, 14)
                     ],
                   ),
                 ),
              
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0,vertical: 15),
            child: primaryButton(text: 'Confirm',onpress: (){
              confirmalert();
            }),
          )
        ],
      ),

    );
  }

  confirmalert() {
    return showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0)), //this right here
            child: Container(
              height: 257,
              width: Get.width * .80,
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
                    semiBoldText("Withdrawal Request Confirmed!", black, 22,maxline: 2,align: TextAlign.center),
                    const SizedBox(
                      height: 15,
                    ),
                    mediumText(
                        "Your request is being processed. You will receive your funds shortly.",
                        grey,
                        14,
                        maxline: 2,
                        align: TextAlign.center,textoverflow: TextOverflow.ellipsis),
                
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: primaryButton(text: "Done",onpress: (){
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