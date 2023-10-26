import 'package:flutter/material.dart';
import 'package:gas_app/Model/CURD.dart';
import 'package:gas_app/Model/CoustomersM.dart';
import 'package:gas_app/Static/Applink.dart';
import 'package:gas_app/Static/StatusRequest.dart';
import 'package:gas_app/TestData/TestData.dart';
import 'package:gas_app/Widgets/Dailog.dart';
import 'package:get/get.dart';

import '../TestData/Funcation.dart';

class MangmentCoustomersController extends GetxController with SingleGetTickerProviderMixin {
  late TabController tabController;
  TestData testData = TestData(Get.put(Curd()));
  int totalCousNotActive = 0;
  int totalCousActive = 0;
  List<CoustmerModelCopy> consumerNotActive = [];
  List<CoustmerModelCopy> consumerActive = [];
  late StatusRequest statusRequest;
  StatusRequest statusRequest1 = StatusRequest.none;
  getAllCoustmer() async{
      
      statusRequest = StatusRequest.lodaing;
      
      var response = await testData.getData(linkUrl: getAllCoustomersApi, data: {
        
        
      });
      statusRequest = handlingData(response);
      
      if(statusRequest == StatusRequest.success){
        consumerActive.clear();
        consumerNotActive.clear();
        dynamic l  = response["data"];
        
        List l2 = [];
        List l3 = [];
        totalCousNotActive = l["totalCousNotActive"];
        totalCousActive = l["totalCousActive"];
        print(totalCousActive);
        if(totalCousNotActive != 0){
          
        List l2 = l["coustmersNotActive"];
        
        l2.forEach((element) { 
          
          consumerNotActive.add(CoustmerModelCopy.fromJson(element));
        });
        
        }if(totalCousActive != 0){
          List l3 = l["coustmersActive"];
          l3.forEach((element) { 
          consumerActive.add(CoustmerModelCopy.fromJson(element));
        });
        
        
        
        
        
        //GetStorage storage =  GetStorage();
        // storage.write(ControllerCounsumer.id,coustmerModel!.id);
        // storage.write(ControllerCounsumer.istypeUser,coustmerModel!.istypeUser);
        
      
      }
      update();
      print("success");
  }
  }
  acceptAndRegect(String id,String title,String content,String numIsActive)async{
      statusRequest1 = StatusRequest.lodaing;
      var response = await testData.getData(linkUrl: checkCustomersApi, data: {
          "id":id,
          "title":title,
          "content":content,
          "sender":"مشرف",
          "NumIsActive":numIsActive,
      });
      statusRequest1 =  handlingData(response);
      if(statusRequest1 == StatusRequest.success){
        AlertDialog1(content: "تم بنجاح",title: "",iconData: Icons.done,iconColor: Colors.green);
        await Future.delayed(Duration(seconds: 1));
        getAllCoustmer();
        update();
      }else if(statusRequest1 == StatusRequest.faliure){
          return AlertDialog1(content: "لم تتم العملية بنجاح",title: "",iconData: Icons.close,iconColor: Colors.red);
  }else{
    return AlertDialog1(content: "لم تتم العملية بنجاح",title: "tttttttt",iconData: Icons.close,iconColor: Colors.red);
  }
  }
  String  ConvertFromDataTimeto(i){
    DateTime dateTime = DateTime.parse(consumerActive[i].openAcount.toString());
    String y = dateTime.year.toString();
    String m = dateTime.month.toString();
    String d = dateTime.day.toString();
     return "$y-$m-$d";
  }
  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 2, vsync: this,initialIndex: 0);
    getAllCoustmer();
  }

  
}
