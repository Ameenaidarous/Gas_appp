import 'package:gas_app/Controllers/Demo.dart';
import 'package:gas_app/Model/CURD.dart';
import 'package:gas_app/Static/Applink.dart';
import 'package:gas_app/Static/StatusRequest.dart';
import 'package:gas_app/TestData/Funcation.dart';
import 'package:gas_app/TestData/TestData.dart';
import 'package:get/get.dart';

import '../Model/Suplier.dart.dart';
import '../Model/suppliersModel.dart';

class SupplierControllerAll extends GetxController{

  StatusRequest statusRequest = StatusRequest.none;
  List<SupplierModel1>? listSuppliers;
  TestData testData = TestData(Get.put(Curd()));
  getAllSuppliers()async{
      statusRequest = StatusRequest.lodaing;
      var response = await testData.getData(linkUrl: selectAllSuppApi, data: {});
      statusRequest = handlingData(response);
      List list = response["data"];
      listSuppliers =  convertJson<SupplierModel1>((map) => SupplierModel1.fromJson(map),list);
      update();
  }



  @override
  void onInit() {
    // TODO: implement onInit
    getAllSuppliers();
    super.onInit();
  }

}