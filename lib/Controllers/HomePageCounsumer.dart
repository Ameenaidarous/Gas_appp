

import 'package:gas_app/Controllers/CartController.dart';
import 'package:gas_app/Model/NotificationModel.dart';
import 'package:gas_app/Model/iteam_list.dart';
import 'package:gas_app/Static/Applink.dart';
import 'package:gas_app/Widgets/Dailog.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../Model/CURD.dart';
import '../Model/Coustomer.dart';
import '../Model/ProductModel.dart';
import '../Static/StatusRequest.dart';
import '../TestData/Funcation.dart';
import '../TestData/TestData.dart';
import 'counsumerController.dart';

class HomeCoustomerController extends GetxController{
  ControllerCounsumer counsumer = Get.put(ControllerCounsumer());
  CartController cartController = Get.put(CartController());
  
  StatusRequest statusRequest = StatusRequest.lodaing;
  static StatusRequest statusRequest1 = StatusRequest.lodaing;
  StatusRequest statusRequest2 = StatusRequest.none;
  static int totalNotifications = -1;
  GetStorage storage = GetStorage();
  List<ProductsModel> listProducts = [];
  List<ProductsModel> Wi = [];
  static List<NotificationModel>listNotification=[];
  int totalProduct = 0;
  TestData testData = TestData(Get.put(Curd()));
  getDataCoustomer() async{
      statusRequest = StatusRequest.lodaing;
      
      var response = await testData.getData(linkUrl: getCoustomerByIdphpApi, data: {
        "id":storage.read(ControllerCounsumer.id),
        
      });
      statusRequest = handlingData(response);
      if(statusRequest == StatusRequest.success){
        
       
        counsumer.coustmerModel = CoustmerModel.fromJson(response);
        
        
      update();
  } 
}
getDataProducts() async{
      
      statusRequest1 = StatusRequest.lodaing;
      
      var response = await testData.getData(linkUrl: getProductByIdUserphpApi, data: {
        "cousId":storage.read(ControllerCounsumer.id),
        
      });
      statusRequest1 = handlingData(response);
      
      if(statusRequest1 == StatusRequest.success){
        List l1 = [];
        dynamic l  = response["data"];
        totalProduct = l["totalProduct"];
        if(totalProduct != 0){
        l1 = l["products"];
        listProducts.clear();
        l1.forEach((element) {
          
          listProducts.add(ProductsModel.fromJson(element));
        });
        }
        totalNotifications = response["data"]["TotalNotifications"];
        
    
        
        //GetStorage storage =  GetStorage();
        // storage.write(ControllerCounsumer.id,coustmerModel!.id);
        // storage.write(ControllerCounsumer.istypeUser,coustmerModel!.istypeUser);
        
      
      }
      update();
  }
  AddProductCart(int i,String productId,String quantity)async{
    if(i == 0){
      return AlertDialog1(content: "الكمية فارغة",title: "");
    }
    statusRequest2 = StatusRequest.lodaing;
    var response = await testData.getData(linkUrl: addCartApi, data: {
      "productId":productId,
      "quantity":quantity,
      "userId":storage.read(ControllerCounsumer.id),
    });
    statusRequest2 = handlingData(response);
    
    if(statusRequest2 == StatusRequest.success){
      if(response["messege"] == "OutNeed"){
       return AlertDialog1(content: "الكمية اكبر من الكمية الحالية للمنتج",title: "");
      }else{
        cartController.getCart();
        return AlertDialog1(content: "تم اضافة المنتج الى السلة",title: "");
        
      }
      
      // }
    }
    
  }
@override
  void onInit() {
    getDataProducts();
    if(counsumer.coustmerModel == null){
        getDataCoustomer();
    }else{
      statusRequest = StatusRequest.success;
    }
    super.onInit();
  }
  void incrment(int index){
    listProducts[index].quantityP++;
   }
   void descrment(int index){
    if(listProducts[index].quantityP.value != 0) {
      listProducts[index].quantityP--;
    }
   }

}