import 'package:gas_app/Controllers/HomePageCounsumer.dart';
import 'package:gas_app/Model/CURD.dart';
import 'package:gas_app/Model/NotificationModel.dart';
import 'package:gas_app/TestData/TestData.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../Static/Applink.dart';
import '../Static/StatusRequest.dart';
import '../TestData/Funcation.dart';
import 'counsumerController.dart';

class NotificationsController extends GetxController{

  StatusRequest statusRequest = StatusRequest.lodaing;
  GetStorage storage = GetStorage();
  String totalNotification = "";
  List<NotificationModel> listNotifications = [];
  getAllNotifications() async{
      
      statusRequest = StatusRequest.lodaing;
      TestData testData = TestData(Get.put(Curd()));
      var response = await testData.getData(linkUrl: selectNotificationsApi, data: {
        "cousId":storage.read(ControllerCounsumer.id),
        
      });
      statusRequest = handlingData(response);
      
      if(statusRequest == StatusRequest.success){
        
        
        dynamic l  = response["data"];
        
         
        
        if(int.parse(response["data"]["TotalNotifications"].toString()) != 0){
        List l2 = l["Notifications"];
        
        listNotifications.clear();
        l2.forEach((element) {
          
          listNotifications.add(NotificationModel.fromJson(element));
          
        });
        print(listNotifications[0].createDate);
        
        }
        update();
        
        
        //GetStorage storage =  GetStorage();
        // storage.write(ControllerCounsumer.id,coustmerModel!.id);
        // storage.write(ControllerCounsumer.istypeUser,coustmerModel!.istypeUser);
        
      
      }
      update();
  }
  convertNoti(String s){
      DateTime dateTime = DateTime.parse(s);
      String h = dateTime.hour.toString();
      String m = dateTime.hour.toString();
      return "$h:$m";

  }
  getCountNotificationsNotShow() async{
      
      statusRequest = StatusRequest.lodaing;
      TestData testData = TestData(Get.put(Curd()));
      var response = await testData.getData(linkUrl: selectCountNotifiApi, data: {});
      statusRequest = handlingData(response);
      
      if(statusRequest == StatusRequest.success){

        totalNotification = response["data"]["TotalNotifications"];
       
      }
      update();
  }
  @override
  void onInit() {
    getAllNotifications();
    getCountNotificationsNotShow();
    super.onInit();
  }
}