
import 'package:flutter/material.dart';
import '../../../constant/backbutton.dart';
import '../../../constant/colors.dart';
import '../../../constant/textwidget.dart';

class PrivacyPolicyScreen extends StatefulWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  State<PrivacyPolicyScreen> createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: white,
      appBar: AppBar(

        backgroundColor: white,
        surfaceTintColor: white,
        leading: backIconButton(),
        title: semiBoldText("Privacy Policy", black, 22),
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView(physics:const BouncingScrollPhysics(),children: [
             const SizedBox(
                                height: 12,
                              ),
                              semiBoldText("Information We Collect From You", black , 18),
                                const SizedBox(
                                height: 16,
                              ),
                              Padding(
                                    padding: const  EdgeInsets.only(left:0),
                                child: mediumText(
                                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut ullamcorper tortor vel semper maximus. Nam volutpat, magna vitae pharetra dictum, dolor magna tempor velit, nec varius libero lectus id odio. Nulla facilisi.",
                                     grey,
                                14,maxline: 4),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Padding(
                                 padding:  const EdgeInsets.only(left:0),
                                child: mediumText(
                                    "\u2022 Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed quis semper odio, vel hendrerit est. Quisque vestibulum, mi id commodo pulvinar, nisi libero bibendum quam, ut faucibus tortor est id dui. ",
                                     grey,
                                 14,maxline: 4),
                              ),
                              Padding(
                                    padding:const  EdgeInsets.only(left:0),
                                child: mediumText(
                                    "\u2022 Cras porttitor placerat ipsum, vel tincidunt odio volutpat non. Proin nec ipsum non ante lobortis rhoncus eu non urna.",
                                     grey,
                                  14,maxline: 4),
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              semiBoldText("Services & Offers", black , 18),
                              const SizedBox(
                                height: 12,
                              ),
                              Padding(
                        padding: const  EdgeInsets.only(left:0),
                                child: mediumText(
                                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut ullamcorper tortor vel semper maximus. Nam volutpat, magna vitae pharetra dictum, dolor magna tempor velit, nec varius libero lectus id odio. Nulla facilisi.",
                                     grey,
                              14,maxline: 4),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Padding(
                                    padding:const   EdgeInsets.only(left:0),
                                child: mediumText(
                                    "\u2022 Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed quis semper odio, vel hendrerit est. Quisque vestibulum, mi id commodo pulvinar, nisi libero bibendum quam, ut faucibus tortor est id dui. ",
                                     grey,
                                   14,maxline: 4),
                              ),
                              Padding(
                                    padding:const   EdgeInsets.only(left:0),
                                child: mediumText(
                                    "\u2022 Cras porttitor placerat ipsum, vel tincidunt odio volutpat non. Proin nec ipsum non ante lobortis rhoncus eu non urna.",
                                     grey,
                               14,maxline: 4),
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                             semiBoldText("Service Free ", black , 18),
                              const SizedBox(
                                height: 12,
                              ),
                              Padding(
                                     padding: const  EdgeInsets.only(left:0),
                                child: mediumText(
                                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut ullamcorper tortor vel semper maximus. Nam volutpat, magna vitae pharetra dictum, dolor magna tempor velit, nec varius libero lectus id odio. Nulla facilisi.",
                                     grey,
                               14,maxline: 4),
                              ),
                            const   SizedBox(height: 50,),
          ],),
      ),
    );
  }
}