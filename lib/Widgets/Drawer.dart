import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gas_app/Controllers/LoginSuppController.dart';
import 'package:gas_app/View/ScreenSupplier/notifications.dart';
import 'package:get/get.dart';

import '../View/ScreenSupplier/notificationSup.dart';
class Dra extends StatelessWidget {
final String titleTexthome;
final IconData  Trailinghome;
final String titleTextaccount;
final IconData  Trailingaccount;
final String titleTextSettings;
final IconData  TrailingSettings;
final String titleTextnotifications;
final IconData  Trailingnotifications;
final String titleTextLogout;
final IconData  TrailingLogout;
  LoginSuppController suppController = Get.find<LoginSuppController>();
  Dra( {required this.titleTexthome,required this.Trailinghome,required this.TrailingLogout,required this.TrailingSettings,required this.Trailingaccount,required this.titleTextLogout,required this.Trailingnotifications,required this.titleTextSettings,required this.titleTextaccount,required this.titleTextnotifications});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child:Column(children: [
          UserAccountsDrawerHeader(accountName: InkWell(child: Text("${suppController.supplierModel!.name}"),), accountEmail:Text("${suppController.supplierModel!.phone}"),arrowColor: Color(0xff528fbc),currentAccountPicture: CircleAvatar( backgroundImage: AssetImage("Assets/imagess/employee.png"), backgroundColor: Colors.grey,),
          decoration: BoxDecoration(
          color: Color(0xff528fbc), // تغيير اللون هنا
  ),
          ),
          ListTile(
            title:Text (titleTexthome,textAlign: TextAlign.end,),
            trailing: Icon(Trailinghome),
          ),
             ListTile(
            title: Text(titleTextaccount,textAlign: TextAlign.end,),
            trailing:Icon(Trailingaccount)  ,
          ),
             ListTile(
            title: Text(titleTextSettings,textAlign: TextAlign.end,),
            trailing: Icon(TrailingSettings),
          ),
             ListTile(
            title: Text(titleTextnotifications,textAlign: TextAlign.end,),
            trailing: Icon(Trailingnotifications),
            onTap: () {
              Get.to(NotificationssSupp());
            },
          ),
             ListTile(
            title: Text(titleTextLogout,textAlign: TextAlign.right,),
            trailing: Icon(Icons.home),
          ),
             
        ],
      
    )
    );
  }
}