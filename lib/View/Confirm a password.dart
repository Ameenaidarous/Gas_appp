
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gas_app/Widgets/textFiled.dart';

import '../RepatFunction/ScreenSizes.dart';
import '../RepatFunction/ValidFun.dart';
import '../Static/ColorName.dart';
import '../Static/TextNames.dart';

class MyConfimaPasseord extends StatelessWidget {
  final GlobalKey<FormState> globalKey = GlobalKey();
  final TextEditingController phone = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:ColorName.colobeginBackgraoundLogin,
      appBar: AppBar(
        title: Text("تغير كلمة المرور",style: TextStyle(fontSize: 30),),
        centerTitle: true,
        backgroundColor: ColorName.colobeginBackgraoundLogin,
      ),
      body: Form(child: Container(

        margin: EdgeInsets.symmetric(horizontal: perWidth(context, whidth:8,)
              ),
        child: Padding(
          padding: const EdgeInsets.only(top:100),
          child: Column(children: [

            TextFiledGas(
              labelText: TextNames.labelPhoneAr,iconTextFiled: Icons.phone,obsText: false,inputType: TextInputType.number,
               valid: (val) {
                                    return phoneOrNameFiled(val!,isPhone:true,min: 3,max: 20);
                                    },
                                    filedControl: phone,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 25),
                                      child: TextFiledGas(labelText: TextNames.labelPasswordAr,iconTextFiled: Icons.lock,obsText: true,
                                        valid: (val) {
                                        return phoneOrNameFiled(val!,min: 3,max: 20);
                                        },
                                        filedControl: password,
            
            
            
            ),
                                    ),
             Padding(
               padding: const EdgeInsets.only(top: 25),
               child: TextFiledGas(labelText: TextNames.labelConfimPasswordAr,iconTextFiled: Icons.lock,obsText: true,
                                        valid: (val) {
                                        return phoneOrNameFiled(val!,min: 3,max: 20);
                                        },
                                        filedControl: password,
            
            

            
            
            ),
             ),
            
            

          ],
          ),
        ),
      )
      ),
    
    );
  }
}