// ignore_for_file: prefer_const_constructors



import 'package:flutter/material.dart';

import 'package:gas_app/Controllers/RegisterController.dart.dart';
import 'package:gas_app/Model/AreaModel.dart';
import 'package:gas_app/Model/BlockM.dart';
import 'package:gas_app/Model/CURD.dart';
import 'package:gas_app/Model/HomeOrCoun.dart';
import 'package:gas_app/RepatFunction/ScreenSizes.dart';
import 'package:gas_app/Static/Applink.dart';
import 'package:gas_app/Static/StatusRequest.dart';

import 'package:gas_app/Widgets/Button.dart';
import 'package:gas_app/Widgets/Dailog.dart';
import 'package:gas_app/Widgets/textFiled.dart';
import 'package:gas_app/Widgets/textFiledd.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';


import '../Controllers/‏‏RegisterControllerSupp.dart';
import '../Static/ColorName1.dart';

class RegisterSupplier extends StatelessWidget {
  TextEditingController nameE = TextEditingController();
  TextEditingController phoneE = TextEditingController();
  TextEditingController passwordE = TextEditingController();
  RegisterControllerSupp registerController = Get.put(RegisterControllerSupp());
  static const String fullName =  "fullName";
  static const String phone1 =  "phone";
  static const String blockId =  "blockId";
  static const String pass1 =  "pass";
  
  
  String p(String p){
      if(p.length < 9){
        return "dsdsdsdsdds";
      }
      return "";
  }
  RegisterSupplier({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text("مرحبا بك",style: TextStyle(color: ColorName.textTitleAuth,fontSize: 40),),
        ),
        backgroundColor: ColorName.beginBackgraoundLogin,
        elevation: 0,
        centerTitle: true,
        leading: Icon(Icons.chevron_left_sharp,size: 30,color: ColorName.textcommon,),
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient:  LinearGradient(
            begin: Alignment.center,
            end: Alignment.bottomCenter,
            tileMode: TileMode.repeated,
            colors: const [ColorName.beginBackgraoundLogin,ColorName.endBackgraoundLogin]
            )
        ),
        child: GetBuilder<RegisterControllerSupp>(builder: (controller) {
          if(StatusRequest.lodaing == controller.statusRequest || controller.statusRequest1 == StatusRequest.lodaing){
            return const Center(child: CircularProgressIndicator(),); 
          }else if(StatusRequest.faliure == controller.statusRequest){
            return const Center(child: Text("No data"),);
          }else if(StatusRequest.serverFalure == controller.statusRequest){
            return const Center(child: Text("falure"),);
          }else if(StatusRequest.offlineFalure == controller.statusRequest){
            return const Center(child: Text("No Internet"),);
          }else if(StatusRequest.otherError == controller.statusRequest){
              return Text("otherError");
          }
          else
          
        // ignore: curly_braces_in_flow_control_structures
        return Column(
          children: [
            
                        
                      
                    
            Expanded(
              flex: perHighInt(context, 0.8),
              child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: 20,),
                  children: [
                    
                    
                    
                    Form(
                      child: Column(
                        children: [
                          TextFiledGas1(iconTextFiled: Icons.person_add,bool1: false, labelText: "الاسم الكامل", valid: (p0) {
                            
                          }, 
                          filedControl: nameE,
                          inputType: TextInputType.name,
                          ),
                          Container(
                            width: 350,
                            child: TextFiledGas1(iconTextFiled: Icons.phone,bool1: false
                            , labelText: "رقم الجوال", valid: (p0) {
                              
                            }, 
                            filedControl: phoneE,
                            inputType: TextInputType.number,
                            ),
                          ),
                          TextFiledGas1(iconTextFiled: Icons.lock,bool1: false, labelText: "كلمة المرور", valid: (p0) {
                            
                          }, 
                          filedControl: passwordE,
                          inputType: TextInputType.text,
                          obsText: true,
                          ),
                  
                         ],
                       ) 
                      
                      
                      ),
                      GetX<RegisterControllerSupp>(builder: (controller) {
                        return Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: DropdownButtonFormField<AreaM>(
                          
                          decoration: InputDecoration(
                            labelText: "المنطقة",
                            labelStyle: TextStyle(fontSize: 20,color: ColorName.textTextFiled),
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20),borderSide: BorderSide(color: Colors.white)),
                              
                            
                            filled: true,fillColor: Colors.white,
                            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20),borderSide: BorderSide(color: Colors.white),),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),borderSide: BorderSide(color: Colors.white),
                              
                              
                            ),
                  
                          ),
                  
                          
                          elevation: 20,
                          
                          value: registerController.listArea![controller.selectArea.value],
                          items: registerController.listArea!.map((e) => DropdownMenuItem(child: Text(e.name!,style:TextStyle(fontSize: 15,color: ColorName.textTextFiled)),value: e,)).toList(),
                          onChanged: (value) {
                            controller.selectArea.value =  controller.listArea!.indexOf(value!);
                            String areaIdPK = controller.listArea![controller.selectArea.value].id!;
                            controller.listBlockDropDown.clear();
                            controller.listBlockDropDown.add(BlockM.withoutFkId("-1", "حدد المربع"));
                            controller.listBlockDropDown.addAll(controller.listBlock!.where((element) => element.areaId == areaIdPK).toList());
                            controller.selectBlock.value = 0;
                          },
                          ),
                        );
                        
                      },),
                       
                       GetX<RegisterControllerSupp>(builder: (controller) {
                        if(registerController.selectArea.value == 0){
                          return Container();
                        }
                        
                        return Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: DropdownButtonFormField(
                          
                          decoration: InputDecoration(
                            labelText: "حدد المربع",
                            labelStyle: TextStyle(fontSize: 20,color: ColorName.textTextFiled),
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Colors.white)),
                              
                            
                            filled: true,fillColor: Colors.white,
                            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Colors.white),),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Colors.white),
                              
                          )),
                  
                          
                          elevation: 20,
                          
                          value: registerController.listBlockDropDown[controller.selectBlock.value],
                          items: registerController.listBlockDropDown.map((e) => DropdownMenuItem(child: Text(e.name!,style:TextStyle(fontSize: 15,color: ColorName.textTextFiled),),value: e,)).toList(),
                          onChanged: (value) {
                            controller.selectBlock.value =  controller.listBlockDropDown.indexOf(value!);
                            
                            
                            
                          },
                          ),
                        );
                        
                        
                      },),
                      
                      ButtonSign(text: "تسجيل",onTap: ()async {
                        //  if(!nameE.text.startsWith("77") || !nameE.text.startsWith("77")){
                        //   return AlertDialog1(content: "");
                        //  }
                         if(registerController.selectArea.value == 0){
                             AlertDialog1(content: "من فضلك حدد المنطقة",iconData: Icons.fact_check_rounded);
                            
                         }else if(registerController.selectBlock.value == 0){
                             AlertDialog1(content: "من فضلك حدد المربع",iconData: Icons.fact_check_rounded);
                            
                         }else{
                           //String areaIdPK = registerController.listArea[registerController.selectArea.value].id;
                           String blockIdPK = registerController.listBlockDropDown[registerController.selectBlock.value].id!;
                           Curd curd = Get.find();
                           Map map = {
                            RegisterSupplier.fullName : nameE.text,
                            RegisterSupplier.pass1: passwordE.text,
                            RegisterSupplier.phone1:phoneE.text,
                            RegisterSupplier.blockId:blockIdPK,
            
                           };
                           registerController.register(map);
                            // if(b){
                            //   AlertDialog1(content: "",title:("تم التسجيل بنجاح"),iconData: Icons.done,iconColor: Colors.green,);
                            // }else{
                             
                            // AlertDialog1(content: "",title:"خطأ في اسم المستخدم وكلمة المرور",iconData: Icons.done,iconColor: Colors.green,);
                            // }
                           
                           
                            
                          
                         }
                      },)
                      
                  ],
                ),
            ),
          ],
        );
        
        {
        }},),
      ),
    );
  }
}