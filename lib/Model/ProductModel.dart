import 'package:get/get.dart';

class ProductsModel{
 String? id;
 String? name;
 String? price;
 String? description;
 String? image;
 RxInt quantityP = 0.obs;
 String? quantity;
 String? supId;
 ProductsModel(this.id,this.name,this.price,this.description,this.quantity,this.image,this.supId);
 ProductsModel.counter(this.id,this.name,this.price,this.description,this.quantity,this.image,this.supId,this.quantityP);
 factory ProductsModel.fromJson(Map map){
  return ProductsModel(map["productId"].toString(),map["productName"],map["price"],map["productDescription"],map["quantity"].toString(),map["productImage"],map["proSuppId"].toString());
 }
}