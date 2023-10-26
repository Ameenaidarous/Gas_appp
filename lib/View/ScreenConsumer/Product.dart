import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gas_app/Widgets/Counter.dart';
import '../../Model/iteam_list.dart';
import '../../Static/ColorName.dart';
import '../../Static/TextNames.dart';
import 'package:get/get.dart';
class Products extends StatelessWidget {
  final quantityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff6f6f8),
      appBar: AppBar(
        title: Text("منتجات"),
        centerTitle: true,
        
        backgroundColor: ColorName.colorblue,
      ),
      body: SafeArea(
        child: GridView.builder(
          itemCount: products.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16.0,
            mainAxisSpacing: 16.0,
            mainAxisExtent: 270,
          ),
          itemBuilder: (context,index){
            return Card(
              elevation: 15,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 15),
                  child: Image.asset("images/${products[index].images}", width:100, fit: BoxFit.fill, height: 100,),
                  ),
                 SizedBox(
                    child: Text("${products[index].name}", style: TextStyle(fontSize:15),),
                  ),
                  Text("${products[index].price}", style: TextStyle(fontSize: 15),),

                  Counter(
                    isCounter: false,
                  ),
                  
                  Padding(
                    padding: const EdgeInsets.only(top: 7),
                    child: MaterialButton(
                      padding: EdgeInsets.symmetric(horizontal:30,),
                      color: ColorName.colorblue, 
                      onPressed: (){
                      
                    ///  _cartController.addToCart(Basketlist[index]);
                      },
                      child: Text(TextNames.labelnameBasket,style: TextStyle(fontSize: 18,color: Colors.white),),
                    ),
                  )
                ],
              ),
            );
          }
        ),
      ),
    );
  }
}
 