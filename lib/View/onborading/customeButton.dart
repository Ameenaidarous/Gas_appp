import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import '../../Controllers/onboradingController.dart';
import '../../Static/ColorNam.dart';

class Customebutton extends GetView<OnboardingControllerImp> {
  const Customebutton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
              margin: EdgeInsets.only(bottom: 35),
              height: 50,
              color: ColorName.colorblue,
              child: MaterialButton(
              onPressed: (){
                controller.next();
              },child: Text("تخطي"),
              padding: EdgeInsets.symmetric(horizontal: 100,vertical: 0),
              textColor: Colors.white,
              ),
              );
  }
}
