import 'package:flutter/material.dart';

import '../../../constant/backbutton.dart';
import '../../../constant/colors.dart';
import '../../../constant/textwidget.dart';


class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({super.key});

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: backIconButton(),
        title: semiBoldText("About Us", black, 22),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView(children: [
          semiBoldText("Who We Are?", black, 16),
         const SizedBox(height: 10.0,),
            mediumText(
                "Ober is a premium chauffeur service app designed to provide seamless, luxury transportation experiences at the tap of a button. Whether you're commuting for business or leisure, our fleet of high-end vehicles and professional drivers are here to ensure your journey is smooth, safe, and stylish.",
                grey,
                14,maxline: 6),
                    const SizedBox(height: 10.0,),
        
          semiBoldText("We strive to elevate your travel experience with superior services.",black , 16,maxline: 2)
        ,  const SizedBox(height: 10.0,),
            mediumText(
                "Our mission is to make every ride an exceptional one, combining convenience, reliability, and luxury in a way that redefines urban travel. With Ober, we aim to deliver personalized transportation tailored to your needs, ensuring comfort every step of the way.",
                grey,
                14,maxline: 5),
        const SizedBox(height: 10.0,),
          semiBoldText("Why Choose Ober?",black , 16,maxline: 2) ,
          const SizedBox(height: 15,),
            mediumText("\u2022 Professional, trained chauffeurs.", grey, 14,
                maxline: 4),
            mediumText("\u2022 Wide range of luxury vehicles to choose from", grey, 14,
                maxline: 4),
            mediumText("\u2022 Transparent pricing with no hidden fees.", grey, 14,
                maxline: 4),
            mediumText("\u2022 Easy-to-use app interface for quick bookings.", grey, 14,
                maxline: 4),
            

        ],),
      ),
    );
  }
}