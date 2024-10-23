import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constant/backbutton.dart';
import '../../../constant/colors.dart';
import '../../../constant/primarybutton.dart';
import '../../../constant/textwidget.dart';
import '../../bottomnavigation/view/bottomnavigationscreen.dart';
import '../controller/cartcontroller.dart';




class CancelRideScreen extends StatefulWidget {
  const CancelRideScreen({super.key});

  @override
  State<CancelRideScreen> createState() => _CancelRideScreenState();
}

class _CancelRideScreenState extends State<CancelRideScreen> {
  var cancelcontroller = Get.put(CancelController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        surfaceTintColor: white,
        backgroundColor: white,
        leading: backIconButton(),
        title: semiBoldText("Cancel Ride?", black, 22),
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SizedBox(
            height: Get.height,
            width: Get.width,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ListView(physics:const BouncingScrollPhysics(),children: [
               const SizedBox(height: 15,),
                semiBoldText("Is there a reason you're considering canceling?", black, 18,maxline: 2,align: TextAlign.center),
                   const SizedBox(height: 15,),
                  ListView.builder(
                    physics:const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: cancelcontroller.cancellist.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: cancelWidget(
                          name: cancelcontroller.cancellist[index], index: index),
                    ),
                  )
              
                   
              ],),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: primaryButton(text: "Cancel Booking",color: red,bordercolor: red,onpress: (){
              cancelalert();
            }),
          )
        ],
      ),
    );
  }
  cancelalert() {
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
                    semiBoldText("Booking Successfully Canceled!", black, 22,maxline: 2,align: TextAlign.center),
                    const SizedBox(
                      height: 15,
                    ),
                    mediumText(
                        "You have canceled the ride. You can accept a new ride or go offline.",
                        grey,
                        14,
                        maxline: 2,
                        align: TextAlign.center,textoverflow: TextOverflow.ellipsis),
                
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
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

 Widget cancelWidget({name,index}){
    return  GestureDetector(
      onTap: (){
        cancelcontroller.selecetedindex.value =index;
      },
      child: Container(
                padding:const EdgeInsets.symmetric(horizontal: 16.0),
                
                height: 55,
                width: Get.width,
                decoration: BoxDecoration(
                    color: lightblue, borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(width: Get.width*.70,child: mediumText(name, black, 14,textoverflow: TextOverflow.ellipsis)),
                    Container(
                      height: 21,
                      width: 21,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: white),
                      child: Center(
                        child: Obx(
                          ()=> Container(
                            height: 11,
                            width: 11,
                            decoration: BoxDecoration(shape: BoxShape.circle,color:cancelcontroller.selecetedindex.value == index?  black:lightblue),
                          ),
                        ),
                      ),
                    )
      
                  ],
                ),
              ),
    );
  }
}