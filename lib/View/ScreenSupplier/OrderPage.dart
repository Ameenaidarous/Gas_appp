/// صفحة عرض الطلبات الى المورد
import 'package:flutter/material.dart';
import 'package:gas_app/Static/ColorNam.dart';
import 'package:gas_app/Widgets/listOrder.dart';
import 'package:get/get.dart';
import '../../Controllers/OrdersSuppController.dart';
import '../../Static/StatusRequest.dart';
import '../../Static/TextNames.dart';
import '../../model/iteam_list.dart';
import '../ScreenConsumer/datalisOrder.dart';

class Order_Page extends StatelessWidget {
  OrdersSuppController ordersSuppController = Get.put(OrdersSuppController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorName.colobeginBackgraoundLogin,
       
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
                  
                }else if(controller.statusRequest==StatusRequest.faliure || ordersSuppController.listordersNow.isEmpty)
                {
                  return Center(child:Text("no"),);
                }
                
                  return                   

              ListView.builder(
                  itemCount: ordersSuppController.listordersNow.length,
                  itemBuilder: (context, i) {
                    DateTime  dateTime = DateTime.parse(ordersSuppController.listordersNow[i].createDate.toString());
                    String s = ordersSuppController.convertdate(dateTime);
                    return Padding(
                      padding: const EdgeInsets.all(15),
                      child: Card(
                              color: Color.fromARGB(255, 247, 247, 248),
                              elevation: 15,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                              child:Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 15,right: 15,left: 15),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                             
                                              children: [
                                                 Text(TextNames.ordernaber,
                                                          style: TextStyle(fontSize: 20)),
                                                      Text(
                                                        "${ordersSuppController.listordersNow[i].orderId}",
                                                        style: TextStyle(fontSize: 20),
                                                      ),
                                              ],
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(left: 0,right: 40),
                                              child: Text("تفاصيل ",style: TextStyle(fontSize: 25),),
                                            ),
                                            InkWell(child: Icon(Icons.arrow_back_ios_new_rounded, size: 30, ),
                                            onTap: (){
                                              Get.to(()=>Datalsmyiorder(),arguments: {"orderId":ordersSuppController.listordersNow[i].orderId,"totalPrice":ordersSuppController.listordersNow[i].totalPrice});
                                            },
                                            
                                            )
                                          ],

                                        ),

                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 15,right: 15),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              
                                              children: [
                                              // Text(
                                              //         TextNames.nameconsumer,
                                              //         style: TextStyle(fontSize: 20),
                                              //       ),
                                              Icon(Icons.person_pin,size: 40,color: ColorName.colorblue,),
                                                    Padding(
                                                      padding: const EdgeInsets.only(right: 15),
                                                      child: Text(ordersSuppController.listordersNow[i].cousName.toString(),
                                                          style: TextStyle(fontSize: 20)
                                                          ),
                                                    ),
                                            ],
                                            ),
                                              Row(
                                              
                                              children: [
                                              // Text(
                                              //         TextNames.nameconsumer,
                                              //         style: TextStyle(fontSize: 20),
                                              //       ),
                                              Icon(Icons.location_on,size: 40,color: ColorName.colorblue,),
                                                    Padding(
                                                      padding: const EdgeInsets.only(left: 15),
                                                      child: Text(ordersSuppController.listordersNow[i].cousBlockName.toString(),
                                                          style: TextStyle(fontSize: 20)
                                                          ),
                                                    ),
                                            ],
                                            ),
                                          ],
                                        ),
                                      ),
                                     
                                      Padding(
                                        padding: const EdgeInsets.only(top: 15,right: 10,left: 10),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                                 
                                              children: [

                                                Padding(
                                                  padding: const EdgeInsets.only(left: 5),
                                                  child: Icon(
                                                        Icons.phone,
                                                        size: 30,
                                                        color:ColorName.colorblue,
                                                      ),
                                                ),
                                             Text(
                                                      "${ordersSuppController.listordersNow[i].cousPhone}",
                                                      style: TextStyle(fontSize: 20),
                                                    ),
                                              ],
                                            ),
                                               Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(left: 5),
                                              child: Icon(
                                                      Icons.date_range,
                                                      size: 30,
                                                      color:
                                                         ColorName.colorblue,
                                                    ),
                                            ),
                                             Text(s,
                                                      style: TextStyle(fontSize: 20)),
                                                  
                                          ],
                                        ),
                                          ],
                                        ),
                                      ),
                                   
                                     Padding(
                                       padding: const EdgeInsets.only(top:10,right: 10,left: 18),
                                       child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                         children: [
                                           Row(
                                            children: [
                                              ///ordersSuppController.listordersNow[i].typeService=="0"?"حجز":"توصيل",
                                            Text(TextNames.typeservise,style: TextStyle(fontSize: 27,color: Colors.black),),
                                              Text("${ordersSuppController.listordersNow[i].typeService=="0"?"حجز":"توصيل"}",style: TextStyle(fontSize: 24),),

                                            ],
                                           ),
                                           Row(
                                        children: [
                                          ///ordersSuppController.listordersNow[i].typeService=="0"?"حجز":"توصيل",
                                          Padding(
                                            padding: const EdgeInsets.only(left: 5),
                                            child: Text('R.Y',style: TextStyle(fontSize: 30),),
                                          ),
                                          Text("${ordersSuppController.listordersNow[i].totalPrice}",style: TextStyle(fontSize: 24),),

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
                                                foregroundColor: Colors.black,
                                                backgroundColor: Color.fromARGB(
                                                    255, 233, 220, 220),
                                                elevation: 3,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(10)),
                                                minimumSize: Size(140, 40),
                                              ),
                                              onPressed: () {
                                               ordersSuppController.orderId = ordersSuppController.listordersNow[i].orderId;
                                               ordersSuppController.cancelOrder();
                                              },
                                              child: Text(
                                                'الغاء الطلب',
                                                style: TextStyle(fontSize: 20),
                                              ),
                                            ),
                                            ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                foregroundColor: Colors.white,
                                                backgroundColor: Colors.greenAccent,
                                                elevation: 3,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(10)),
                                                minimumSize: Size(140, 40),
                                              ),
                                              onPressed: () {
                                                
                                                ordersSuppController.orderId = ordersSuppController.listordersNow[i].orderId;
                                                ordersSuppController.acceptOrder();
                                              },
                                              child: Text(
                                                'تم استلام الطلب',
                                                style: TextStyle(fontSize: 20),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                             
                             
                              ),
                    );
                    
                    
                  }
                  );
  }
  ),
                 
        )
        )
        ;
  }
}
