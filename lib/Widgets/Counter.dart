import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gas_app/Controllers/HomePageCounsumer.dart';
import 'package:gas_app/Controllers/Supplier_controller.dart';
import 'package:get/get.dart';


class Counter extends StatelessWidget {
  ProductController Productcontroller = Get.put(ProductController());
  HomeCoustomerController homeCoustomerController = Get.put(HomeCoustomerController());
   final bool isCounter; 
  int? counter;
   Counter({required this.isCounter,this.counter});
  //final _counterController = Get.put(CounterController());
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xfff8f8f8),
        borderRadius: BorderRadius.circular(20),
      ),
      width: 150,
      height: 35,
      padding: EdgeInsets.only(top: 2),
      child: 
         Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            MaterialButton(
              onPressed: () {
                if(isCounter){
                    homeCoustomerController.descrment(counter!);
                }else{
                  Productcontroller.descrment();
                }
              //  _counterController.decrement();
              },
              child: Text(
                "-",
                style: TextStyle(fontSize: 20),
              ),
              minWidth: 10,
            ),
            isCounter == false? 
            GetX<ProductController>(
              init: ProductController(),
              builder: (controller) {
              return Text("${controller.filedControl}");
            },
            ):GetX<HomeCoustomerController>(
              init: HomeCoustomerController(),
              builder: (controller) {
                
              return Text("${controller.listProducts[counter!].quantityP}");
            },), 
            MaterialButton(
              onPressed: () {
               /// _counterController.increment();
               /// 
               if(isCounter){
              homeCoustomerController.incrment(counter!);
               }else{
                Productcontroller.incrment();
               }
            },
              child: Text(
                "+",
                style: TextStyle(fontSize: 20),
              ),
              minWidth: 10,
            ),
          ],
        ),
      );
    
  }
}