
import 'package:flutter/material.dart';
import 'package:gas_app/Controllers/Tapcontrooler.dart';
import 'package:gas_app/Static/ColorNam.dart';
import 'package:gas_app/Static/StatusRequest.dart';
import 'package:gas_app/Widgets/ZommaActive.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';


import '../../Static/Applink.dart';
import '../../Widgets/Zomma.dart';
import '../../model/iteam_list.dart';


class data_consumer extends StatelessWidget {
  
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
       backgroundColor: ColorName.colobeginBackgraoundLogin,
       body: 
       
       SafeArea(
         child: 
          GetBuilder<MangmentCoustomersController>(builder: (controller) {
            if(controller.statusRequest == StatusRequest.success){
              if(controller.totalCousActive == 0){
                return Center(child: Lottie.asset("Assets/Iottie/NoData.json"));
              }
              
            return Column(
           children: [
             Expanded(
               child: ListView.builder(itemCount:controller.consumerActive.length,itemBuilder: (context,i) {
                  String formatDate = controller.ConvertFromDataTimeto(i);
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
                                      child: Container(
                                     
                                        child: CircleAvatar( radius: 50,child: controller.consumerActive[i].imageProfle != null?Image.network("$imageProfileLink/${controller.consumerActive[i].imageProfle}",width: 100,height: 100,fit: BoxFit.fill,) :Icon(Icons.person,size: 100, color: Color(0xff0F4C81),)),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                   Padding(
                                     padding: const EdgeInsets.only(left: 150,),
                                     child: Text("${controller.consumerActive[i].name}",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
                                   ),
                                  ],
                                ),
                              ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 15),
                                child: Row( 
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Row(children: [
                                     
                                        Icon(Icons.date_range,color: Color(0xff0F4C81),size: 22,),
                                     
                                      
                                      Padding(
                                        padding: const EdgeInsets.only(right: 10),
                                        child: Text("${formatDate}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 23)),
                                      ),
                      
                                    ],),
                                    Row(children: [
                                      Icon(Icons.phone,color: Color(0xff0F4C81),size: 22,),
                                      Padding(
                                        padding: const EdgeInsets.only(right: 10),
                                        child: Text("${controller.consumerActive[i].phone}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 23)),
                                      )
                                    ],)
                                ],
                                ),
                              ),
                             
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: 
                              ZoomaimageActive(index: i,)
                            ),   
                             Padding(
                               padding: const EdgeInsets.only(top:15,bottom: 10),
                               child:InkWell(child: Icon(Icons.delete,color: Color(0xffA60036),size: 35,)) 
                             ),
                            ],
                            ),
                          
                 
                  ),
                    );
                    
                    
                  },
                  ),
             ),
           ],
         );
            }else if(controller.statusRequest == StatusRequest.faliure){
              return Center(child: Text("لايوجد بيانات"));
            }else{
              return Center(
                child: Card(
                  elevation: 15,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                  child: CircularProgressIndicator(
                    color: ColorName.colorblue,
                  ),
                ),
              );
            }
       },),
         
       )
    );
  }
}
