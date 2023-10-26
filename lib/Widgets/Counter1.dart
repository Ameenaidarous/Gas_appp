import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gas_app/Controllers/CartController.dart';
import 'package:gas_app/Controllers/HomePageCounsumer.dart';
import 'package:gas_app/Controllers/Supplier_controller.dart';
import 'package:get/get.dart';


class Counter1 extends StatelessWidget {
  
  CartController cartController = Get.put(CartController());
   
  int? counter;
  int?i;
   Counter1({this.counter, this.i});
  //final _counterController = Get.put(CounterController());
  @override
  Widget build(BuildContext context) {
    return Container(
     decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
       color: Color(0xfff8f8f8),
     ),
     width: 150,
     height: 35,
      child: 
         Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            MaterialButton(
              onPressed: () {
               cartController.updateCart(this.i!);
              //  _counterController.decrement();
              },
              
                
                  elevation: 10,
               
                    child: Text(
                      "-",
                      style: TextStyle(fontSize:25,color: Colors.red),
                    ),
                 
                
              minWidth: 10,
            ),
            GetBuilder<CartController>(
            
              builder: (controller) {
                
              return Text("${counter}",textAlign: TextAlign.center, style: TextStyle(fontSize: 22,color: Colors.black),);
                
               
            },
            ), 
            MaterialButton(
              onPressed: () {
               /// _counterController.increment();
               /// 
               
            },
             
                    child: Text(
                      "+",
                      style: TextStyle(fontSize: 25,color: Colors.red),
                    ),
                
              minWidth: 10,
            ),
          ],
        ),
      );
    
  }
} 