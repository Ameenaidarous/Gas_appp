import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../Controllers/onboradingController.dart';
import '../../Model/iteam_list.dart';


class slider extends GetView<OnboardingControllerImp> {
  const slider({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller.pageController,
      onPageChanged: ((value) {

        controller.onPagesChanged(value);
      }),
          itemCount:onbordinlist.length ,
          itemBuilder: ((context, i) {
         return Column(children: [
          Text(onbordinlist[i].title!,style: const TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
         const SizedBox(
            height: 50,
          ),
          Image.asset(onbordinlist[i].images!,width: 200,height: 250,fit: BoxFit.fill,),
          const SizedBox(
            height: 100,
          ),
          Container(
            width: double.infinity,
            alignment: Alignment.center,
            child: Text(onbordinlist[i].body!,textAlign: TextAlign.center,)),
         ],
         );
        }
        )
        );
  }
}