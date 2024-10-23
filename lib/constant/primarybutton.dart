import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ober_driver_app/constant/textwidget.dart';

import 'colors.dart';


Widget primaryButton({
  color = blue,
  bordercolor = blue,
  textcolor = white,
  onpress,
  text,
}) {
  return GestureDetector(
    onTap: onpress,
    child: Container(
      height: 60,
      width: Get.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: color,
          border: Border.all(color: bordercolor)),
      child: Center(child: semiBoldText(text, textcolor, 16)),
    ),
  );
}
