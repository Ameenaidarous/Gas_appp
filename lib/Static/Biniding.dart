import 'package:gas_app/Model/CURD.dart';
import 'package:get/get.dart';

class InitialBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(Curd());
  }

}