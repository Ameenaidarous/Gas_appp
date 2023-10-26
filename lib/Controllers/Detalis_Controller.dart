import 'package:gas_app/Model/OrderDetalisModel.dart';
import 'package:get/get.dart';

import '../Model/CURD.dart';
import '../Static/Applink.dart';
import '../Static/StatusRequest.dart';
import '../TestData/Funcation.dart';
import '../TestData/TestData.dart';
import 'Demo.dart';

class OrderdetailesControoler extends GetxController{

  String? orderId;
  String? totalPrice;

  StatusRequest statusRequest = StatusRequest.none;
  OrdersDetails? ordersDetails;
  TestData testData = TestData(Get.put(Curd()));
  getOrderDetails()async{

      // print(orderId);
      // print(totalPrice);
       statusRequest = StatusRequest.lodaing;
       var response = await testData.getData(linkUrl: selectAllDetalisApi, data: {
        "orderId":orderId,
        "totalPrice":totalPrice


      });
      statusRequest = handlingData(response);
      print(statusRequest);
      if(statusRequest == StatusRequest.success){
      ordersDetails = OrdersDetails.fromJson(response["data"]);
      
      

      }
      update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    orderId = Get.arguments["orderId"];
    totalPrice = Get.arguments["totalPrice"];
  
    getOrderDetails();
    super.onInit();
  }


}