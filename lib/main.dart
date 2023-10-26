import 'package:flutter/material.dart';
import 'package:gas_app/Controllers/counsumerController.dart';
import 'package:gas_app/Static/PageName.dart';
import 'package:gas_app/View/Register.dart';
import 'package:gas_app/View/ScreenAdmin/Homepage_Admin.dart';
import 'package:gas_app/View/ScreenAdmin/consumer_managment.dart';
import 'package:gas_app/View/ScreenSheard/LoginSupplier.dart';
import 'package:gas_app/View/ScreenSheard/loginConsumer.dart';
import 'package:gas_app/View/ScreenSupplier/Addprodcut.dart';
import 'package:gas_app/View/ScreenSupplier/HomePageSupplier.dart';
import 'package:gas_app/View/ScreenSupplier/Mangamment_product.dart';
import 'package:gas_app/View/ScreenSupplier/acceptedorders.dart';
import 'package:gas_app/View/TestView.dart';
import 'package:gas_app/View/onborading/onborading.dart';
import 'package:gas_app/Widgets/Config.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'Static/Biniding.dart';
import 'Static/FontName.dart';
import 'View/Sccrren.dart';
import 'View/ScreenAdmin/Area.dart';
import 'View/ScreenAdmin/Block.dart';
import 'View/ScreenAdmin/LoginAdmin.dart';
import 'View/ScreenAdmin/MangeOrder.dart';
import 'View/ScreenAdmin/Order_Managemet.dart';
import 'View/ScreenAdmin/Order_Page_Admin.dart';
import 'View/ScreenAdmin/SupplierPage.dart';
import 'View/ScreenAdmin/datalismanagmentOrder.dart';
import 'View/ScreenConsumer/NvgationBar.dart';
import 'View/ScreenConsumer/homePageCoustomer.dart';
import 'View/ScreenConsumer/orderdetailes.dart';
import 'View/ScreenSheard/profile.dart';
import 'View/ScreenSupplier/OrderPage.dart';
import 'View/ScreenSupplier/Order_Managmet.dart';
import 'View/ScreenSupplier/notifications.dart';
import 'View/viewscrren.dart';

Future<void> main() async {
  
  await GetStorage.init();
  runApp(
    
    MyApp()
    );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  GetStorage storage = GetStorage();
  String cousId = "";
  String cousTypeUser = "";
  
  
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    if(storage.read(ControllerCounsumer.id) != null){
        
        cousId =  storage.read(ControllerCounsumer.id);
        cousTypeUser = storage.read(ControllerCounsumer.istypeUser);
  }else{
    print((storage.read(ControllerCounsumer.id)));
  }
  
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        fontFamily: FontName.vazirmatn,
        primarySwatch: Colors.orange,
      ),
      initialBinding: InitialBinding(),
      
      getPages:  [
          GetPage(name: PageName.login, page: () => Login()),
          GetPage(name: PageName.homePageCoustomer, page: () => HomePageCoustomer()),
          GetPage(name: PageName.homePageSupplier, page: () => HomePageSupplier()),
          GetPage(name: PageName.Homepage_Admin, page:() => Homepage_Admin()),
          GetPage(name: PageName.NvgationBar, page: () => NvgtionBar ()),
          GetPage(name: "/ManageProductsPage", page: () => ManageProductsPage()),
          GetPage(name: "/Order_mngment", page: () => Order_mngment()),
          GetPage(name:PageName.Mangament_consumer , page: () => Mangament_consumer()),
          GetPage(name: "/SupplierPage", page: ()=>SupplierPage()),
          GetPage(name: "/MyHomeArea", page:()=>MyHomeArea()),
          
          GetPage(name: PageName.scrrenview, page:()=>scrrenview()),
           GetPage(name: PageName.LoginSupp, page:()=>LoginSupp())
          // GetPage(name: PageName.Profile, page: () => Profile()),
          
      ],
      locale: Get.deviceLocale,
      home: Scaffold(
        // ignore: unnecessary_null_comparison, unrelated_type_equality_checks
        body: 
       // Dataliorder(),
///Dataliorder()
       /// Config(),
     // HomePageSupplier(),
       
        //cousId.isNotEmpty && cousTypeUser == "1" ? HomePageSupplier():LoginSupp(),
        //cousId.isNotEmpty  && cousTypeUser == "2" ? NvgtionBar():Login(),
        //notifications(), 

        //LoginAdmin()
        // Onbordings()
        //notifications(),
           
        //Login(),
         
         
       // Acceptoder()

       //notifications(),     
         
  //Homepage_Admin(), 
      //BlockPage()
         scrrenview(),
      //Scrren(),
      //MangeOrder(),
      //RegisterCoustomer(),
      //SupplierPage(),
      ),
    );
  }
}


