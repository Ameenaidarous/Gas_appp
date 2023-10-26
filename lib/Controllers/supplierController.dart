

import 'package:gas_app/Model/CURD.dart';
import 'package:gas_app/Model/Coustomer.dart';
import 'package:gas_app/Static/Applink.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../Static/StatusRequest.dart';
import '../TestData/Funcation.dart';
import '../TestData/TestData.dart';

class controllerSupplier extends GetxController {
  RxBool isArrow = false.obs;
  GetStorage storage =  GetStorage();
  static String id = "CounsumerId";
  static String istypeUser = "Counsumertype";
  CoustmerModel? coustmerModel;
  StatusRequest statusRequest = StatusRequest.otherError;
  
  TestData testData = TestData(Get.put(Curd()));
  getDataLogin(String phone,String pass) async{
      statusRequest = StatusRequest.lodaing;
      update();
      var response = await testData.getData(linkUrl: LoginApi, data: {
        "phone":phone,
        "pass":pass,
      });
      statusRequest = handlingData(response);
      if(statusRequest == StatusRequest.success){
        
        coustmerModel = CoustmerModel.fromJson(response);
        print("------------------------------");
        
        storage.write(controllerSupplier.id,coustmerModel!.id);
        storage.write(controllerSupplier.istypeUser,coustmerModel!.istypeUser);
        
      }
      update();
  }
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    if(storage.read(controllerSupplier.id)){

    }
  }
  
  
}