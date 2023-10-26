import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gas_app/Controllers/CartController.dart';
import 'package:gas_app/Model/cartModel.dart';
import 'package:gas_app/Widgets/Counter1.dart';
import 'package:get/get.dart';
import '../Static/Applink.dart';
import '../Static/ColorName.dart';
import '../Static/TextNames.dart';
import '../model/iteam_list.dart';

class myBasket extends StatelessWidget {
  List<Products> products = [];
  CartController cartController = Get.put(CartController());
  myBasket({required this.products});
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(child: ListView.builder(
        itemCount: products.length,
        itemBuilder:((context, index) {
        return Padding(
          padding: const EdgeInsets.all(10),
          child: Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          elevation: 10,
          child:Row(
            //mainAxisAlignment: MainAxisAlignment.end,
            children: [
            Container(child: Image.asset("Assets/imagess/12.png",height: 100,width: 100,fit: BoxFit.cover,),),
            Expanded(
            flex: 1,  
            child:ListTile(
            title: 
              Row(
               crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 Row(
                      
                    children: [
                    //Text(TextNames.productName,style: TextStyle(fontSize: 20,),),
                    Text("${products[index].productName}",style: TextStyle(fontSize: 20,color:Colors.black,fontWeight: FontWeight.bold),), 
                    ],
            ),
                  
           
            
                ],
              ), 
              
            subtitle: Column(children: [
               Row(children: [
                Text(TextNames.namepriceprotuct,style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),),
                   Text("${products[index].price}",style: TextStyle(fontSize: 23,color: Color.fromARGB(255, 211, 208, 208),fontWeight: FontWeight.bold),),
              ],
              ),
              

              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                   
                     
                       Padding(
                         padding: const EdgeInsets.only(left: 30),
                         child: Row(children: [
                  Counter1(counter: int.parse(products[index].quantity.toString()),i: index,
                  ),
                      ],
                      ),
                       ),
                    
                    
                  Row(children: [
                  InkWell(
                    child:Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
                      color: ColorName.colorblue,
                      ),
                      
                      child: Icon(Icons.close,color: Colors.white,size: 30,)),
                    onTap:(){
                      cartController.deleteCart(products[index].cptId.toString());
                    },
                  ) ,
                  ],
                  ),
             
                ],
                ),
              ),
               Padding(
                 padding: const EdgeInsets.only(top: 10),
                 child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                  Text(TextNames.pricename,style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),),
                  Text("${products[index].totalPriceProduct}",style: TextStyle(fontSize: 20,color:Colors.black,fontWeight: FontWeight.bold),),
                  
              ],
              ),
               )
            ],
            ),
            ),
            )
          ],
          )
      ),
        );
      }
      )
      )
      ),
    );
  }
}