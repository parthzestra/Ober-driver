import 'package:flutter/material.dart';

import 'colors.dart';


Widget textboxWidget({
  hinttext,
  maxline = 1,
  controller,
  borderradius = 10.0,
}) {
  return SizedBox(
    height: 50,
    
    child: TextFormField(
      
      controller: controller,
      maxLines: maxline,
      style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: black,
          fontFamily: "Roboto-Medium"),
      decoration: InputDecoration(
      
        fillColor: lightblue,
        filled: true,
      
        border:  UnderlineInputBorder(borderSide:const  BorderSide(color: lightblue),borderRadius: BorderRadius.circular(10)),
        enabledBorder:
             UnderlineInputBorder(borderSide:const BorderSide(color: lightblue),borderRadius: BorderRadius.circular(10)),
        focusedBorder:
             UnderlineInputBorder(borderSide:const BorderSide(color: lightblue),borderRadius: BorderRadius.circular(10)),
        hintText: hinttext,
        hintStyle: const  TextStyle(
          
          fontSize: 14,
          fontFamily: "Roboto-Medium",
          fontWeight: FontWeight.w500,
          color: black,
        ),
      ),
    ),
  );
}
