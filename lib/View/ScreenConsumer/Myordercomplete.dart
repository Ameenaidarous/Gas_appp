import 'package:flutter/material.dart';
import 'package:gas_app/Static/TextNames.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import '../../Controllers/OrdersController.dart';
import '../../Model/iteam_list.dart';
import '../../Static/ColorName.dart';
import '../../Static/StatusRequest.dart';
import 'datalisOrder.dart';
class MyOrderComplete extends StatelessWidget {
 final  ordersController=Get.put(OrdersController());
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Color(0xfff6f6f8),
        
        body: GetBuilder<OrdersController>(builder: (controller) {
         if(ordersController.statusRequest==StatusRequest.lodaing){
          return Center(child: Card(
            elevation: 20,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
            child: CircularProgressIndicator(
              color: ColorName.colorblue,
            ),));
         }else{
          return  SafeArea(
          child: Stack(
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only( top: 5),
                    child:  Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                         Row(
                           children: [
                             MaterialButton(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                              //color: ColorName.colorblue,
                              onPressed: (){},child: Text("طلبات  قيد الانتظار ",style: TextStyle(fontSize: 15,color: Colors.black,fontWeight: FontWeight.bold),),
                              ),
                           ],
                         ),
                        
                            Row(
                              children: [
                                MaterialButton(
                                    color: ColorName.colorblue,
                         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                          onPressed: (){},child: Text("طلبات  مكتملة  ",style: TextStyle(fontSize: 15,color: Colors.white,fontWeight: FontWeight.bold),),
                          ),
                              ],
                            ),
                                                        Row(
                              children: [
                                MaterialButton(
                         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                          onPressed: (){},child: Text("طلبات  تم الغاءها ",style: TextStyle(fontSize: 15,color: Colors.black,fontWeight: FontWeight.bold),),
                          ),
                              ],
                            ),
                        ],
                      ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: List.generate(
                          ordersController.listordersComplete.length,
                          (i) => Padding(
                            padding: const EdgeInsets.all(15),
                            child: Card(color : Color.fromARGB(255, 252, 252, 255),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              elevation: 10,
                              child: Row(
                                children: [
                                  
                                  Expanded(
                                    flex: 3,
                                    child: ListTile(
                                      title: Column(
                                        crossAxisAlignment:  CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(top: 5,right: 5),
                                            child: Row(children: [
                                              InkWell(child: Icon(Icons.cancel_sharp,color: Colors.red,size: 30,),
                                              onTap: (){},
                                              
                                              )

                                            ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(right: 5,top: 5),
                                            child: Row(
                                              children: [
                                                Icon(Icons.date_range,size: 25,),
                                                Padding(
                                                  padding: const EdgeInsets.only(right: 3),
                                                  child: Text("${ordersController.listordersComplete[i].createDate}",style: TextStyle( color: Color.fromARGB(255, 175, 169, 169),fontSize: 22, fontWeight: FontWeight.bold,),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                         
                                        ],
                                      ),
                                      subtitle: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(right: 5,top: 5),
                                            child: Row(
                                              children: [
                                                Text(TextNames.ordernaber,style: TextStyle(color:Colors.black,fontSize: 25),),
                                                Padding(
                                                  padding: const EdgeInsets.only(right: 5),
                                                  child: Text( "${ordersController.listordersComplete[i].orderId}", style: TextStyle(color: Color.fromARGB(255, 187, 185, 185),fontSize: 24, fontWeight: FontWeight.bold,)
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(right: 5,top: 5,left: 5),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Row(
                                                
                                                  children: [
                                                    Text(TextNames.pricename,style: TextStyle(fontSize: 22,color: Colors.black,fontWeight: FontWeight.bold),),
                                                   Text(
                                                          "${ordersController.listordersComplete[i].totalPrice}",
                                                          style: TextStyle( color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20,
                                                          ),
                                                        ),
                                                   
                                                  ],
                                                ),
                                                 Row(
                                                
                                                  children: [
                                                    Text(TextNames.typeservise,style: TextStyle(fontSize: 22,color: Colors.black,fontWeight: FontWeight.bold),),
                                                   Text(
                                                          "${ordersController.listordersComplete[i].typeService=="0"?"حجز":"توصيل"}",
                                                          style: TextStyle( color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20,
                                                          ),
                                                        ),
                                                   
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(right: 5,top: 5),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                MaterialButton(
                                                  color: ColorName.colorblue,
                                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                                  onPressed: (){
                                                     Get.to(()=>Datalsmyiorder(),arguments: {"orderId":ordersController.listordersNow[i].orderId,"totalPrice":ordersController.listordersComplete[i].totalPrice});
                                                  },child: Text("تفاصيل",style: TextStyle(fontSize: 22,color: Colors.white),),),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
         } 
        }
      ),
      )
    );
  }
}

//"${ordersController.listordersNow[i].typeService=="0"?"حجز":"توصيل"}"
