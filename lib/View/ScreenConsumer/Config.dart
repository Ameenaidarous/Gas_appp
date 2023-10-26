
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gas_app/Controllers/varficationController.dart';
import 'package:gas_app/Static/ColorNam.dart';
import 'package:gas_app/Widgets/Button.dart';
import 'package:gas_app/Widgets/TextfiledConfig.dart';
import 'package:get/get.dart';



class VarficationPage extends StatelessWidget {
  TextEditingController textEditingController1 = TextEditingController();
  TextEditingController textEditingController2 = TextEditingController();
  TextEditingController textEditingController3 = TextEditingController();
  TextEditingController textEditingController4 = TextEditingController();
  TextEditingController textEditingController5 = TextEditingController();
  VarficationController varficationController = Get.put(VarficationController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 238, 238, 240),
      body: SingleChildScrollView(child:
      
      Column(children: [
       Image.asset("Assets/imagess/Logo.png"),
      Text("التحقق",style: TextStyle(color: Colors.black,fontSize: 30,fontWeight: FontWeight.bold),
      ),
      Text("ادخل رمز التحقق  عبر واتس ",style: TextStyle(fontSize: 20)),
      Text(varficationController.phone,style: TextStyle(fontSize: 20),
      ),
      Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
          Row(children: [
            TextfiledConfig(textEditingController1),
          ],
          ),
          Row(children: [
            TextfiledConfig(textEditingController2),
          ],
          ),
            Row(children: [
            TextfiledConfig(textEditingController3),
          ],
          ),
           Row(children: [
            TextfiledConfig(textEditingController4),
          ],
          ),
          Row(children: [
            TextfiledConfig(textEditingController5),
          ],
          ),
        ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 10),
        child: ButtonSign( 
          text: "التحقق",
          onTap: (){
              String resulut = textEditingController5.text+textEditingController4.text+textEditingController3.text+textEditingController2.text+textEditingController1.text;
              varficationController.checkPhone(resulut,context);
          },
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 10,left: 10,right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(" لم يتم ارسل  رقم التحقق  ؟  ",style: TextStyle(fontSize: 20),),
            Text("ارسال مز حديد",style: TextStyle(fontSize: 20,color: ColorName.colorblue),)
          ],
        ),
      ),
      
      

      ],
      )
       ),
    );
  }
}