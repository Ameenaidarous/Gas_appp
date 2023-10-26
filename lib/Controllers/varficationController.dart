import 'package:flutter/material.dart';
import 'package:gas_app/Model/CURD.dart';
import 'package:gas_app/Static/Applink.dart';
import 'package:gas_app/Static/StatusRequest.dart';
import 'package:gas_app/TestData/Funcation.dart';
import 'package:gas_app/TestData/TestData.dart';
import 'package:gas_app/View/ScreenConsumer/Config.dart';
import 'package:gas_app/Widgets/Dailog.dart';
import 'package:get/get.dart';

class VarficationController extends GetxController{
  late String phone;
  StatusRequest statusRequest = StatusRequest.none;
  TestData testData = TestData(Get.put(Curd()));
  insertVarfication()async{
    statusRequest = StatusRequest.lodaing;
    var response = await testData.getDataNew(linkUrl: insertVarficationApi, data: {"phone":phone.toString()});
    statusRequest = handlingDataNew(response);
    print(statusRequest);  
    if(statusRequest == StatusRequest.success){
      
       Get.to(()=>VarficationPage());
    }else if(statusRequest == StatusRequest.faliure){
      
      
      if(response["messege"] == "phoneExits"){
        print("-----------------");
       }
    }
  }
  checkPhone(String result,BuildContext context)async{
    statusRequest = StatusRequest.lodaing;
    var response = await testData.getDataNew(linkUrl: checkPhoneApi, data: {"phone":phone.toString(),"varficationCode":result});
    statusRequest = handlingDataNew(response);
    print(statusRequest);  
    if(statusRequest == StatusRequest.success){
        AlertDialog1(title: "",content: "تم التحقق");
        await Future.delayed(Duration(seconds: 2));
        Navigator.pop(context);
        Navigator.pop(context);
        
    }else if(statusRequest == StatusRequest.faliure){
      
      
      if(response["messege"] == "phoneExits"){
        print("-----------------");
       }
    }
  }


  @override
  void onInit() {
    
    super.onInit();
    phone = Get.arguments["phone"];
    insertVarfication();

    
  }

}