import 'dart:convert';

import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:gas_app/Model/cartModel.dart';
import 'package:gas_app/Static/Applink.dart';
import 'package:gas_app/Widgets/Checkout.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../Model/CURD.dart';
import '../Static/ColorNam.dart';
import '../Static/PageName.dart';
import '../Static/StatusRequest.dart';
import '../TestData/Funcation.dart';
import '../TestData/TestData.dart';
import '../Widgets/Dailog.dart';
import 'counsumerController.dart';

class CartController extends GetxController{
  bool isType= false;
  ControllerCounsumer counsumer = Get.put(ControllerCounsumer());
  Color colorDelavery = ColorName.colorblue;
   TestData testData = TestData(Get.put(Curd()));
   late StatusRequest statusRequest;
   GetStorage storage = GetStorage();
   CartModel? cart;
   List list = [];
   getCart() async{
      
      statusRequest = StatusRequest.lodaing;
      
      var response = await testData.getData(linkUrl: viewCartApi, data: {
        "cousId":storage.read(ControllerCounsumer.id),
        
      });
      statusRequest = handlingData(response);
      print(statusRequest);
      if(statusRequest == StatusRequest.success){
        
        cart = CartModel.fromJson(response["data"]);
        
      }
      update();
      }
      updateCart(int index)async{
        
        statusRequest=StatusRequest.lodaing;
        update();
        var response=await testData.getData(linkUrl: updataCartApi, data:{
        "cpId":cart!.products![index].cptId,
        "quantity":cart!.products![index].quantity
        }
        );
        
        statusRequest=handlingData(response);
        
        if(statusRequest==StatusRequest.success){
          
          getCart();
        }
        update();
      }
      deleteCart(String cpId)async{
        
        statusRequest=StatusRequest.lodaing;
        update();
        var response=await testData.getData(linkUrl: deleteCartApi, data:{
        "cpId": cpId,
        
        }
        );
        
        statusRequest=handlingData(response);
        //print(statusRequest);
        if(statusRequest==StatusRequest.success){
          
          getCart();
        }
        update();
      }

      int returnTypeVal(){
        if(isType){
          return 1;
        }
        return 0;
      }

      checkout()async{
        //print(cart!.products![0].productId);
        
        
        statusRequest = StatusRequest.lodaing;
        var response = await testData.getData(linkUrl: addOrderApi, data: {
          "cart":jsonEncode(cart!.products!),
          "isType": returnTypeVal().toString(),
          "cousId":storage.read(ControllerCounsumer.id), 
        }
        );
        statusRequest=handlingData(response);
        print(statusRequest);
        if(statusRequest==StatusRequest.success){
           //print(statusRequest);
          print(response["data"]);
          //dialog
          AlertDialog1(
            title: "تم تاكيد الطلب ",
            content: "",
            iconData: Icons.done_outline,
            iconColor:Colors.green,
            

          );
          await Future.delayed(Duration(seconds: 2,)
          
          );
          statusRequest = StatusRequest.faliure;
        
        }
        update();

      }
      void type(){
        isType = !isType;
        update();
      }
  @override
  void onInit() {
    getCart();
     
    super.onInit();
  }
}