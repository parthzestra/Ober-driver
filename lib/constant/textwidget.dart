import 'package:flutter/material.dart';


Widget mediumText(text, color, double size,{align, textoverflow,underline =TextDecoration.none,maxline = 1}) => Text(
      text,
      textAlign: align,
       maxLines: maxline,
      style: TextStyle(
          decorationColor: color,
          decoration: underline,
          overflow: textoverflow,
          fontFamily: "Roboto-Medium",
          fontSize: size,
          fontWeight: FontWeight.w500,
          color: color),
    );



Widget semiBoldText(text, color, double size, {align,textoverflow,underline = TextDecoration.none,maxline = 1}) => Text(
      text,
      textAlign: align,
      maxLines: maxline,
      overflow: textoverflow,
      style: TextStyle(
         decorationColor: color,
        decoration: underline,
          fontWeight: FontWeight.w600,
          fontFamily: "Poppins-SemiBold",
          fontSize: size,
          color: color),
    );


Widget boldText(text, color, double size, {align,textoverflow,textline = TextDecoration.none}) => Text(
      text,
      textAlign: align,
       overflow: textoverflow,
      style: TextStyle(
       decoration: textline,
          fontFamily: "Roboto-Bold",
          fontSize: size,
          fontWeight: FontWeight.w700,
          color: color),
    );
