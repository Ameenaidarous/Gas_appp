import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gas_app/Static/ColorName.dart';

class Scrren extends StatelessWidget {
  const Scrren({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor:  Color(0xffeeecf7),
      body: Form(child: Column(children: [
      Padding(
        padding: const EdgeInsets.only(top: 50,),
        child: Center(
          child: Container(
            height:450,
            width: 400,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(25),
            color: Color(0xff1d5ddd),
            ),
            child:Image.asset("Assets/imagess/Logo.png",height: 170,), ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 100),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          MaterialButton(
            padding: EdgeInsets.symmetric(horizontal: 30,vertical: 15),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),side: BorderSide(color: Colors.white,width: 2)),

            onPressed: (){},child: Text("مستخدام العميل",style: TextStyle(fontSize: 20),),
            ),
            MaterialButton(
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 30,vertical: 15),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),

            onPressed: (){},child: Text("مستخدام المورد",style: TextStyle(fontSize: 20),),
            ),

          
        ],),
      )

    ],
    ),
    ),
    );
  }
}