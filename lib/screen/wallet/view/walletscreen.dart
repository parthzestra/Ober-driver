import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ober_driver_app/constant/colors.dart';
import 'package:ober_driver_app/constant/primarybutton.dart';
import 'package:ober_driver_app/constant/textwidget.dart';
import 'package:ober_driver_app/screen/wallet/view/cashoutscreen.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: false,automaticallyImplyLeading: false,title: semiBoldText("Wallet", black, 22),
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
                        child: Container(
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
                      )
              ],
            ),
          ),
          Padding(
            padding:  EdgeInsets.only(left: 30.0,right: 30,bottom: Get.height*.15),
            child: primaryButton(text: 'Cash out',onpress: (){
              Get.to(()=>const CashoutScreen());
            }),
          )
        ],
      ),

    );
  }
}