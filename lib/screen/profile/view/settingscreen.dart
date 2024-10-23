import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ober_driver_app/constant/backbutton.dart';
import 'package:ober_driver_app/constant/colors.dart';
import 'package:ober_driver_app/constant/images.dart';
import 'package:ober_driver_app/constant/textwidget.dart';
import 'package:ober_driver_app/screen/auth/view/addbankaccountscreen.dart';
import 'package:ober_driver_app/screen/auth/view/adddetailscreen.dart';
import 'package:ober_driver_app/screen/auth/view/chooseyourvehicalscreen.dart';
import 'package:ober_driver_app/screen/profile/controller/settingcontroller.dart';

import '../../../constant/primarybutton.dart';
import '../../auth/controller/addprofilecontroller.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  var settingcontroller = Get.put(SettingScreenController());
  var addprofilecontroller = Get.put(AddProfileController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: backIconButton(),
        title: semiBoldText("Setting", black, 22),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView(
          children: [
            ListView.builder(
              shrinkWrap: true,
              itemCount: settingcontroller.settinglist.length,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  if (index == 4) {
                    selectlanguage();
                  } else if (index == 0) {
                    Get.to(() => ChooseYourVehicalScreen(
                          isfromsetting: true,
                        ));
                  } else if (index == 1) {
                    Get.to((() => const AddDetailScreen()));
                  } else if (index == 2) {
                    Get.to((() => const AddDetailScreen()));
                  } else if (index == 3) {
                    Get.to((() => const AddBankAccountScreen()));
                  } else if (index == 5) {
                    deletealert();
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 15.0),
                  child: Container(
                    padding: const EdgeInsets.all(10.0),
                    height: 50,
                    width: Get.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: lightblue),
                    child: Row(
                      children: [
                        index == settingcontroller.settinglist.length - 1
                            ? SvgPicture.asset(po8)
                            : Container(),
                        const SizedBox(
                          width: 2,
                        ),
                        mediumText(
                            settingcontroller.settinglist[index], black, 14),
                        const Spacer(),
                        SvgPicture.asset(arrow)
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  selectlanguage() {
    return Get.bottomSheet(
      isScrollControlled: true,
      Container(
        padding: const EdgeInsets.all(10.0),
        decoration: const BoxDecoration(
            color: white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30))),
        height: Get.height * .80,
        width: Get.width,
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                semiBoldText("Cancel", white, 14),
                semiBoldText("Select Language", black, 22),
                InkWell(onTap: (){
                  Get.back();
                },child: semiBoldText("Cancel", blue, 14)),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            textfield(),
            const SizedBox(
              height: 15,
            ),
            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              separatorBuilder: (context, index) => const Divider(
                color: grey,
              ),
              shrinkWrap: true,
              itemCount: addprofilecontroller.languagelist.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: GestureDetector(
                  onTap: () {
                    if (addprofilecontroller.emptylist.contains(index)) {
                      addprofilecontroller.emptylist.remove(index);
                    } else {
                      addprofilecontroller.emptylist.add(index);
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      mediumText(
                          addprofilecontroller.languagelist[index], black, 16),
                      Obx(
                        () => addprofilecontroller.emptylist.contains(index)
                            ? const Icon(
                                Icons.check_box,
                                color: blue,
                              )
                            : const Icon(
                                Icons.check_box_outline_blank,
                                color: blue,
                              ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget textfield() {
    return TextFormField(
      style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: white,
          fontFamily: "Roboto-Medium"),
      decoration: InputDecoration(
        fillColor: blue,
        filled: true,
        prefixIconConstraints:
            const BoxConstraints(maxHeight: 50, maxWidth: 50),
        prefixIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: SvgPicture.asset(search),
        ),
        border: UnderlineInputBorder(
            borderSide: const BorderSide(color: blue),
            borderRadius: BorderRadius.circular(10)),
        enabledBorder: UnderlineInputBorder(
            borderSide: const BorderSide(color: blue),
            borderRadius: BorderRadius.circular(10)),
        focusedBorder: UnderlineInputBorder(
            borderSide: const BorderSide(color: blue),
            borderRadius: BorderRadius.circular(10)),
        hintText: "Search",
        hintStyle: const TextStyle(
          fontSize: 14,
          fontFamily: "Roboto-Medium",
          fontWeight: FontWeight.w400,
          color: white,
        ),
      ),
    );
  }

  deletealert() {
    return showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0)), //this right here
            child: Container(
              height: 227,
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
                    semiBoldText("Delete Account", black, 22,
                        maxline: 2, align: TextAlign.center),
                    const SizedBox(
                      height: 15,
                    ),
                    mediumText("Are you sure you want to delete your account?",
                        grey, 14,
                        maxline: 2,
                        align: TextAlign.center,
                        textoverflow: TextOverflow.ellipsis),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            width: Get.width * .35,
                            child: primaryButton(
                                text: "Cancel",
                                color: lightblue,
                                bordercolor: lightblue,
                                textcolor: black,
                                onpress: () {
                                  Get.back();
                                }),
                          ),
                          SizedBox(
                              width: Get.width * .35,
                              child: primaryButton(
                                  text: "Delete",
                                  color: red,
                                  bordercolor: red,
                                  onpress: () {
                                    // Get.offAll(()=>const SplashScreen());
                                  }))
                        ])
                  ],
                ),
              ),
            ),
          );
        });
  }
}
