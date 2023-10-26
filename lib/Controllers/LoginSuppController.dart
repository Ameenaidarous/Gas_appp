
import 'package:gas_app/Controllers/ControllerLogin.dart';
import 'package:gas_app/Model/CURD.dart';
import 'package:gas_app/Model/Coustomer.dart';
import 'package:gas_app/Model/Suplier.dart.dart';
import 'package:gas_app/Static/Applink.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../Static/StatusRequest.dart';
import '../TestData/Funcation.dart';
import '../TestData/TestData.dart';
import 'counsumerController.dart';

class LoginSuppController extends GetxController {
  RxBool isArrow = false.obs;
  static String id = "CounsumerId";
  static String istypeUser = "Counsumertype";
  SupplierModel? supplierModel;
  StatusRequest statusRequest = StatusRequest.none;
  GetStorage storage = GetStorage();
  
  TestData testData = TestData(Get.put(Curd()));
  getDataLogin(String phone,String pass) async{
      statusRequest = StatusRequest.lodaing;
      update();
      var response = await testData.getData(linkUrl: loginSupApi, data: {
        "phone":phone,
        "pass":pass
      });
      statusRequest = handlingData(response);
      print(statusRequest);
      if(statusRequest == StatusRequest.success){
        
        supplierModel = SupplierModel.fromJson(response);
        
        GetStorage storage =  GetStorage();
        
       
        storage.write(id,supplierModel!.id);
        storage.write(istypeUser,supplierModel!.istypeUser);
        
        
      }
      update();
  }
  getDataSupp() async{
      statusRequest = StatusRequest.lodaing;
      
      var response = await testData.getData(linkUrl: getSuppByIdphpApi, data: {
        "id":storage.read(ControllerCounsumer.id),
        
      });
      statusRequest = handlingData(response);
      if(statusRequest == StatusRequest.success){
        
       
        supplierModel = SupplierModel.fromJson(response);
        print(supplierModel!.name);
        
        
      update();
  }
  }
  @override
  void onInit() {
    
    if(supplierModel == null){
        getDataSupp();
    }else{
      statusRequest = StatusRequest.success;
    }
    
    super.onInit();
  }
}