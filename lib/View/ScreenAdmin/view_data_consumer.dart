
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gas_app/Controllers/ComplaintsController.dart';
import 'package:gas_app/Controllers/Tapcontrooler.dart';
import 'package:gas_app/Static/ColorNam.dart';
import 'package:gas_app/Static/StatusRequest.dart';
import 'package:gas_app/Static/TextNames.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../Static/Applink.dart';
import '../../Widgets/Zomma.dart';
import '../../model/iteam_list.dart';
class viwe_data_consumer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: ColorName.colobeginBackgraoundLogin,

      body: GetBuilder<MangmentCoustomersController>(
        
        builder: (controller) {
        if(controller.statusRequest == StatusRequest.success){
          if(controller.statusRequest1 == StatusRequest.lodaing){
            return Center(child: CircularProgressIndicator(),);
          }
          if(controller.totalCousNotActive == 0){
            return Center(child:Lottie.asset("Assets/Iottie/NoData.json"));
          }else{
       return ListView.builder(itemCount:controller.consumerNotActive.length,itemBuilder: (context,i) {
            String formatDate = controller.ConvertFromDataTimeto(i);
            String id =  controller.consumerNotActive[i].id.toString();
            return  Padding(
              padding: const EdgeInsets.all(20),
              child: Card(
                shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                elevation: 20,
                  child: Column(    
                    children: [

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                      Row(
                        children: [
                          Padding(
                              padding: const EdgeInsets.only(top: 20,right: 0),
                              child: CircleAvatar(
                               radius: 50,
                                child: controller.consumerNotActive[i].imageProfle != null?Image.network("$imageProfileLink/${controller.consumerNotActive[i].imageProfle}",width: 150,height: 100,fit: BoxFit.fill,) :Icon(Icons.person,size: 100, color: Color(0xff0F4C81),),
                              ),
                            ),
                         
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 150),
                            child: Text("${controller.consumerNotActive[i].name}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24)
                            ),
                          ),
                        ],
                      ),
                    ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:15,left: 0),
                      child: Row( 
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(children: [
                            Icon(Icons.date_range,color: Color(0xff0F4C81),size: 22,), Padding(
                              padding: const EdgeInsets.only(right: 5),
                              child: Text("${formatDate}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 23)),
                            ),
                          ],
                          ),
                          Row(children: [
                            Icon(Icons.phone,color: Color(0xff0F4C81),size: 22,),Padding(
                              padding: const EdgeInsets.only(right: 5),
                              child: Text("${controller.consumerNotActive[i].phone}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 23)),
                            )
                          ],)
                      ],
                      ),
                    ),
                   
                   
                    Padding(
                      padding: const EdgeInsets.only(top:20),
                      child: Zoomaimage(index: i),
                    ),
                   Padding(
                     padding: const EdgeInsets.only(top:20,bottom: 15),
                     child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        MaterialButton(
                          color: Colors.red,
                          
                          onPressed: (){
                          controller.acceptAndRegect(id,TextNames.tiltleNotificationConfirm,TextNames.contentNotificationNotConfirm,"-1");
                        }, child: Text("رفض",style: TextStyle(fontSize: 25,color: Colors.white),), 
                     padding: EdgeInsets.symmetric(horizontal: 50,vertical: 5),
                       // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
                      
                        ),
                         MaterialButton(
                          color: Colors.green,
                          shape: RoundedRectangleBorder(side: BorderSide(color: Colors.green,width: 3)),
                          onPressed: (){
                            controller.acceptAndRegect(id,TextNames.tiltleNotificationConfirm,TextNames.contentNotificationConfirm,1.toString());
                         }, child:  Text("قبول",style: TextStyle(color: Colors.white,fontSize: 25),), 
                          padding: EdgeInsets.symmetric(horizontal: 50,vertical: 5),
                         //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                         
                         ),
                        
                      ],
                     ),
                   )
                  ],
                  ),
         
          ),
            );
            
            
          },
          );
          
          }
        }else if(controller.statusRequest == StatusRequest.faliure){
          return Center(child: Text("لا  "));
        }else{
          return  Center(child:Card(
            elevation: 15,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
            child: CircularProgressIndicator(
              color: ColorName.colorblue,
            ),
          )
          );
        }
      
    },),
      
      
    );
  }
}