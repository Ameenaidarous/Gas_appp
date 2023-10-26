import 'package:flutter/material.dart';
import 'package:gas_app/Static/ColorNam.dart';
import 'package:get/get.dart';


import '../../Model/iteam.dart';
import '../../model/iteam_list.dart';


class Homepage_Admin extends StatelessWidget {
  
  List<MyHome> myhome = [
    MyHome(Icons.manage_accounts_outlined,"ادارة العملاء","/Mangament_consumer"),
     MyHome(Icons.manage_accounts,"ادارة الموردين","/SupplierPage"),
     MyHome(Icons.manage_search_sharp,"عرض 'طلبات ","/Order_Managemet"),
     MyHome(Icons.add_location_sharp," اضافة منطقة ","/MyHomeArea"),
    
    
    ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       
        title:Text("صفحة الرئيسة ",style: TextStyle(fontSize: 30,color: Colors.white),
        
        
        ),
        backgroundColor: Color(0xff528fbc),
        centerTitle: true,
      ),
    
      body: GridView.builder(
            padding: EdgeInsets.all(16.0),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16.0,
              mainAxisSpacing: 16.0,
            ),
            itemCount: myhome.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                
                  // افتح صفحة مختلفة عند النقر على بطاقة الصفحة
                Get.toNamed(myhome[index].pageName);
                },
                child: Card(
                  color: Color(0xff528fbc),
                  elevation: 10,
                  shape:RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)
                  ),
                  child:Padding(
                    padding: const EdgeInsets.only(top:50),
                    child: Column(children: [
                      Icon(myhome[index].icon,size: 40,color: Colors.white),
                      SizedBox(
                        height: 20,
                      ),
                      Text("${myhome[index].title}",style: TextStyle(color: Colors.white),)
                      
                    ],
                    ),
                  )
              
                ),
              );
            },
          )
    );
  }
}