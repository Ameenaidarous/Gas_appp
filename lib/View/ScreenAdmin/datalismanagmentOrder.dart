import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:gas_app/Static/TextNames.dart';
import 'package:get/get.dart';
import '../../Model/iteam_list.dart';
import '../../Static/ColorName.dart';
class Dataliorder extends StatelessWidget {
 
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
          child: ListView(children: [
            Padding(
              padding: const EdgeInsets.all(5),
              child: Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)) ,
              elevation: 15,  
              child:
              Row(children: [
                Container(child:Image.asset("Assets/imagess/12.png",width: 100,height: 100,fit: BoxFit.fill,) ,),
                Expanded(
                  flex: 2,
                child: ListTile(
                  title:
                   
                    Text("استبدال الغاز",style: TextStyle(fontSize: 22),),
                  
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Text("11 كغم",style: TextStyle(fontSize: 22),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                      Row(children: [
                       
                        Text(TextNames.quantityname,style: TextStyle(fontSize: 22,color: Colors.black),),
                         Text("4",style: TextStyle(fontSize: 22),),
                      ],
                      ),
                      Row(children: [
                        
                        Text(TextNames.pricename ,style: TextStyle(fontSize: 22,color: Colors.black),),
                        Text("20000",style: TextStyle(fontSize: 22),),
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
          ],
          )
        ),
      ),
    );
  }
}
