import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gas_app/Model/OrdersModel.dart';
import 'package:get/get.dart';

import '../Controllers/OrdersSuppController.dart';
import '../Static/StatusRequest.dart';

class ListOrders extends StatelessWidget {
  List<OrdersModel> list;
  Widget widget;
  ListOrders({required this.list,required this.widget});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrdersSuppController> (
      
      builder: (controller) {
                if(controller.statusRequest==StatusRequest.lodaing){
                  return Center(child: CircularProgressIndicator(),);
                  
                }else if(controller.statusRequest==StatusRequest.faliure)
                {
                  return Center(child:Text("no"),);
                }
                  return  widget;                 

                
              },);
  }
}