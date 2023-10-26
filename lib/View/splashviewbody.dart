import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import 'onborading/onborading.dart';


class splashviewbody extends StatefulWidget {
  const splashviewbody({super.key});

  @override
  State<splashviewbody> createState() => _splashviewbodyState();
}

class _splashviewbodyState extends State<splashviewbody>with SingleTickerProviderStateMixin {
  AnimationController? animationController;
  Animation<double>? fadingAngin;
  @override
  void initState() {
    super.initState();
    animationController=AnimationController(vsync:this,duration:Duration(milliseconds:600 ),);
    fadingAngin=Tween<double>(begin:-2,end: 1).animate(animationController!)..addListener(() 
    {
      setState(() {
        if(animationController!.isCompleted){
          animationController?.repeat(reverse: true);
          gotonextview();

        }
      }
      );
    }
    );
    animationController?.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FadeTransition(
            opacity:fadingAngin!,
          child: Text("Gas Aplication",style: TextStyle(fontSize: 40,color: Colors.white),))
        ],
        ),
      ),
    );
  }
  
  void gotonextview() {
    Future.delayed(Duration(seconds: 3),(){
      Get.to(()=>Onbordings(),transition:Transition.fade );
    });
  }
}
