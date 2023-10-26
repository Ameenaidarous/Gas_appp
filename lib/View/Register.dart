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
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../Static/ColorName1.dart';
import '../Static/PageName.dart';
import '../Widgets/textFiledd.dart';
import 'ScreenSheard/loginConsumer.dart';

class RegisterCoustomer extends StatelessWidget {
  TextEditingController nameE = TextEditingController();
  TextEditingController phoneE = TextEditingController();
  TextEditingController passwordE = TextEditingController();
  RegisterCousController registerController = Get.put(RegisterCousController());
  static const String fullName =  "fullName";
  static const String phone1 =  "phone";
  static const String typeCous =  "typeCous";
  static const String isActivePhone=  "cousIsActivePhone";
  static const String cousDoc =  "cousDoc";
  static const String blockId =  "blockId";
  static const String pass1 =  "pass";
  static const String cousImageDoc =  "cousDoc";
  static const String cousImageProfile =  "profile";
  String p(String p){
      if(p.length < 9){
        return "dsdsdsdsdds";
      }
      return "";
  }
  RegisterCoustomer({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff6f6f8),
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text("مرحبا بك",style: TextStyle(color: ColorName.textTitleAuth,fontSize: 40),),
        ),
        backgroundColor: ColorName.beginBackgraoundLogin,
        elevation: 0,
        centerTitle: true,
       
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
        child: GetBuilder<RegisterCousController>(builder: (controller) {
          if(StatusRequest.lodaing == controller.statusRequest){
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
              child: InkWell(onTap: () {
                  Get.bottomSheet(
                  Container(
                      height: perHigh(context, 60),
                      decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(40),topRight: Radius.circular(40)),
                      color: Colors.blue[300],
                      ),
                      
                      child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                      Padding(padding: EdgeInsets.all(10),child: Icon(size: perWidth(context,whidth: 10,),Icons.linear_scale_sharp,color: Colors.white,)),
                      Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Row(
                          children: [
                            Expanded(child: Center(child: InkWell(onTap: ()async {
                            controller.getImageProfile(ImageSource.camera,context);
                            },child: Text("Studio",style: TextStyle(color: Colors.white,fontSize:perWidth(context,whidth: 8,)))))),
                            Expanded(child: Center(child: InkWell(onTap: () async{
                            controller.getImageProfile(ImageSource.camera, context);
                            },child:  Text("Camera",style: TextStyle(color: Colors.white,fontSize:perWidth(context,whidth: 8,)))))),
                            ],
                            ),
                            ),
                            Row(
                                children: [
                                Expanded(child: Icon(Icons.photo_library_outlined,size: perWidth(context,whidth: 20,),color: Colors.white,)),
                                Expanded(child: Icon(Icons.photo_camera_rounded,size: perWidth(context,whidth: 20),color: Colors.white,)),
                                  ],
                                        ),
                                      ],
                                    ),
                                  
                                ));
                              },child: GetBuilder<RegisterCousController>(builder: (controller) {
                                return  controller.imageFileProfile != null? CircleAvatar(backgroundColor: Colors.white,radius:50,backgroundImage:FileImage(controller.imageFileProfile!,)):Container(width: 100, height: 100, 
                                
                                child: CircleAvatar(child: Icon(Icons.camera_alt,color: Colors.white,size: 30,),backgroundColor: Color(0xff929395),)
                                );
                              },), 
                            ),
                   ),
                        
                      
                    
            Expanded(
              flex: perHighInt(context, 0.8),
              child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: 20,),
                  children: [
                    
                    
                    
                    Form(
                      child: Column(
                        children: [
                          TextFiledGas(iconTextFiled: Icons.person_add, labelText: "الاسم الكامل", valid: (p0) {
                            
                          }, 
                          filedControl: nameE,
                          inputType: TextInputType.name,
                          ),
                          TextFiledGas1(iconTextFiled: Icons.phone, labelText: "رقم الجوال",bool1: true, valid: (p0) {
                            
                          },onPressed1: () {
                            if(phoneE.text.isNotEmpty){
                              registerController.sendVarfecation(phoneE.text.toString());
                            }else{
                              Get.snackbar("الرجاء ادخال رقم ", "");
                            }
                          }, 
                          filedControl: phoneE,
                          inputType: TextInputType.number,
                          ),
                          TextFiledGas(iconTextFiled: Icons.lock, labelText: "كلمة المرور", valid: (p0) {
                            
                          }, 
                          filedControl: passwordE,
                          inputType: TextInputType.text,
                          obsText: true,
                          ),
                  
                         ],
                       ) 
                      
                      
                      ),
                      GetX<RegisterCousController>(builder: (controller) {
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
                        
                      },
                      ),
                       
                       GetX<RegisterCousController>(builder: (controller) {
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
                      GetX<RegisterCousController>(builder: (controller) {
                        
                        
                        return Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: DropdownButtonFormField(
                          
                          decoration: InputDecoration(
                            labelText: "حدد حالة المكان",
                            labelStyle: TextStyle(fontSize: 20,color: ColorName.textTextFiled),
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Colors.white)),
                              
                            
                            filled: true,fillColor: Colors.white,
                            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Colors.white),),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Colors.white),
                              
                          )),
                  
                          
                          elevation: 20,
                          
                          value: controller.typeCoustmer.value,
                          items: [HouseOrCoun(0, "منزل"),HouseOrCoun(1, "مطعم")].map((e) => DropdownMenuItem(child: Text(e.name!),value: e.id,)).toList(),
                          onChanged: (value) {
                            controller.typeCoustmer.value = value!;
                            
                            
                            
                            
                          },
                          ),
                        );
                        
                        
                      },),
                      GetBuilder<RegisterCousController>(builder: (controller) {
                              return InkWell(onTap: () {
                                  controller.getImageDoc(ImageSource.camera, context);
                              },child: Container(decoration: BoxDecoration(border: Border.all(color: Colors.black,width: 3)),width: 100,height: 100,child: controller.imageFileDoc == null?  Icon(Icons.document_scanner,size: 60,):Image.file(controller.imageFileDoc!,fit: BoxFit.fill,)));
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
                            RegisterCoustomer.fullName : nameE.text,
                            RegisterCoustomer.pass1: passwordE.text,
                            RegisterCoustomer.phone1:phoneE.text,
                            RegisterCoustomer.typeCous:controller.typeCoustmer.value.toString(),
                            RegisterCoustomer.isActivePhone:"1",
                            RegisterCoustomer.blockId:blockIdPK,
            
                           };
                           bool b = false;
                           if(controller.imageFileDoc != null && controller.imageFileProfile != null){
                              b = await curd.postimage2files(registerApi,map , controller.imageFileDoc!,cousImageDoc,controller.imageFileProfile!,cousImageProfile);
                           }
                           else if(controller.imageFileDoc != null){
                             b =  await curd.postimagefile(registerApi,map , controller.imageFileDoc!,cousImageDoc);
                            }else{
                                 AlertDialog1(content: "",title:("لاتوجد صورة"));
                           }
                            if(b){
                              AlertDialog1(content: "",title:("تم التسجيل بنجاح"),iconData: Icons.done,iconColor: Colors.green,
                              
                              );
                              await Future.delayed(Duration(seconds: 2)
                              );

                               Get.offNamed(PageName.login);
                            }else{
                             
                            AlertDialog1(content: "",title:"خطأ في اسم المستخدم وكلمة المرور",iconData: Icons.done,iconColor: Colors.green,);
                            
                            }
                           
                           
                            
                          
                         }
                      },
                      ),
                       Padding(
                         padding: const EdgeInsets.only(bottom:100,),
                         child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                                    
                                        children: [
                                           Text("   لديك حساب ؟  " ,style: TextStyle(color: Colors.black,fontSize: 22),),
                                          InkWell(
                                              child: Text("تسجيل الدخول",style: TextStyle(color: ColorName.colorblue,fontSize: 20),),
                                              onTap: (){
                                                Get.to(Login());
                                              },
                                            ),
                                        ],
                                      ),
                       ),
                      
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