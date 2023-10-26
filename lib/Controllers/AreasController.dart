import 'package:flutter/material.dart';
import 'package:gas_app/model/iteam.dart';
import 'package:get/get.dart';

import 'dart:io';


import 'package:flutter/material.dart';
import 'package:gas_app/Model/BlockM.dart';
import 'package:gas_app/Model/CURD.dart';
import 'package:gas_app/Static/Applink.dart';
import 'package:gas_app/Static/StatusRequest.dart';
import 'package:gas_app/TestData/TestData.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../Model/AreaModel.dart';
import '../TestData/Funcation.dart';

class AreaCousController extends GetxController{
  
  List l  = [];
  
  TestData testData = TestData(Get.put(Curd()));
  List<BlockM> listBlockDropDown = [];
  late StatusRequest statusRequest;
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


class BlocksController extends GetxController {
  final nameController = TextEditingController();

  var blocks = <Block>[].obs;

  void addBlock() {
    final name = nameController.text.trim();
    if (name.isNotEmpty) {
      blocks.add(Block(name: name, color: ''));
      nameController.clear();
    }
  }

  void deleteBlock(Block block) {
    blocks.remove(block);
  }
}