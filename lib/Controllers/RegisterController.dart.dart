import 'dart:io';


import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:gas_app/Model/BlockM.dart';
import 'package:gas_app/Model/CURD.dart';
import 'package:gas_app/Static/Applink.dart';
import 'package:gas_app/Static/PageName.dart';
import 'package:gas_app/Static/StatusRequest.dart';
import 'package:gas_app/Static/TextNames.dart';
import 'package:gas_app/TestData/TestData.dart';
import 'package:gas_app/Widgets/Dailog.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../Model/AreaModel.dart';
import '../TestData/Funcation.dart';
import '../View/ScreenConsumer/Config.dart';

class RegisterCousController extends GetxController{
  
  List l  = [];
  
  TestData testData = TestData(Get.put(Curd()));
  
  List<BlockM> listBlockDropDown = [];
  late StatusRequest statusRequest;
  StatusRequest statusRequest1 = StatusRequest.none;
  List<AreaM>? listArea = [
    // AreaM(id: "-1",name: "اختر المنطقة"),
    // AreaM(id: "1", name: "hello"),
    // AreaM(id: "2",name:  "hello1"),
    // AreaM(id: "3",name:  "hello2"),
    // AreaM(id: "4",name:  "hello3"),
  ];
  List<BlockM>? listBlock = [
    
    // BlockM("1", "o1Block", "1"),
    // BlockM("2", "o2Block", "1"),
    // BlockM("3", "o2Block1", "2"),
    // BlockM("4", "o3Block2", "3"),
    // BlockM("5", "o4Block3", "4"),
    // BlockM("6", "o4Block3", "4"),
  ];
   
   getData()async{
      statusRequest = StatusRequest.lodaing;
      var response = await testData.getData(linkUrl: appLinkInfoArea, data: {});
      statusRequest = handlingData(response);
      if(statusRequest == StatusRequest.success){
          
          l = response["data"]["Area"];
          listArea = [];
          listArea!.add(AreaM(id: "-1",name: "اختر المنطقة"));  
          for (var element in l) {
            
            listArea!.add(AreaM.fromJson(element));
            }
          l = response["data"]["Block"];
          listBlock = [];
          for (var element in l) {
            listBlock!.add(BlockM.fromJson(element));
          }
          
      }
      update();
   }
   getImageProfile(ImageSource imageSource,BuildContext context)async{
      XFile? file1 =await ImagePicker().pickImage(source: imageSource);
      if(file1 != null){
             imageFileProfile = File(file1.path);
      }
      // ignore: use_build_context_synchronously
      Navigator.pop(context);
      update();
   }
  getImageDoc(ImageSource imageSource,BuildContext context)async{
      XFile? file1 =await ImagePicker().pickImage(source: imageSource);
      if(file1 != null){
             imageFileDoc = File(file1.path);
      }
      // ignore: use_build_context_synchronously
      
      update();
   }
   
   registerWith2Images(Map map,String cousImageDoc,String cousImageProfile)async{
    statusRequest1 = StatusRequest.lodaing;
    update();
    var response = await testData.getDataWith2Images(linkUrl:registerApi,data:map,imageFileDoc:imageFileDoc!,cousImageDoc:cousImageDoc,imageFileProfile:imageFileProfile!,cousImageProfile:cousImageProfile);
    statusRequest1 = handlingDataNew(response);
    if(statusRequest1 == StatusRequest.success){
      AlertDialog1(title: "",content: "تم التسجيل");
      await Future.delayed(Duration(seconds: 1));
      Get.toNamed(PageName.login);
    }else if(statusRequest1 == StatusRequest.faliure){
      print("====================");
      print(response);
    
    }else {
      AlertDialog1(content: "لم يتم التسجيل",title: "");
    }
    update();
   }
   sendVarfecation(String phone)async{
      statusRequest = StatusRequest.lodaing;
      update();
      TestData testData = TestData(Get.put(Curd()));
      var response = await testData.getDataNew(linkUrl: insertVarficationApi, data: {
        "phone":phone,
      });
      statusRequest = handlingDataNew1(response);
      print(statusRequest);
      if(statusRequest == StatusRequest.success){
          if(response["status"] == "fill"){
            if(response["messege"] == "phoneExits"){
                Get.snackbar("رقف الهاتف مسجل ","");
            }
          }if(response["status"] == "success"){
            Get.to(()=>VarficationPage(),arguments: {"phone":phone});
          }
        
      // }if(statusRequest == StatusRequest.faliuree){
      //   print("response");
      //   // if(response["messege"] == "phoneExits"){
      //   //     return Get.snackbar("ssss","gggg");
      //   // }
      }
      update();
   }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
  RxInt selectArea = 0.obs;
  RxInt selectBlock = 0.obs;
  RxInt typeCoustmer = 0.obs;
  File?  imageFileProfile;
  File? imageFileDoc;
}