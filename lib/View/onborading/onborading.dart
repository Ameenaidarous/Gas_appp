import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import '../../Controllers/onboradingController.dart';
import 'customeButton.dart';
import 'customeslider.dart';
import 'dotocontroller.dart';
class Onbordings extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Get.put(OnboardingControllerImp());
    return Scaffold(
     
      body:SafeArea(child:Column(children: [
        Expanded(
          flex: 3,
          
          child:slider(),         
        ),
        
        Expanded(
          flex:1,
          child: Column(children: [
            dotoController(),
            Spacer(flex: 2,),
            Customebutton()

        ],))
      ],
      ) ,)
    );
  }
}