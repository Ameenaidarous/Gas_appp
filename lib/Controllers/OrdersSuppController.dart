import 'package:gas_app/Model/OrdersModel.dart';
import 'package:gas_app/Model/iteam_list.dart';
import 'package:gas_app/Static/Applink.dart';
import 'package:gas_app/Widgets/Dailog.dart';
import 'package:get/get.dart';

import '../Model/CURD.dart';
import '../Static/StatusRequest.dart';
import '../TestData/Funcation.dart';
import '../TestData/TestData.dart';
import 'Demo.dart';

class OrdersSuppController extends GetxController{

  StatusRequest statusRequest = StatusRequest.none;
  String? blockId;
  String? orderId;
  List<OrdersModel>? listorders;
  List<OrdersModel> listordersNow = [];
  List<OrdersModel> listordersComplete = [];
  List<OrdersModel> listordersCancels = [];
  TestData testData = TestData(Get.put(Curd()));
   getAllOrders()async{
    
      statusRequest = StatusRequest.lodaing;
      
      var response = await testData.getData(linkUrl: selectAllOrdersForApi, data: {
        "blockId":blockId,


      });
      statusRequest = handlingData(response);
      print(statusRequest);
      if(statusRequest == StatusRequest.success){
      List list = response["data"]["Orders"];
      listorders =  convertJson<OrdersModel>((map) => OrdersModel.fromJson(map),list);
      
      
      listordersNow = listorders!.where((element) => element.stateOrder == "0").toList();
      listordersComplete = listorders!.where((element) => element.stateOrder == "1").toList();
      listordersCancels = listorders!.where((element) => element.stateOrder == "-1").toList();
      
      
      }
      update();
   }
   String convertdate(DateTime dateTime){
      String y = dateTime.year.toString();
      String m = dateTime.month.toString();
      String d = dateTime.day.toString();
      return "$y/$m/$d";
   }
  
    cancelOrder()async{
      statusRequest = StatusRequest.lodaing;
      update();
      var response = await testData.getData(linkUrl: updateStateOrders, data: {
        "orderId":orderId!,
        "stateOrder":"-1"


      });
      statusRequest = handlingData(response);
     
      if(statusRequest == StatusRequest.success){
        getAllOrders();
      }else{
        AlertDialog1(title: "fill",content: "");
      }
      update();



    }
    
    acceptOrder()async{
      statusRequest = StatusRequest.lodaing;
      update();
      var response = await testData.getData(linkUrl: updateStateOrders, data: {
        "orderId":orderId!,
        "stateOrder":"1"


      });
      statusRequest = handlingData(response);
      print(statusRequest);
      if(statusRequest == StatusRequest.success){
        getAllOrders();
      }else{
        AlertDialog1(title: "fill",content: "");
      }
      update();



    }

  @override
  void onInit() {
    // TODO: implement onInit
    blockId = Get.arguments["blockId"];
    
    getAllOrders();
    super.onInit();
  }



}