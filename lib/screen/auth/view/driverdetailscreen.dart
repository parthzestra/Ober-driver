import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ober_driver_app/constant/textwidget.dart';
import 'package:ober_driver_app/screen/auth/view/addbankaccountscreen.dart';



import '../../../constant/backbutton.dart';
import '../../../constant/colors.dart';
import '../../../constant/images.dart';


class LicenceUpdateScreen extends StatefulWidget {
  const LicenceUpdateScreen({super.key});

  @override
  State<LicenceUpdateScreen> createState() => _LicenceUpdateScreenState();
}

class _LicenceUpdateScreenState extends State<LicenceUpdateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blue,
      appBar: AppBar(
        backgroundColor: blue,
       
        leading: backIconButton(color: white, iconcolor: blue),
        title: semiBoldText("Upload Vehical Rc", white, 22),
      ),
      body: SizedBox(
        height: Get.height,
        width: Get.width,
        child: Stack(children: [
          Image.asset(
            ul,
            height: Get.height,
            width: Get.width,
            fit: BoxFit.fill,
          ),
          Container(
            height: Get.height,
            width: Get.width,
            color: Colors.black.withOpacity(0.8),
          ),
          Positioned(left: 10,right: 10,top: 20,child: Image.asset(ul1)),
          Positioned(
            bottom: 30,
            left:  Get.width*.30,right: Get.width*.30,
            child: Row(children: [
              Container(height: 60,width: 60,decoration:const  BoxDecoration(shape: BoxShape.circle,color: white),child: Center(child: SvgPicture.asset(again)),),
             const  SizedBox(width: 15,),
                GestureDetector(
                  onTap: (){
                    Get.to(()=>const AddBankAccountScreen());
                  },
                  child: Container(
                    height: 60,
                    width: 60,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: blue),
                    child: Center(child: SvgPicture.asset(tick)),
                  ),
                )
            ],),
          )
        ]),
      ),
    );
  }
}