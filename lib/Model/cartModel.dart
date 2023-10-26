import 'dart:convert';

class CartModel {
  List<Products>? products;
  String? totalPrice;

  CartModel(this.products,this.totalPrice);

  CartModel.fromJson(Map<String, dynamic> json) {
    
      products = [];
      json['Products'].forEach((v) {
        products!.add(Products.fromJson(v));
      });
      totalPrice = json["TotalPrice"].toString();

    }
    
  }

  


class Products {
  
  String? cptId;
  String? cartId;
  String? cousId;
  String? productName;
  String? productImage;
  String? price;
  String? quantity;
  String? totalPriceProduct;
  String? productId;

  Products(
      {
      this.cptId,
      this.cartId,
      this.cousId,
      this.productName,
      this.productImage,
      this.price,
      this.quantity,
      this.totalPriceProduct,
      this. productId});

  Products.fromJson(Map<String, dynamic> json) {
    
    cptId = json['cptId'].toString();
    cartId = json['CartId'].toString();
    cousId = json['cousId'].toString();
    productName = json['productName'];
    productImage = json['productImage'];
    price = json['price'].toString();
    quantity = json['quantity'].toString();
    totalPriceProduct = json['TotalPriceProduct'].toString();
    productId= json["productId"].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cptId'] = this.cptId;
    data['CartId'] = this.cartId;
    data['cousId'] = this.cousId;
    data['productName'] = this.productName;
    data['productImage'] = this.productImage;
    data['price'] = this.price;
    data['quantity'] = this.quantity;
    data['TotalPriceProduct'] = this.totalPriceProduct;
    data['productId'] = this.productId;
    return data;
  }
}