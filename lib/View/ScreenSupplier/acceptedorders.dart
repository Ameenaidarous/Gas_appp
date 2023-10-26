import 'package:flutter/material.dart';
import 'package:gas_app/Static/ColorNam.dart';
import 'package:get/get.dart';
import '../../Controllers/OrdersSuppController.dart';
import '../../Static/StatusRequest.dart';
import '../../Static/TextNames.dart';
import '../../model/iteam_list.dart';
import '../ScreenConsumer/datalisOrder.dart';
import '../ScreenConsumer/orderdetailes.dart';

class Acceptoder extends StatelessWidget {
  OrdersSuppController ordersSuppController = Get.put(OrdersSuppController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        
        body: SafeArea(
         
              child: 
              GetBuilder<OrdersSuppController> (
              
      builder: (controller) {
                if(controller.statusRequest==StatusRequest.lodaing){
                  return Center(child: Card(
            elevation: 20,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
            child: CircularProgressIndicator(
              color: ColorName.colorblue,
            ),));
                  
                }else if(controller.statusRequest==StatusRequest.faliure || ordersSuppController.listordersComplete.isEmpty)
                {
                  return Center(child:Text("no"),);
                }
                  return                
              ListView.builder(
                  itemCount: ordersSuppController.listordersComplete.length,
                  itemBuilder: (context, i) {
                    DateTime  dateTime = DateTime.parse(ordersSuppController.listordersComplete[i].createDate.toString());
                    String s = ordersSuppController.convertdate(dateTime);
                    return  Padding(
                      padding: const EdgeInsets.all(15),
                      child: Card(
                                color: Color.fromARGB(255, 247, 247, 248),
                                elevation: 15,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                              child:  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 15,right: 15),
                                        child: Row(
                                          children: [
                                             Text(TextNames.ordernaber,
                                                      style:
                                                          TextStyle(fontSize: 20)),
                                                  Text(
                                                    "${ordersSuppController.listordersComplete[i].orderId}",
                                                    style: TextStyle(fontSize: 20),
                                                  ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 15,right: 15),
                                        child: Row(children: [
                                          Icon(Icons.person_pin,size: 40,color: ColorName.colorblue,),
                                                Text(ordersSuppController.listordersComplete[i].cousName.toString(),
                                                    style: TextStyle(fontSize: 20)
                                                    ),
                                        ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 15),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                           Row(children: [
                                             Padding(
                                               padding: const EdgeInsets.only(left: 5),
                                               child: Icon(
                                                    Icons.phone,
                                                    size: 30,
                                                    color: ColorName.colorblue,
                                                  ),
                                             ),
                                                Text(
                                                  ordersSuppController.listordersComplete[i].cousPhone.toString(),
                                                  style: TextStyle(fontSize: 20),
                                                ),
                                           ],
                                           ),
                                           Row(children: [
                                              Padding(
                                                padding: const EdgeInsets.only(left: 5),
                                                child: Icon(
                                                      Icons.date_range,
                                                      size: 30,
                                                      color: ColorName.colorblue
                                                    ),
                                              ),
                                                  Text(s,
                                                      style:
                                                          TextStyle(fontSize: 20)
                                                 ),
                                           ],
                                           ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 15),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                           Row(children: [
                                             Padding(
                                               padding: const EdgeInsets.only(left: 5),
                                               child: Text(TextNames.typeservise,style: TextStyle(fontSize: 25),)
                                             ),
                                                Text(
                                                  "${ordersSuppController.listordersNow[i].typeService=="0"?"حجز":"توصيل"}",
                                                  style: TextStyle(fontSize: 20),
                                                ),
                                           ],
                                           ),
                                           Row(children: [
                                              Padding(
                                                padding: const EdgeInsets.only(left: 5),
                                                child: Icon(
                                                      Icons.location_on,
                                                      size: 30,
                                                      color: ColorName.colorblue
                                                    ),
                                              ),
                                                  Text("${ordersSuppController.listordersComplete[i].cousBlockName.toString()}",
                                                      style:
                                                          TextStyle(fontSize: 20)
                                                 ),
                                           ],
                                           ),
                                          ],
                                        ),
                                      ),
                                      
                                      Padding(
                                        padding: const EdgeInsets.only(top: 15,bottom: 15),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                          
                                            ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                foregroundColor: Colors.white,
                                                backgroundColor: ColorName.colorblue,
                                                elevation: 3,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(10)),
                                                minimumSize: Size(180, 40),
                                              ),
                                              onPressed: () {
                                               Get.to(()=>Datalsmyiorder(),arguments: {"orderId":ordersSuppController.listordersComplete[i].orderId,"totalPrice":ordersSuppController.listordersComplete[i].totalPrice});
                                              },
                                              child: Text(
                                                'تفاصيل الطلب',
                                                style: TextStyle(fontSize: 20),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ]),
                              
                              ),
                    );
                     
                  }
                  );
      }
              )   
              
               
        ));
  }
}
