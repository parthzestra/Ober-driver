import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ober_driver_app/constant/backbutton.dart';


import '../../../constant/colors.dart';
import '../../../constant/images.dart';
import '../../../constant/primarybutton.dart';
import '../../../constant/textwidget.dart';
import '../controller/choosevehicalcontrolle.dart';
import 'adddetailscreen.dart';


class ChooseYourVehicalScreen extends StatefulWidget {
  bool isfromsetting = false;
   ChooseYourVehicalScreen({super.key,required this.isfromsetting});

  @override
  State<ChooseYourVehicalScreen> createState() => _ChooseYourVehicalScreenState();
}

class _ChooseYourVehicalScreenState extends State<ChooseYourVehicalScreen> {
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
      body: ListView(
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
          SizedBox(height: Get.height*.20,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Obx(
              ()=>   primaryButton(onpress: (){
                if(choosecontroller.isselceted.value == false){
                  choosecontroller.isselceted.value = true;
                }else{
                  choosecontroller.isselceted.value = false;
                }
                if(choosecontroller.isselceted.value = true){
                  if(widget.isfromsetting == true){
                    Get.back();
                  }else{
          Get.to(()=>const AddDetailScreen());
                  }
         
                } 
                  },
                  text: choosecontroller.selectedtype.value != 0  ?"Next" : "Choose Vehical",
                  bordercolor: blue,
                  color: choosecontroller.selectedtype.value != 0 ? blue : white,
                  textcolor: choosecontroller.selectedtype.value != 0? white : black),
            ),
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
