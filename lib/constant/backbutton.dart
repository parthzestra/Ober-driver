import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:ober_driver_app/constant/colors.dart';

Widget backIconButton({iconcolor = white,color = blue}) {
  return IconButton(
  onPressed: () {
      Get.back();
    },
    icon: Container(
        height: 35,
        width: 35,
        decoration:  BoxDecoration(shape: BoxShape.circle, color: color),
        child:  Center(
            child: Icon(
          Icons.arrow_back_ios_new_rounded,
          color: iconcolor,
          size: 18,
        ),
        ),
        ),
  );
}
