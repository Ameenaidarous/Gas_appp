import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gas_app/Model/ProductModel.dart';
import 'package:gas_app/Static/Applink.dart';
import 'package:gas_app/View/ScreenSupplier/Edit_Product.dart';
import 'package:gas_app/Widgets/Dailog.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import '../Model/CURD.dart';
import '../Static/StatusRequest.dart';
import '../TestData/Funcation.dart';
import '../TestData/TestData.dart';
import '../model/iteam.dart';
import '../model/iteam_list.dart';


class ProductController extends GetxController {
  File? imageFile;
  late StatusRequest statusRequest1;
  late StatusRequest statusRequest;
  TestData testData = TestData(Get.put(Curd()));
  RxInt filedControl = 0.obs;
  List<ProductsModel> listProducts = [];
  getImage1(ImageSource imageSource,BuildContext context)async{
      XFile? file1 =await ImagePicker().pickImage(source: imageSource);
      if(file1 != null){
             imageFile = File(file1.path);
      }
      // ignore: use_build_context_synchronously
      
      update();
   }
   void incrment(){
    filedControl.value++;
   }
  void descrment(){
    if(filedControl.value != 0)
    filedControl.value--;
   }
   void clearImage(){
    imageFile = null;
    update();
   }
  
  getDataProducts(String id) async{
      
      statusRequest = StatusRequest.lodaing;
      
      var response = await testData.getData(linkUrl: productsBySuplierApi, data: {
        "id":id,
        
      });
      statusRequest = handlingData(response);
      if(statusRequest == StatusRequest.success){
      
        List l  = response["data"];
        
        listProducts.clear();
        l.forEach((element) {
          listProducts.add(ProductsModel.fromJson(element));
        });
        
        
        //GetStorage storage =  GetStorage();
        // storage.write(ControllerCounsumer.id,coustmerModel!.id);
        // storage.write(ControllerCounsumer.istypeUser,coustmerModel!.istypeUser);
        
      
      }
      update();
  }
  
  EditProduct(String name,String des,price) async{
      
      //statusRequest = StatusRequest.lodaing;
      
      var response = await testData.getData(linkUrl: updateProductApi, data: {
        "productId":listProducts[EditProductPage.indexProduct].id,
        "productName": name,
        "description": des,
        "price": price,
        "quntity": filedControl.value.toString(),
        "productImageName":listProducts[EditProductPage.indexProduct].image,
        
        
        
      });
      
      statusRequest1 = handlingData(response);
      print("--------------------");
      print(filedControl.value.toString());
      if(statusRequest == StatusRequest.success){
        return true;
        
        
        
        
        //GetStorage storage =  GetStorage();
        // storage.write(ControllerCounsumer.id,coustmerModel!.id);
        // storage.write(ControllerCounsumer.istypeUser,coustmerModel!.istypeUser);
        
      
      }
      update();
  }
  deleteProduct(String id)async{
    statusRequest = StatusRequest.lodaing;
    update();
      var response = await testData.getData(linkUrl: deleteProductApi, data: {
        "id":id,
        
      });
      statusRequest = handlingData(response);
      if(statusRequest == StatusRequest.success){
        getDataProducts("1");
        return AlertDialog1(title: "",content: "تم الحذف بنجاح");
        
  }
  }
  @override
  void onInit() {
    getDataProducts("1");
    super.onInit();
  }

}