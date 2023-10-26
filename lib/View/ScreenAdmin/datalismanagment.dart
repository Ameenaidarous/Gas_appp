import 'package:flutter/material.dart';
import '../../Static/ColorNam.dart';
import '../../model/iteam_list.dart';

class dataisManagment extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("تفاصيل الطلب"),
        backgroundColor: ColorName.colorblue,
      ),
      body:ListView.builder(
        itemCount:details.length,
        itemBuilder:((context, i) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: SingleChildScrollView(
            child: Container(
              height: 250,
              width:double.infinity,
              padding: EdgeInsets.only(top: 25),
              margin: EdgeInsets.only(right: 10,left: 10),
              child: Card(
                shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                elevation: 10,
                color: ColorName.colorblue,
                child:
              Padding(
                   padding: const EdgeInsets.only(right:20,top:20,bottom: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      
                      children: [
                        Row(
                          children: [
                             Image.asset("${details[i].image}",width: 100,height: 50,),
                            
                          ],
                        ),
                      Row(children: [
                       
                      Text(" اسم منتج : ${details[i].NameProdect}",style:TextStyle(fontSize: 20, color: Colors.white)),
                       Icon(Icons.production_quantity_limits_outlined,size: 25,color: Colors.white,),
                      ],
                      ),
                    ],
                    ),
                    Row(
                     mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                      Row(children: [
                       
                        Text(" السعر الاجمالي : ${details[i].Total}",style:TextStyle(fontSize: 20,color: Colors.white)),
                         Icon(Icons.touch_app_outlined,size: 25,color: Colors.white,),
                      ],
                      ),
                      Row(children: [
                         Text(" الكمية : ${details[i].Quantiy}",style:TextStyle(fontSize: 20,color: Colors.white))
                      ],
                      ),
                    ],),
                    
                   
                        Text(" نوع خدمة : ${details[i].servicetype}",style:TextStyle(fontSize: 20,color: Colors.white)),
                      
                    
                  ],
                ),
              )
               
              
              ),
            ),
          ),
        );
      }))

    );
  }
}