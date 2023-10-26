import 'package:flutter/material.dart';
import 'package:gas_app/Controllers/CartController.dart';
import 'package:gas_app/Controllers/HomePageCounsumer.dart';
import 'package:gas_app/Controllers/counsumerController.dart';
import 'package:gas_app/Static/Applink.dart';
import 'package:gas_app/Static/StatusRequest.dart';
import 'package:gas_app/Widgets/Counter.dart';
import 'package:photo_view/photo_view.dart';
import '../../Controllers/Notifications.dart';
import '../../Model/iteam_list.dart';
import '../../Static/ColorName.dart';
import '../../Static/TextNames.dart';
import '../../Widgets/notification.dart';
import 'package:get/get.dart';
import 'package:badges/badges.dart';

import 'Product.dart';

class HomePageCoustomer extends StatelessWidget {
 final quantityController = TextEditingController();
 ControllerCounsumer counsumer = Get.put(ControllerCounsumer());
 HomeCoustomerController homeCoustomer = Get.put(HomeCoustomerController());
 CartController cartController = Get.put(CartController());
 NotificationsController notificationsController = Get.put(NotificationsController());
  @override
  Widget build(BuildContext context) {
   
  //  if(homeCoustomer.statusRequest == StatusRequest.lodaing){
  //   return Center(child:CircularProgressIndicator());
  //  } else{
   
   return GetBuilder<HomeCoustomerController>(builder: (controller) {
   if(homeCoustomer.statusRequest == StatusRequest.lodaing || HomeCoustomerController.statusRequest1 == StatusRequest.lodaing){
    return Scaffold(
      appBar: AppBar(
        title: const Text("الرئسية",style: TextStyle(fontSize: 25,color: Colors.black),),
        elevation: 0,
      
        
        centerTitle: true,
        backgroundColor: ColorName.colobeginBackgraoundLogin, 
      ),
      body: const Center(child: CircularProgressIndicator(
        color: ColorName.colorblue,
      ),));
   }  
   return Scaffold(
      backgroundColor: ColorName.colobeginBackgraoundLogin,
      appBar: AppBar(
        title: const Text("الرئسية",style: TextStyle(fontSize: 25,color: Colors.black),),
        elevation: 0,
        
        centerTitle: true,
        
        actions: [
      notificationsController.totalNotification=="0"? 
        IconButton(icon: const Icon(Icons.notifications,size: 22,color: Colors.black,), onPressed: () {
      Get.to(()=> Notificationss());
     }
     )
      :Badge(
     position: BadgePosition.topEnd(top: 0, end: 3),
     animationType: BadgeAnimationType.slide,
     badgeContent:  Text('${notificationsController.totalNotification}', style: const TextStyle(color: Colors.white)),
     child: IconButton(icon: const Icon(Icons.notifications,size: 22,color: Colors.black,), onPressed: () {
      Get.to(()=> Notificationss());
     }
     ),
   )
       ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(30.0),
          child: Padding(
            padding: const EdgeInsets.only(right: 15,),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 0,left: 15,bottom: 5),
                  child: Text(counsumer.coustmerModel!.name!,
                  style: const TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
              ),
                ),
               Transform.scale(
                    scale:1,
                    child: InkWell(child: counsumer.coustmerModel!.isImageDoc != null? Padding(
                      padding: const EdgeInsets.only(left: 10,bottom: 5,top: 0),
                      child: CircleAvatar( radius: 25, backgroundImage:NetworkImage("$imageDocLink/${counsumer.coustmerModel!.isImageDoc}"),),
                    ):const CircleAvatar(backgroundImage:AssetImage("Assets/imagess/m.png"),),
                    onTap: (
                        
                    ){
                      
                      
                    },
                    ),
                  ),
              ]
            ),
          ),
        ),
        backgroundColor: ColorName.colobeginBackgraoundLogin, 
      ),
      body: SafeArea(child:RefreshIndicator(
        onRefresh: () {
          return homeCoustomer.getDataProducts();
        },
        backgroundColor: Colors.red,
        
        child: Column(
          children: [
            
            Expanded(
              
              child: Padding(
                padding: const EdgeInsets.only(left: 10,right: 10,top: 15),
                child: homeCoustomer.listProducts.length == 0?const Center(child: Text("empty"),):GridView.builder(
                  itemCount: homeCoustomer.listProducts.length,
                  gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 16.0,
                          mainAxisSpacing: 16.0,
                          mainAxisExtent:320,
                        ) , itemBuilder:(context,index){
                  return Card(
                    elevation: 15,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    child: Column(children: [
                      Container(
                            padding: const EdgeInsets.only(top: 15),
                            // في حال لم يجد صورة من السرفر سوف يرجع خطأ 404 تلقائيا
                            child: Image.network("$imageProductLink/${homeCoustomer.listProducts[index].image}",width:100,fit: BoxFit.fill,height: 100,)),
                      SizedBox(
                        child: Text("${homeCoustomer.listProducts[index].name}",style: const TextStyle(fontSize:20),)
                        ),
                        
                          Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                  Text(" ريال   ",style: TextStyle(fontSize: 18,color: ColorName.colorblue),),
                                Text("${homeCoustomer.listProducts[index].price}",style: TextStyle(fontSize:20,color: ColorName.colorblue)),
                                ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                 Text(TextNames.quantityname,style: TextStyle(fontSize: 20),),
                                Text("${homeCoustomer.listProducts[index].quantity}",style: TextStyle(fontSize: 20),),
                               
                                
                              ],
                            ),
                              ],
                            ),
                        Counter(isCounter: true,counter: index),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Card(
                            elevation: 10,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                            child: Container(
                              width: 60,
                              height: 40,
                            decoration: BoxDecoration(
                                color: ColorName.colorblue,
                                borderRadius: BorderRadius.circular(15)
                            ),
                              child: MaterialButton(
                                                 
                                                   
                              onPressed: counsumer.coustmerModel!.isActiveAcount! != "0"? (){
                                 
                                 homeCoustomer.AddProductCart(int.parse(homeCoustomer.listProducts[index].quantityP.toString()),homeCoustomer.listProducts[index].id.toString(),homeCoustomer.listProducts[index].quantityP.toString(),
                                 
                                 
                                 );
                                 
                              }:null,child:const Icon(Icons.shopping_cart_sharp,size: 30,color: Colors.white,)
                              ),
                            ),
                          ),
                      )
                    ],
                    ),
                  );
                }
                ),
              ),
            ),
          ],
        ),
      )
      ),
   
      );
      },
   );
  }}
//}
 
 