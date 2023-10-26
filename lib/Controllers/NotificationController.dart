import 'package:gas_app/Controllers/HomePageCounsumer.dart';
import 'package:gas_app/Static/Applink.dart';
import 'package:get/get.dart';

import '../Model/CURD.dart';
import '../Model/NotificationModel.dart';
import '../Static/StatusRequest.dart';
import '../TestData/Funcation.dart';
import '../TestData/TestData.dart';

class NotificationController extends GetxController{
  TestData testData = TestData(Get.put(Curd()));
  getDataProducts(String id) async{
      
      HomeCoustomerController.statusRequest1 = StatusRequest.lodaing;
      
      var response = await testData.getData(linkUrl: updateNotificationApi, data: {
        "id":id,
        
      });
      HomeCoustomerController.statusRequest1 = handlingData(response);
      
      if(HomeCoustomerController.statusRequest1 == StatusRequest.success){
        
       HomeCoustomerController.totalNotifications = response["data"]["TotalNotifications"];
        
    
        if(HomeCoustomerController.totalNotifications != 0){
        dynamic l  = response["data"];
        List l2 = l["Notifications"];
        HomeCoustomerController.listNotification.clear();
        l2.forEach((element) {
          HomeCoustomerController.listNotification.add(NotificationModel.fromJson(element));
          
        }
        );
        }
        
        
        
        //GetStorage storage =  GetStorage();
        // storage.write(ControllerCounsumer.id,coustmerModel!.id);
        // storage.write(ControllerCounsumer.istypeUser,coustmerModel!.istypeUser);
        
      
      }
      update();
  }

}