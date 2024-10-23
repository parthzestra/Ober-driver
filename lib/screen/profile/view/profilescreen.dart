import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:ober_driver_app/screen/profile/view/earningscreen.dart';
import 'package:ober_driver_app/screen/profile/view/settingscreen.dart';

import '../../../constant/backbutton.dart';
import '../../../constant/colors.dart';
import '../../../constant/images.dart';
import '../../../constant/primarybutton.dart';
import '../../../constant/textwidget.dart';
import '../../home/view/notificationscreen.dart';
import '../../splashscreen/view/splashscreen.dart';
import '../controller/profilecontroller.dart';
import 'aboutUsscreen.dart';
import 'editprofilescreen.dart';
import 'privacypolicyscreen.dart';
import 'termsandconditionscreen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var profilecontroller = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        surfaceTintColor: white,
        backgroundColor: white,
        leading: backIconButton(),
        title: semiBoldText("My Profile", black, 22),
      ),
      body: SizedBox(
        height: Get.height,
        width: Get.width,
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Image.asset(
                    profile,
                    height: 80,
                    width: 80,
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      semiBoldText('Yarewan Williomson', black, 16),
                      mediumText("+12 125 126 325", grey, 14),
                      mediumText("yarewilli256@gmail.com", grey, 14),
                    ],
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => const EditProfileScreen());
                    },
                    child: SvgPicture.asset(
                      edit,
                      height: 35,
                      width: 35,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Dash(
                direction: Axis.horizontal,
                length: Get.width,
                dashLength: 4,
                dashThickness: 1,
                dashColor: blue),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: profilecontroller.profilelist.length,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    if (index == 0) {
                      Get.to(() => const EarningScreen());
                    } else if (index == 1) {
                      Get.to(() => const SettingScreen());
                    } else if (index == 2) {
                      Get.to(() => const NotificationScreen());
                    } else if (index == 3) {
                      Get.to(() => const AboutUsScreen());
                    } else if (index == 4) {
                      Get.to(() => const PrivacyPolicyScreen());
                    } else if (index == 5) {
                      Get.to(() => const TermsAndConditionScreen());
                    } else if (index == 6) {
                      logoutalert();
                    }
                  
                  },
                  child: profilelistWidget(
                      name: profilecontroller.profilelist[index]['name'],
                      img: profilecontroller.profilelist[index]['img']),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget profilelistWidget({img, name}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        height: 50,
        width: Get.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: lightblue),
        child: Row(
          children: [
            SvgPicture.asset(img),
            const SizedBox(
              width: 10,
            ),
            mediumText(name, black, 14),
            const Spacer(),
            SvgPicture.asset(arrow),
          ],
        ),
      ),
    );
  }

  logoutalert() {
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
                    semiBoldText("Log out", black, 22,
                        maxline: 2, align: TextAlign.center),
                    const SizedBox(
                      height: 15,
                    ),
                    mediumText(
                        "Logout will not delete any data. You can still log in with this account.",
                        grey,
                        14,
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
                                onpress: () {
                                  Get.back();
                                },
                                text: "Cancel",
                                color: lightblue,
                                bordercolor: lightblue,
                                textcolor: black),
                          ),
                          SizedBox(
                              width: Get.width * .35,
                              child: primaryButton(
                                  text: "Log out",
                                  onpress: () {
                                    Get.offAll(() => const SplashScreen());
                                  }))
                        ])
                  ],
                ),
              ),
            ),
          );
        });
  }

  deletealert() {
    return showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0)), //this right here
            child: Container(
              height: 257,
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
