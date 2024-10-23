

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';


import '../../../constant/backbutton.dart';
import '../../../constant/colors.dart';
import '../../../constant/images.dart';
import '../../../constant/textwidget.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: white,

      appBar: AppBar(
        surfaceTintColor: white,
        backgroundColor: white,
        leading: backIconButton(),
        title: semiBoldText("Notification", black, 22),
      ),
body: Padding(
  padding: const EdgeInsets.symmetric(horizontal: 16.0),
  child: ListView(
    physics:const BouncingScrollPhysics(),
    children: [
                  semiBoldText("Today", black, 16),
              const SizedBox(
                height: 15,
              ),
              notificationWidget(
                  title: "Your Ride is Confirmed",
                  sub:
                      "Your Auto is on the way, arriving in 10 minutes. Get ready!"),
              const SizedBox(
                height: 15,
              ),
              notificationWidget(
                  title: "Promo Alert!",
                  sub:
                      "Enjoy 20% off your next ride. Book now and save big!"),
              const SizedBox(
                height: 15,
              ),
              semiBoldText("Yesterday", black, 16),
              const SizedBox(
                height: 15,
              ),
              notificationWidget(
                  title: "Ride Completed",
                  sub:
                      "Your journey has ended. Rate your driver and share your experience."),
              const SizedBox(
                height: 15,
              ),
              notificationWidget(
                  title: "New Service Available",
                  sub:
                      "Check out our luxury SUV rides for your next booking adventure!"),
              const SizedBox(
                height: 15,
              ),
              semiBoldText("8 Oct, 2024", black, 16),
              const SizedBox(
                height: 15,
              ),
              notificationWidget(
                  title: "Payment Received",
                  sub:
                      "Your payment was successful. Thank you for choosing Ober for transportation!"),
              const SizedBox(
                height: 15,
              ),
    ],
  ),
),
    );
  }


    Widget notificationWidget({title, sub}) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      // height: 100,
      width: Get.width,
      constraints: const BoxConstraints(minHeight: 100),
      decoration: BoxDecoration(
        color: lightblue,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(
                      notification,
                      height: 50,
                      width: 50,
                    ),
          const SizedBox(
            width: 10,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: Get.width * .65,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    semiBoldText(title, black, 14),
                    mediumText("20m ago", grey, 12)
                  ],
                ),
              ),
              const SizedBox(
                height: 05,
              ),
              SizedBox(
                width: Get.width * .65,
                child: mediumText(sub, grey, 14, maxline: 3),
              )
            ],
          )
        ],
      ),
    );
  }
}