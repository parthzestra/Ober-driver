
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ober_driver_app/constant/backbutton.dart';
import 'package:ober_driver_app/constant/colors.dart';
import 'package:ober_driver_app/constant/primarybutton.dart';
import 'package:ober_driver_app/constant/textwidget.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class EarningScreen extends StatefulWidget {
  const EarningScreen({super.key});

  @override
  State<EarningScreen> createState() => _EarningScreenState();
}

class _EarningScreenState extends State<EarningScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: backIconButton(),
        title: semiBoldText("Earning", black, 22),
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
                physics:const  BouncingScrollPhysics(),
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 102,
                        width: Get.width*.42,
                        decoration: BoxDecoration(color: lightblue,borderRadius: BorderRadius.circular(20)),
                        child: Column(mainAxisAlignment: MainAxisAlignment.center,children: [
                          semiBoldText("Today’s Earning", grey, 14),
                           semiBoldText("\$700.00", black, 30),
                        ],),
                      ),
                      Container(
                        height: 102,
                        width: Get.width*.42,
                        decoration: BoxDecoration(color: lightblue,borderRadius: BorderRadius.circular(20)),
                        child: Column(mainAxisAlignment: MainAxisAlignment.center,children: [
                          semiBoldText("Total Rides", grey, 14),
                           semiBoldText("5", black, 30),
                        ],),
                      ),
                    ],
                  ),
                 const SizedBox(height: 15,),
                  Container(padding:const EdgeInsets.all(10.0),
                    height: 50,
                    width: Get.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10), color: lightblue),
                 child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                  mediumText("Online", black, 14),
                  mediumText("11h 19m", black, 14)
                 ],), ),
             const SizedBox(height: 15,),
                 Stack(
                   children: [
                     Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: lightblue),
                      height:242 ,
                       child:   SfCartesianChart(
                             primaryXAxis:const CategoryAxis(labelStyle: TextStyle(),),  // X axis is categorical
                          primaryYAxis:const  CategoryAxis(isVisible: false,),
                             tooltipBehavior: TooltipBehavior(enable: true),  // Enable tooltips on hover
                             series: <CartesianSeries>[
                               ColumnSeries<ChartData, String>(
                      dataSource: [
                        ChartData('Mon \n12 ' , 17),
                        ChartData('Tue \n13', 28),
                        ChartData('Wed \n14', 05),
                        ChartData('Thu \n15', 32),  
                        ChartData('Fri \n16', 28),
                          ChartData('Sat \n17', 15),
                            ChartData('Today \n18', 10),
                      ],
                     pointColorMapper: (ChartData data, int index) {
                        return index % 2 == 0 ? Colors.blue : Colors.white;
                      },
                      borderRadius: BorderRadius.circular(10),
                      xValueMapper: (ChartData data, _) => data.month,
                      yValueMapper: (ChartData data, _) => data.sales,
                      name: 'Sales',
                      // color: Colors.blue,
                               )
                             ],
                           ),
                     ),
                      Positioned(
                        right: 20,
                        top: 20,
                        child: Container(
                          height: 40,
                          width: 90,
                          decoration: BoxDecoration(
                            color: white,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: grey)),
                              child: Row(mainAxisAlignment: MainAxisAlignment.center,children: [
                                mediumText("Week", black, 14),
                             const Icon(Icons.arrow_drop_down_rounded)
                              ],),
                        ),
                      )
                   ],
                 ),
                    const SizedBox(height: 15,),
                  Container(padding:const EdgeInsets.all(10.0),
                    height: 50,
                    width: Get.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10), color: lightblue),
                 child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                  mediumText("Total Earning", black, 14),
                  mediumText("\$700.00", black, 14)
                 ],), ),
             const SizedBox(height: 100,),

                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 15.0),
            child: primaryButton(text: "See Earning Activity"),
          )
        ],
      ),
    );
  }
}


class ChartData {
  final String month;
  final double sales;

  ChartData(this.month, this.sales);
}
