import 'package:flutter/material.dart';
import 'package:gas_app/Controllers/NotificationController.dart';
import 'package:gas_app/Static/ColorNam.dart';
import 'package:gas_app/Static/StatusRequest.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import '../Controllers/HomePageCounsumer.dart';
import '../Controllers/Notifications.dart';
import '../Model/iteam_list.dart';
class Notificationss extends StatelessWidget {
  NotificationsController notificationController = Get.put(NotificationsController());
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
        body: SafeArea(child:
        GetBuilder<NotificationsController>(builder: (controller){
          if(notificationController.statusRequest == StatusRequest.lodaing){
            return Center(child: CircularProgressIndicator(),);
          }else if(notificationController.listNotifications.length==0){
            return Text("yyyyyyy");
          }
        return ListView.builder(
          itemCount: notificationController.listNotifications.length,
          itemBuilder:((context, index) {
            
            String s1 = notificationController.convertNoti(notificationController.listNotifications[index].createDate.toString());
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
                            Text("${notificationController.listNotifications[index].notifiName}",style: TextStyle(fontSize: 20))
                            
                          ],
                          ),
                          Row(
                            children: [
                             const Icon(Icons.timer),
                              Text("$s1"),
                               InkWell(child: Padding(
                                 padding: const EdgeInsets.only(right: 5,bottom: 15),
                                 child:Padding(
                                   padding: const EdgeInsets.only(top: 10),
                                   child: InkWell(child: notificationController.listNotifications[index].isShow=="1"?Container(): Icon(Icons.circle,color: Colors.red,size:15,)
                                   
                                   ),
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
                              child: Text("${notificationController.listNotifications[index].notifContent}",style: TextStyle(fontSize: 23),),
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
  );})
        ),
      ),
    );
  }
}
