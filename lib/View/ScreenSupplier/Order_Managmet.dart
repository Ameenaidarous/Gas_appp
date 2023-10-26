  import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Controllers/Tapcontrooler.dart';
import '../../Static/ColorNam.dart';
import 'OrderPage.dart';
import 'acceptedorders.dart';

class Order_mngment  extends StatelessWidget { 
 
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('قائمة طلبات ',style: TextStyle(fontSize: 22,color: Colors.white),
          ),
          backgroundColor: ColorName.colorblue,
          bottom:  
             
          TabBar(
            indicatorColor: Colors.white,
           
          
                    
            tabs: [
              
              Tab(
                
                child: Text('طلبات حاليا',style: TextStyle(fontSize: 20,color: Colors.white),),
              ),
              Tab(
                child: Text("طلبات تم استلامها",style: TextStyle(fontSize: 18,color: Colors.white),),
                
              ),
              
            ],
          ),
        ),
        body: TabBarView(
             
            children: [
               Order_Page(),
               Acceptoder()
            ],
          ),
       
      ),
    );
  }
}