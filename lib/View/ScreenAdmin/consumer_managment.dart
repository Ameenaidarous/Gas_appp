  import 'package:flutter/material.dart';
import 'package:gas_app/Widgets/SearcgPage.dart';
import 'package:get/get.dart';
import '../../Controllers/Search_controller.dart';
import '../../Controllers/Tapcontrooler.dart';
import '../../Static/ColorNam.dart';
import 'data_consumer.dart';
import 'view_data_consumer.dart';
class Mangament_consumer  extends StatelessWidget { 
  final MangmentCoustomersController controller = Get.put(MangmentCoustomersController(),permanent: true);
  final SearchController searchController = Get.put(SearchController());
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('ادارة العملاء',style: TextStyle(fontSize: 22,color: Colors.white),
          ),
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
          backgroundColor: ColorName.colorblue,
          bottom:  
             
          TabBar(
            indicatorColor: Colors.white,
             controller: controller.tabController,
          
                    
            tabs: [
              
              Tab(
                
                child: Text('عرض بيانات العملاء ',style: TextStyle(fontSize: 20,color: Colors.white),),
              ),
              Tab(
                child: Text("عرض العملاء قيد الانتطار",style: TextStyle(fontSize: 18,color: Colors.white),),
                
              ),
              
            ],
          ),
        ),
        body: TabBarView(
                controller: controller.tabController,
            children: [
              data_consumer(),
              viwe_data_consumer(),
            ],
          ),
       
      ),
    );
  }
}