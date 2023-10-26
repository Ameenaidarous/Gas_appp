import 'package:gas_app/Controllers/Demo.dart';
import 'package:gas_app/Controllers/counsumerController.dart';
import 'package:gas_app/Model/CURD.dart';
import 'package:gas_app/Static/Applink.dart';
import 'package:gas_app/Static/StatusRequest.dart';
import 'package:gas_app/TestData/Funcation.dart';
import 'package:gas_app/TestData/TestData.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../Model/OrdersModel.dart';

class OrdersController extends GetxController{

  GetStorage storage=GetStorage();

  StatusRequest statusRequest = StatusRequest.none;
  List<OrdersModel>? listorders;
  TestData testData = TestData(Get.put(Curd()));
  List<OrdersModel> listordersNow = [];
  List<OrdersModel> listordersComplete = [];
  List<OrdersModel> listordersCancels = [];
  getAllOrders()async{
      statusRequest = StatusRequest.lodaing;
      var response = await testData.getData(linkUrl: selectAllOrdersApi, data: {
        "cousId":storage.read(ControllerCounsumer.id)


      });
      statusRequest = handlingData(response);
      print(statusRequest);
      if(statusRequest == StatusRequest.success){
      List list = response["data"];
      listorders =  convertJson<OrdersModel>((map) => OrdersModel.fromJson(map),list);
      listordersNow = listorders!.where((element) => element.stateOrder == "0").toList();
      listordersComplete = listorders!.where((element) => element.stateOrder == "1").toList();
      listordersCancels = listorders!.where((element) => element.stateOrder == "-1").toList();
      }
      update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getAllOrders();
    super.onInit();
  }

}