import 'package:flutter/material.dart';
import 'package:gas_app/Static/ColorNam.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import '../../Controllers/HomePageCounsumer.dart';

class NotificationssSupp extends StatelessWidget {
  HomeCoustomerController homeCoustomer = Get.put(HomeCoustomerController());
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
         backgroundColor: ColorName.colobeginBackgraoundLogin,
        appBar: AppBar(
          title: Text("الاشعارات"),
          centerTitle: true,
          backgroundColor: ColorName.colobeginBackgraoundLogin,
         elevation: 0,
        ),
        body: SafeArea(child:HomeCoustomerController.listNotification == null? Center(child: Text("no data"),):
        
        ListView.builder(
          itemCount: HomeCoustomerController.listNotification.length,
          itemBuilder:((context, index) {
            return Padding(
              padding: const EdgeInsets.all(10),
              child: Card(
                color: Color(0xfff2f3f5),
                shape:RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),),
                elevation: 10,
               child:Column(
                //crossAxisAlignment: CrossAxisAlignment.end,
                 children: [
                 
                   Row(children: [
                    Row(
                      children: [
                        Container(child:Image.asset("Assets/imagess/Logo.png",height: 100,fit: BoxFit.cover),
                        ),
                      ],
                    ),
                    Expanded(
                      flex: 2,
                      child:ListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                          Row(children: [
                            Text("${HomeCoustomerController.listNotification[index].notifiName}",style: TextStyle(fontSize: 20))
                            
                          ],
                          ),
                          Row(
                            children: [
                             const Icon(Icons.timer),
                              Text("AM 8:00"),
                               InkWell(child: Padding(
                                 padding: const EdgeInsets.only(right: 5,bottom: 15),
                                 child:Padding(
                                   padding: const EdgeInsets.only(top: 10),
                                   child: Icon(Icons.circle,color: Colors.red,size:15,),
                                 )
                               ),
                               onTap: (){},
                               ),
                            ],
                          ),
                        ],
                        ),
                        subtitle:Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 5),
                              child: Text("${HomeCoustomerController.listNotification[index].notifContent}",style: TextStyle(fontSize: 23),),
                            ),
                          ],
                        ),
                      )
                      ),
                   ],
                   ),
                 ],
               )
               ),
            );
          }
          )
          )
        ),
      ),
    );
  }
}