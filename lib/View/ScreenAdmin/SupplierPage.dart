
import 'package:flutter/material.dart';
import 'package:gas_app/Controllers/Search_controller.dart';
import 'package:gas_app/Controllers/Supplierview_Controller.dart';
import 'package:gas_app/Static/StatusRequest.dart';
import 'package:gas_app/View/RegisterSuplier.dart';
import 'package:get/get.dart';

///import 'package:flutter_zoom_widget/flutter_zoom_widget.dart';
//import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
//import 'package:pinch_zoom_image_last/pinch_zoom_image_last.dart';
import 'package:photo_view/photo_view.dart';

import '../../Static/ColorName.dart';
import '../../Widgets/SearcgPage.dart';
class SupplierPage extends StatelessWidget {
  SupplierControllerAll supplierControllerAll = Get.put(SupplierControllerAll());
   final SearchController searchController = Get.put(SearchController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorName.colorblue,
        title: Text("ادارة موردين",style: TextStyle(fontSize: 25,color: Colors.white),),
        centerTitle: true,
         actions: [
          IconButton(
            color: Colors.white,
            onPressed: () {
              showSearch(context: context, delegate: SearchBarDelegate(searchController),
              
              
              );
            },
            icon: Icon(Icons.search),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorName.colorblue,
        onPressed: (){

          Get.to(RegisterSupplier());
        },child: Icon(Icons.add,color: Colors.white,size: 25,),),
       body: GetBuilder<SupplierControllerAll>(builder: (controller) {
         if(supplierControllerAll.statusRequest == StatusRequest.lodaing){
          return  Center(child: CircularProgressIndicator());
         }else{
            return SafeArea(
         child: Column(
           children: [
             Expanded(
               child: ListView.builder(
                itemCount: supplierControllerAll.listSuppliers!.length,
                itemBuilder: (context,i) {
                    return  Padding(
                      padding: const EdgeInsets.all(15),
                      child: Card(
                          
                        shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                        elevation: 20,
                          child: Padding(
                            padding: const EdgeInsets.all(0),
                            child:Column(children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 15,right: 0),
                                  child: Row(
                                    children: [
                                       Icon(Icons.person,size:60,color: ColorName.colorblue,),

                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left:170),
                                  child: Column(children: [
                                   
                                    Text("${supplierControllerAll.listSuppliers![i].suppName}",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),
                                      ),
                                  ],
                                  ),
                                ),
                              ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 15),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [Row(children: [
                                    Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Icon(Icons.phone,size: 30, color:ColorName.colorblue,),
                                  ),
                                  Text("${supplierControllerAll.listSuppliers![i].suppPhone}",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),  
                                ],
                                ),
                                Row(children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Icon(Icons.location_on,size: 30, color:ColorName.colorblue,),
                                  ),
                                  Text("${supplierControllerAll.listSuppliers![i].blockName}",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                                  

                                ],
                                )
                                ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 15,bottom: 10),
                                child: InkWell(child: Icon(Icons.delete,size: 35,color: Colors.red,),
                                onTap: (){},
                                
                                ),
                              )
                            ],
                            )
                          ),
                 
                  ),
                    );
                   
                    
                  },
                  ),
             ),
           ],
         ),
       );
         }
       },),
       
    );
  }
}