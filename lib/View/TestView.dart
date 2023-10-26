import 'package:flutter/material.dart';
import 'package:gas_app/Controllers/counsumerController.dart';
import 'package:get/get.dart';

import '../Static/Applink.dart';

class MyWidget extends StatelessWidget {
  MyWidget({super.key});
  final ControllerCounsumer controllerCounsumer = Get.put(ControllerCounsumer());
  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      appBar: AppBar(),
      body: Container(child: Image.network(height: 300,width: 300,"$imageDocLink/${controllerCounsumer.coustmerModel!.isImageDoc.toString()}"),));
  }
}