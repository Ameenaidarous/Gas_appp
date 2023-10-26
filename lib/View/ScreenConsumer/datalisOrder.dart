import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:gas_app/Static/StatusRequest.dart';
import 'package:gas_app/Static/TextNames.dart';
import 'package:get/get.dart';
import '../../Controllers/Detalis_Controller.dart';
import '../../Model/iteam_list.dart';
import '../../Static/Applink.dart';
import '../../Static/ColorName.dart';
import '../../Widgets/Counter1.dart';
class Datalsmyiorder extends StatelessWidget {
 OrderdetailesControoler orderdetailesControoler= Get.put(OrderdetailesControoler());
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Color(0xfff6f6f8),
        appBar: AppBar(
          title: Text("تفاصيل طلب",style: TextStyle(fontSize: 23,color: Colors.white),),
          centerTitle: true,
          backgroundColor: ColorName.colorblue,
        ),
        body: SafeArea(
          child: 
          GetBuilder<OrderdetailesControoler>(builder: (controller) {
            if(orderdetailesControoler.statusRequest == StatusRequest.lodaing){
              return Center(child: CircularProgressIndicator(),);
            }
            return 
          
          ListView.builder(itemCount: orderdetailesControoler.ordersDetails!.orders!.length,itemBuilder: (context, index) => 
            Padding(
              padding: const EdgeInsets.all(15),
              child: Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)) ,
              elevation: 15,  
              child:
              Row(children: [
                Container(child:Image.network("$imageProductLink/${orderdetailesControoler.ordersDetails!.orders![index].productImage}",width: 100,height: 100,fit: BoxFit.fill,) ,),
                Expanded(
                  flex: 2,
                child: ListTile(
                  title:
                   
                    Text("${orderdetailesControoler.ordersDetails!.orders![index].productName}"),
                  
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            Text("${orderdetailesControoler.ordersDetails!.orders![index].productDescription}",style: TextStyle(fontSize: 22),),
                          ],
                          ),
                           Padding(
                         padding: const EdgeInsets.only(right: 20),
                         child: Row(children: [
                  Text("${orderdetailesControoler.ordersDetails!.orders![index].quntity}",style: TextStyle(fontSize: 24),)
                      ],
                      ),
                       ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                      
                      Row(children: [
                        
                        Text(TextNames.pricename ,style: TextStyle(fontSize: 22,color: Colors.black),),
                        Text("${orderdetailesControoler.ordersDetails!.orders![index].price}",style: TextStyle(fontSize: 24),),
                      ],
                      )
                    ],
                    )

                  ],
                  ),
                )
                  
                  )
              ],
              )
              ),
            )
          
          );
          },)
        ),
      ),
    );
  }
}
