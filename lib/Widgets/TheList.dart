import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Static/ColorNam.dart';
import '../View/ScreenConsumer/EditAccount.dart';
import '../View/ScreenSheard/LoginSupplier.dart';
import '../View/ScreenSheard/loginConsumer.dart';
import '../View/viewscrren.dart';
import 'Complaints.dart';
class Listmore extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(30),
        child: ListView(
          children: [
            ListTile(
              onTap: () {
                Get.to(EditAccount());
              },
              trailing: Icon(Icons.person,color: ColorName.colorblue, ),
              title: Text(
                "حسابي",style:TextStyle(color: ColorName.colorblue, ),
              ),
            ),
           
            ListTile(
              onTap: () {},
              trailing: Icon(Icons.phone,color:ColorName.colorblue, ),
              title: Text(" تواصل معنا ",style:TextStyle(color: ColorName.colorblue, ),),
            ),
            
            
            
           
            
            
            ListTile(
              onTap: () {},
              trailing: Icon(Icons.share,color:ColorName.colorblue, ),
              title: Text(" شارك التطبيق",style:TextStyle(color:ColorName.colorblue, ),),
            ),
           
            ListTile(
              onTap: () {
                Get.to(()=>scrrenview());
              },
              trailing: Icon(Icons.logout_outlined,color: ColorName.colorblue, ),
              title: Text("تسجيل خروج ",style:TextStyle(color:ColorName.colorblue, ),),
            ),
          ],
        ),
      );
    }
}