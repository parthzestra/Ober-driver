import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ober_driver_app/constant/backbutton.dart';


import '../../../constant/colors.dart';
import '../../../constant/images.dart';
import '../../../constant/primarybutton.dart';
import '../../../constant/textwidget.dart';
import '../../auth/controller/choosevehicalcontrolle.dart';



class ChooseYourVehicalSettingScreen extends StatefulWidget {
  const ChooseYourVehicalSettingScreen({super.key});

  @override
  State<ChooseYourVehicalSettingScreen> createState() => _ChooseYourVehicalSettingScreenState();
}

class _ChooseYourVehicalSettingScreenState extends State<ChooseYourVehicalSettingScreen> {
  var choosecontroller = Get.put(ChooseVehicalController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        leading: backIconButton(),
        title: mediumText('Choose Your Vehicle', black, 22),
        backgroundColor: white,
        surfaceTintColor: white,
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SizedBox(
            height: Get.height,
            width: Get.width,
            child: ListView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                  
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                         vehicaltype(img: t1,index: 1,name: "Bike"),
                        const SizedBox(
                          width: 20,
                        ),
                           vehicaltype(img: t2,index: 2,name: "Auto"),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                          vehicaltype(img: t3,index: 3,name: "Taxi"),
                        const SizedBox(
                          width: 20,
                        ),
                       vehicaltype(img: t4,index: 4,name: "Van")
                      ],
                    )
                  ],
                ),
              
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0,vertical: 15.0),
            child: primaryButton(text: "Save"),
          )
        ],
      ),
    );
  }


  Widget vehicaltype({img,name,index}){
    return GestureDetector(
      onTap: (){
        choosecontroller.selectedtype.value = index;
      },
      child: Obx(
      ()=> Container(
                        height: 120,
                        width: 120,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: choosecontroller.selectedtype.value == index? blue: lightblue),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              img,
                              height: 50,
                              width: 85,
                              fit: BoxFit.fill,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            semiBoldText(name,choosecontroller.selectedtype.value == index? white: black, 14)
                          ],
                        ),
                      ),
      ),
    );
  }
}
