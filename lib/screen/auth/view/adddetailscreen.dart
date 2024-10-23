import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:ober_driver_app/constant/backbutton.dart';
import 'package:ober_driver_app/constant/colors.dart';
import 'package:ober_driver_app/constant/images.dart';
import 'package:ober_driver_app/constant/primarybutton.dart';
import 'package:ober_driver_app/constant/textboxwidget.dart';
import 'package:ober_driver_app/constant/textwidget.dart';
import 'package:ober_driver_app/screen/auth/controller/adddetailcontroller.dart';
import 'package:ober_driver_app/screen/auth/view/driverdetailscreen.dart';

class AddDetailScreen extends StatefulWidget {
  const AddDetailScreen({super.key});

  @override
  State<AddDetailScreen> createState() => _AddDetailScreenState();
}

class _AddDetailScreenState extends State<AddDetailScreen> {
  var adddetailcontroller = Get.put(AddDetailController());
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: white,
      appBar: AppBar(backgroundColor: white,leading: backIconButton(),title: semiBoldText("Add Detail", black, 22),),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SizedBox(
            height: Get.height,
            width: Get.width,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ListView(children: [
                Center(child: semiBoldText("Vehical Detail", black, 18)),
                const SizedBox(height: 15,),
                 textboxWidget(hinttext: "Vehical Name",),
                 const SizedBox(height: 15,),
                    textboxWidget(hinttext: "Vehical Number",),
                     const SizedBox(height: 15,),
                   uploadWidget(name: "Vehical RC"),
                        const SizedBox(height: 15,),
                   uploadWidget(name: "Vehical PUC"),
                       const SizedBox(height: 15,),
                      Center(child: semiBoldText("Driver Detail", black, 18)),
                const SizedBox(height: 15,),
                  uploadWidget(name: "License "),
                        const SizedBox(height: 15,),
                   uploadWidget(name: "ID Card"),
                         const SizedBox(height: 15,),
            GestureDetector(
              onTap: (){
            if(adddetailcontroller.isselected.value == false){
              adddetailcontroller.isselected.value = true;
            }else{
              adddetailcontroller.isselected.value = false;
            }
              },
              child: Container(
                        padding:const EdgeInsets.symmetric(horizontal: 10.0),
                      height: 50,
                      width: Get.width,
                      decoration:
                          BoxDecoration(color: lightblue,borderRadius: BorderRadius.circular(10),),
                          child: Obx(
                          ()=> Row(children: [
                              mediumText("I will be driving this vehicle", black, 14),
                                 const Spacer(),
                                             
                              const SizedBox(width: 05,),
                              adddetailcontroller.isselected.value  ?  const Icon(Icons.check_box,color: blue,):
                            const   Icon(Icons.check_box_outline_blank_rounded,color: blue,)
                                        
                            ],),
                          ),
                          
                    ),
            ),
           const SizedBox(height: 120,)
            
              ],),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 16.0),
            child: primaryButton(text: "Next",onpress: (){
              Get.to(()=>const LicenceUpdateScreen());
            }),
          )
        ],
      ),
    );
  }


uploadWidget({name}){
  return  Container(
                padding:const EdgeInsets.symmetric(horizontal: 10.0),
              height: 50,
              width: Get.width,
              decoration:
                  BoxDecoration(color: lightblue,borderRadius: BorderRadius.circular(10),),
                  child: Row(children: [
                    mediumText(name, black, 14),
                       const Spacer(),
                    SvgPicture.asset(camera),
                
                    const SizedBox(width: 05,),
                    semiBoldText("Upload", blue, 14,)
                  ],),
                  
            );
}
  
}