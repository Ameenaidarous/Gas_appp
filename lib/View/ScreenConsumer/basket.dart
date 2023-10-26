import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gas_app/Controllers/CartController.dart';
import 'package:gas_app/Model/cartModel.dart';
import 'package:gas_app/Static/StatusRequest.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../Static/ColorName.dart';

import '../../Static/ImageName.dart';
import '../../Static/TextNames.dart';
import '../../Widgets/baskets.dart';

class Basket extends StatelessWidget {
  Basket({super.key});
  CartController cartController = Get.put(CartController());
  List<Products> l = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorName.coloendBackgraoundLogin,
      appBar: AppBar(
        backgroundColor: ColorName.coloendBackgraoundLogin, 
        title: Text("سلة",style: TextStyle(fontSize: 25,color: Colors.black),),
        centerTitle: true,
        elevation: 0,

      ),
      body: RefreshIndicator(
        color: ColorName.colorblue,
        onRefresh: () {
          return cartController.getCart();
        },
        child: GetBuilder<CartController>(builder: (controller) {
          if(cartController.statusRequest == StatusRequest.lodaing){
            return Center(child: Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
              elevation: 15,
              child: CircularProgressIndicator(
                color: ColorName.colorblue,
            
              ),
            )
            );
          }else if(cartController.statusRequest == StatusRequest.faliure){
            return Center(child:Lottie.asset("Assets/Iottie/Cartempty.json",width: 280,height: 350,fit: BoxFit.fill,)
            );
          }
          return Form(
          child: Column(children: [
            
              Expanded(
              child: Padding(
              padding: const EdgeInsets.only(top:5),
              child:  myBasket(products: cartController.cart!.products!),
              )
              ),
              SizedBox(
                height: 250,
                child: Column(
                  children: [
                    

                    Container(
                    
                      child: Padding(
                        padding: const EdgeInsets.only(right: 15,left: 15),
                        child: Card(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                          elevation: 15,
                          child: Column(
                            
                            children: [
                             Padding(
                               padding: const EdgeInsets.only(top: 20),
                               child: Container(
                                width: 300,
                                height: 50,
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                                color: ColorName.colobeginBackgraoundLogin
                                ),
                                child: Row(children: [
                                  GetBuilder<CartController>(builder: ((controller) {
                                    return GestureDetector(
                                      onTap: () {
                                        cartController.type();
                                      },
                                    child: Container(
                                      width: 150,
                                      height: 50,
                                      decoration: BoxDecoration(color: cartController.isType == false? cartController.colorDelavery:Colors.white,
                                      borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Center(child: Text("خدمة توصيل ",style: TextStyle(fontSize: 22,color: cartController.isType == false? Colors.white:cartController.colorDelavery,fontWeight: FontWeight.bold),)
                                      ),
                                    ),
                                  );
                                  })),
                                  GetBuilder<CartController>(builder: (controller) {
                                    return GestureDetector(
                                      onTap: () {
                                        cartController.type();
                                      },
                                      child: Container(
                                      width: 150,
                                      height: 50,
                                      decoration: BoxDecoration(color:cartController.isType == true? cartController.colorDelavery:Colors.white,
                                      borderRadius: BorderRadius.circular(20)
                                      ),
                                      child: Center(child: Text("خدمة حجز  ",style: TextStyle(fontSize: 22,color:cartController.isType == true? Colors.white:cartController.colorDelavery,fontWeight: FontWeight.bold),)
                                      ),
                                                                      ),
                                    );
                                 
                                  },),
                                   

                                ],
                                ),
                               ),
                             ),
                              Padding(
                                padding: const EdgeInsets.only(left: 15,right: 15,top: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [

                                  Row(children: [
                                    Text("توصيل : ",style: TextStyle(fontSize: 22,color: Colors.black,fontWeight: FontWeight.bold),)
                                  ],
                                  ),
                                  Row(children: [
                                    Text("مجانا",style: TextStyle(fontSize: 22,color: Colors.black)),

                                  ],
                                  )
                                ],
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.only(top: 15,left: 15,right: 16,bottom: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Text(TextNames.Totalprice,style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(cartController.cart!.totalPrice!.toString(),style: TextStyle(fontSize: 20,color: Colors.black, ),),
                                      ],
                                    ),
                        
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10,bottom:0),
                      child:   Card(
                        elevation: 10,
                        child: MaterialButton(
                                 padding: EdgeInsets.symmetric(horizontal: 150),
                                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                color: ColorName.colorblue, 
                                onPressed: (){
                                  cartController.checkout();
                                },child: Text("تاكيد",style: TextStyle(color: Colors.white,fontSize: 30)),
                                ),
                      )
                    ),
                  ],
                ),
              ),
          ],
          ),
        );
        },),
      ),
      
    );
  }
}

