import 'package:flutter/material.dart';
import 'package:gas_app/Controllers/LoginSuppController.dart';
import 'package:gas_app/Model/iteam_list.dart';
import 'package:get/get.dart';

import '../../Controllers/supplierController.dart';
import '../../Model/iteam.dart';
import '../../Widgets/Drawer.dart';
import '../../model/iteam_list.dart';


class HomePageSupplier extends StatelessWidget {
  LoginSuppController _loginSuppController=Get.put(LoginSuppController());
  List<MyHome>myhome=[
  MyHome(Icons.shopping_cart, "صفحة طلبات ","Order_mngment"),
  MyHome(Icons.add_shopping_cart, "اضافة منتجات","ManageProductsPage")
];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       
        title:Text("صفحة الرئيسية ",style:TextStyle(fontSize: 24,color: Colors.white),),
        backgroundColor: Color(0xff528fbc),
        centerTitle: true,
      ),
      drawer:Dra(
        titleTexthome:"صفحة الرئيسية ",
        Trailinghome: Icons.home,
        titleTextaccount:"حسابي",
        Trailingaccount: Icons.person,
        titleTextSettings: "الاعدادت",
        TrailingSettings: Icons.settings,
        titleTextnotifications: "الاشعارات",
        Trailingnotifications: Icons.notifications,
        titleTextLogout: "تسجيل خروج",
        TrailingLogout: Icons.logout,
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
                //print(controllerSupplie.coustmerModel!.name);
                print(_loginSuppController.supplierModel==null);
                  // افتح صفحة مختلفة عند النقر على بطاقة الصفحة
                Get.toNamed(myhome[index].pageName,arguments: {"blockId":_loginSuppController.supplierModel!.block!.id});
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