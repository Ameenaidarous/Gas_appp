import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import '../Static/ColorName.dart';
import '../Static/PageName.dart';

class scrrenview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorName.colorblue,

      body: Center (child: Container(
        
        child: Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Column(children: [
           Image.asset("Assets/imagess/Logo.png",height:350, fit: BoxFit.cover,),

           Text("غاز المكلا",style: TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.bold )),
            
            Padding(
              padding: const EdgeInsets.only(top: 100),
              child: MaterialButton(
                color:Color(0xfff4911a),
                padding: EdgeInsets.symmetric(horizontal:70,vertical: 7),
                onPressed:(){
                 Get.offNamed(PageName.login);
                },
                child:Text("مستخدام العميل",style: TextStyle(color:Colors.white,fontSize: 23,fontWeight: FontWeight.bold),)
                
                ),
            ),
            
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: MaterialButton(
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 80,vertical: 7),
              onPressed:(){
                Get.offNamed(PageName.LoginSupp);
              },child:Text("مستخدام مورد",style: TextStyle(color:Color(0xfff4911a),fontSize: 23,fontWeight: FontWeight.bold),)
           ),
            ),
          ],
          ),
        ),
      ),
      )
    );
  }
}
