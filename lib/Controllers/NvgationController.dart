import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxInt selectedIndex = 1.obs;
  void changePage(int index) {
    selectedIndex.value = index;
    update();
  }
}