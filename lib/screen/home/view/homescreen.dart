import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:ober_driver_app/constant/colors.dart';
import 'package:ober_driver_app/constant/images.dart';
import 'package:ober_driver_app/constant/textwidget.dart';
import 'package:ober_driver_app/screen/home/controller/homcontroller.dart';
import 'package:ober_driver_app/screen/profile/view/profilescreen.dart';
import 'homeonllinescreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var homecontroller = Get.put(HomeController());
  final _controller01 = ValueNotifier<bool>(false);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        SizedBox(
          height: Get.height,
          width: Get.width,
          child: Image.asset(
            map,
            fit: BoxFit.fill,
          ),
        ),
        Positioned(
          left: 10,
          right: 10,
          top: 20,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                  onTap: () {
                    Get.to(() => const ProfileScreen());
                  },
                  child: SvgPicture.asset(pp)),
              Obx(
                () => semiBoldText(
                    homecontroller.isonline.value ? 'Online' : 'Offline',
                    black,
                    22),
              ),
              AdvancedSwitch(
                onChanged: (value) {
                  homecontroller.isonline.value = value;
                },
                activeColor: blue,
                inactiveColor: grey,
                width: 45,
                height: 20,
                controller: _controller01,
              ),
            ],
          ),
        ),
        Positioned(
            left: 20,
            right: 20,
            top: Get.height * .15,
            child: SvgPicture.asset(circle)),
        Positioned(
          bottom: 0,
          child: Container(
              height: 210,
              width: Get.width,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    blurRadius: 30,
                    color: black.withOpacity(0.15),
                    offset: const Offset(04, -5),
                  )
                ],
                color: white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              child: Obx(() => homecontroller.isonline.value
                  ? onlineWidget()
                  : offlineWidget())),
        )
      ]),
    );
  }

  Widget offlineWidget() {
    return Column(
      children: [
        const SizedBox(
          height: 15,
        ),
        semiBoldText("You are Offline", black, 22),
        const SizedBox(
          height: 10,
        ),
        mediumText(
            "You are currently offline. Push the button \n to go online and start receiving rides.",
            grey,
            14,
            maxline: 2,
            align: TextAlign.center)
      ],
    );
  }

  Widget onlineWidget() {
    return GestureDetector(
      onTap: () {
        Get.to(() => const HomeOnlineScreen());
      },
      child: Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          semiBoldText("Waiting for Customer's Order", black, 22),
          const SizedBox(
            height: 10,
          ),
          mediumText(
              "Waiting for the customer's order to be \nready.", grey, 14,
              maxline: 2, align: TextAlign.center)
        ],
      ),
    );
  }
}
