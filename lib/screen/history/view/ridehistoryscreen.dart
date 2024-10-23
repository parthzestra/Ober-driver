import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:get/get.dart';

import 'package:ober_driver_app/constant/colors.dart';
import 'package:ober_driver_app/constant/textwidget.dart';
import 'package:ober_driver_app/screen/history/controller/historycontroller.dart';

import '../../../constant/images.dart';

class RideHistoryScreen extends StatefulWidget {
  const RideHistoryScreen({super.key});

  @override
  State<RideHistoryScreen> createState() => _RideHistoryScreenState();
}

class _RideHistoryScreenState extends State<RideHistoryScreen> {
  var historycontroller = Get.put(HistoryController());
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: white,
      appBar: AppBar(centerTitle: false,title: semiBoldText('Ride History', black, 22),backgroundColor: white,surfaceTintColor: white,),
      body: Padding(

        padding: const EdgeInsets.symmetric(horizontal:16.0),
        child: ListView(physics: const BouncingScrollPhysics(),children: [
            Obx(
              ()=> Row(mainAxisAlignment: MainAxisAlignment.center,children: [
                      GestureDetector(
                        onTap: (){
              historycontroller.selectedindex.value= 0;
                        },
                        child: Container(height: 50,width: 120,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: black.withOpacity(0.15),
                              offset: const Offset(0, 15),
                              blurRadius: 30)
                        ],
                        border: Border.all(color: historycontroller.selectedindex.value ==0 ? blue : black),
                        borderRadius: BorderRadius.circular(10),
                        color: historycontroller.selectedindex.value ==0 ? blue : white,
                      ),child: Center(child: semiBoldText("Completed", historycontroller.selectedindex.value ==0 ? white : black, 14)),
                    ),
                      ),
                  const SizedBox(width: 10,),
                        GestureDetector(
                          onTap: (){
                            historycontroller.selectedindex.value= 1;
                          },
                          child: Container(height: 50,width: 120,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: black.withOpacity(0.15),
                              offset: const Offset(0, 15),
                              blurRadius: 30)
                        ],
                        border: Border.all(color: historycontroller.selectedindex.value ==1 ? blue : black),
                        borderRadius: BorderRadius.circular(10),
                        color: historycontroller.selectedindex.value ==1 ? blue : white,
                      ),child: Center(child: semiBoldText("Cancelled", historycontroller.selectedindex.value ==1 ? white : black, 14)),
                    ),
                        ),
              ],),
            ),
           const  SizedBox(height: 15,),
Obx
(
 ()=> historycontroller.selectedindex.value == 0 ? 
  ListView.builder(
    physics:const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: historycontroller.completedlist.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: completedWidget(
                    name: historycontroller.completedlist[index]['name'] ,
                      img: historycontroller.completedlist[index]['img'],
                      price: historycontroller.completedlist[index]['price'],
                      type:historycontroller.completedlist[index]['type'],
                ),
              )) :
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 3,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: cancelledWidget(
                    name: historycontroller.cancelledlist[index]['name'],
                               img:historycontroller.cancelledlist[index]['img'],
                               price: historycontroller.cancelledlist[index]['price'],
                              
                             ),
                ),),
)
,const SizedBox(height: 120,)


        ],),
      ),
    );
  }

  Widget cancelledWidget({img, price,name}) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      height: 250,
      width: Get.height,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: lightblue),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(
                img,
                height: 50,
                width: 50,
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  semiBoldText(name, black, 16),
                  mediumText("Sept 15, 2024 | 3:00 PM", black, 14),
                
                ],
              ),
              const Spacer(),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  semiBoldText('\$$price', black, 16),
               
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          locationWidget()
        ],
      ),
    );
  }
Widget completedWidget({img, price, type,name}) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      height: 250,
      width: Get.height,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: lightblue),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(
                img,
                height: 50,
                width: 50,
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  semiBoldText(name, black, 16),
                  mediumText("33 min 49 sec, 4.5 km", black, 14),
                  mediumText("Sept 15, 2024 | 3:00 PM", black, 14),
                ],
              ),
              const Spacer(),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  semiBoldText('\$$price', black, 16),
                  mediumText(type, grey, 14),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          locationWidget()
        ],
      ),
    );
  }
  Widget locationWidget() {
    return Row(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 16,
              width: 16,
              decoration:
                  const BoxDecoration(color: white, shape: BoxShape.circle),
              child: Center(
                  child: Container(
                height: 10,
                width: 10,
                decoration:
                    const BoxDecoration(shape: BoxShape.circle, color: green),
              )),
            ),
            SizedBox(
              width: 25,
              child: Dash(
                  direction: Axis.vertical,
                  length: Get.height * .10,
                  dashLength: 4,
                  dashThickness: 2,
                  dashColor: grey),
            ),
            Container(
              height: 16,
              width: 16,
              decoration:
                  const BoxDecoration(color: white, shape: BoxShape.circle),
              child: Center(
                  child: Container(
                height: 10,
                width: 10,
                decoration:
                    const BoxDecoration(shape: BoxShape.circle, color: red),
              )),
            ),
          ],
        ),
        const SizedBox(
          width: 10,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              height: 55,
              width: Get.width < 420 ? Get.width * .70 : Get.width * .75,
              decoration: BoxDecoration(
                  color: white, borderRadius: BorderRadius.circular(10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      semiBoldText("Pickup Location", green, 14),
                      SizedBox(
                          width: Get.width < 420 ? Get.width * .55 : Get.width * .75,
                        child: semiBoldText(
                            "Buckingham Palace, London SW1A 1AA", black, 12,
                            textoverflow: TextOverflow.ellipsis),
                      ),
                    ],
                  ),
                ],
              ),
            ),
           const SizedBox(height: 15,),
            GestureDetector(
              onTap: () {
                // Get.to(()=>const MapScreen());
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                height: 55,
                width: Get.width < 420 ? Get.width * .70 : Get.width * .75,
                decoration: BoxDecoration(
                    color: white, borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        semiBoldText("Destination", red, 14),
                        semiBoldText("The Shard, London SE1 9SG", black, 12),
                      ],
                    ),
                    // SvgPicture.asset(location)
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}