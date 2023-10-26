import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Controllers/NvgationController.dart';
import '../../Static/ColorNam.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'List.dart';
import 'MYOrders.dart';
import 'Myorder.dart';
import 'Product.dart';
import 'basket.dart';
import 'homePageCoustomer.dart';

class NvgtionBar extends StatelessWidget {
  final HomeController appController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      body: Obx(() {
        switch (appController.selectedIndex.value) {
          
          case 0:
            return  Basket();
          case 1:
            return  HomePageCoustomer();
            case 2:
            return  MyOder();
            case 3:
            return  mylist();
          default:
            return Container();
        }
      }),
      bottomNavigationBar: Obx(() {
        
        return GNav(
          gap: 5,
          selectedIndex: appController.selectedIndex.value,
          padding: EdgeInsets.all(15),
          duration: Duration(milliseconds: 1000),
          tabBackgroundColor: ColorName.colorblue, 
          activeColor: Colors.white,
          iconSize: 24,
          onTabChange: (int index) {
          appController.changePage(index);
          },
          tabs: [
         
            GButton(icon: Icons.shopping_basket, text: 'سلة'),
            GButton(
              margin: EdgeInsets.only(bottom: 25),
              icon: Icons.home,
          borderRadius: BorderRadius.circular(100),
          iconColor:Colors.white,
          iconActiveColor:Colors.white,
          
           
         // backgroundColor: Color(0xff528fbc),
           shadow: [
    BoxShadow(
    color: Colors.grey,
    spreadRadius: 2,
      //offset: Offset(0, 3),
    ),
  ],       
  ),
         GButton(icon: Icons.card_travel, text: 'طلباتي'),
         GButton(icon: Icons.read_more_outlined, text: 'خيارات'),
          ],
        );
      }),
    );
  }
}