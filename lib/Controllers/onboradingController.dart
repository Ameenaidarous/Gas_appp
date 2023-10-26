import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../Model/iteam_list.dart';
import '../Static/PageName.dart';


abstract class OnboardingController extends GetxController{
  next();
  onPagesChanged(int index);
  

}
class OnboardingControllerImp extends OnboardingController{
  late PageController pageController;
  int CurrentPage=0;
  @override
  next() {
  CurrentPage++;
  if(CurrentPage>onbordinlist.length-1){
    Get.offNamed((PageName.scrrenview));

  }else{
     pageController.animateToPage(CurrentPage, duration: const Duration(milliseconds: 900), curve: Curves.easeInOut);
  }
  }
  
  @override
  onPagesChanged(int index) {
    CurrentPage=index;
    update();
    
  }
  @override
  void onInit() {
    pageController=PageController();
    super.onInit();
  }

}
