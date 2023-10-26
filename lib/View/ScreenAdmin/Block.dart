import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../Controllers/AreasController.dart';
import '../../Model/AreaModel.dart';
import '../../Model/BlockM.dart';
import '../../RepatFunction/ScreenSizes.dart';
import '../../Static/ColorNam.dart';
import '../../Static/TextNames.dart';
import '../../Widgets/TextFiled1.dart';

class BlockPage extends StatelessWidget {
   AreaCousController AreController = Get.put(AreaCousController());
     final _neighborhoodController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorName.colobeginBackgraoundLogin,
      appBar:AppBar(title: Text("اضافة مربع",style: TextStyle(fontSize: 25,color: Colors.white),),
      centerTitle: true,
      backgroundColor: ColorName.colorblue,
      
      ),

      body: Container(
     
        child: Padding(
        padding: const EdgeInsets.only(left:5,right: 5),
        child: Column(
         
          children: [
            GetX<AreaCousController>(builder: (controller) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 10,left: 10,top:75),
                              child: DropdownButtonFormField<AreaM>(
                              
                              decoration: InputDecoration(
                                labelText: "المنطقة",
                                labelStyle: TextStyle(fontSize: 20,color: ColorName.textTextFiled),
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(20),borderSide: BorderSide(color: Colors.white)),
                                  
                                
                                filled: true,fillColor: Colors.white,
                                enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20),borderSide: BorderSide(color: Colors.white),),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),borderSide: BorderSide(color: Colors.white),
                                  
                                  
                                ),
                      
                              ),
                      
                              
                              elevation: 25,
                              
                              value: AreController.listArea![controller.selectArea.value],
                              items: AreController.listArea!.map((e) => DropdownMenuItem(child: Text(e.name!,style:TextStyle(fontSize: 15,color: ColorName.textTextFiled)),value: e,)).toList(),
                              onChanged: (value) {
                                controller.selectArea.value =  controller.listArea!.indexOf(value!);
                                String areaIdPK = controller.listArea![controller.selectArea.value].id!;
                                controller.listBlockDropDown.clear();
                                
                                controller.listBlockDropDown.addAll(controller.listBlock!.where((element) => element.areaId == areaIdPK).toList());
                                controller.selectBlock.value = 0;
                              },
                              ),
                            );
                            
                          },
                          ),
           
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Textfiled(
              filedControl: _neighborhoodController,
              labelText: TextNames.BlockName,
              obsText: false,
              inputType: TextInputType.streetAddress,
              valid: ((p0) {}),
          ),
            ),
             Padding(
               padding: const EdgeInsets.only(top: 50),
               child: MaterialButton(
            color:ColorName.colorblue,
            padding: EdgeInsets.symmetric(horizontal:150),
            onPressed:() {
            Get.to(BlockPage());
            },
            child: Text('إضافة',style: TextStyle(fontSize: 30,color: Colors.white),),
          ),
             ),

        ],
        ),
      )
      ),
    );
  }
}