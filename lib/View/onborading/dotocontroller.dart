import 'package:flutter/material.dart';

import 'package:get/get.dart';


import '../../Controllers/onboradingController.dart';
import '../../Model/iteam_list.dart';
import '../../Static/ColorNam.dart';

class dotoController extends StatelessWidget {
  const dotoController({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnboardingControllerImp>(builder: (controller)=>Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              ...List.generate(onbordinlist.length, 
            (index) =>AnimatedContainer(
              margin: EdgeInsets.only(right: 5),
              duration: 
            const Duration(microseconds: 900),
            height:20,
            width: controller.CurrentPage == index?25:5,
            decoration: BoxDecoration(
              color:ColorName.colorblue,
              borderRadius: BorderRadius.circular(50)
            ),
            
            )
            )
            ],
            )
            );
  }
}