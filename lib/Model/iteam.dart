import 'dart:convert';

import 'package:flutter/src/material/card.dart';
/// كلاسات تبع مشرف
class mycard{
  final icon;
  final title;
  bool inactive=false;
  mycard(this.icon,this.title,this.inactive);
}
class Complaint {
  final String title;
  final String description;

  Complaint(this.title, this.description);
}
class detailsmangmeent {
 
 
 final int Quantiy;
 
 final String image;
 final int Total;
 final String NameProdect;
 final String servicetype;


detailsmangmeent(this.Quantiy,this.Total,this.NameProdect,this.servicetype,this.image,);
}

class Ordermanagment{
  final int Id;
  final String NameConsumer;
  final String NameSupplier;
  final String Orderdate;
  Ordermanagment(this.NameConsumer,this.NameSupplier,this.Id,this.Orderdate);
}
class dataconsumer{
  final int phone;
  final String name;
  final String Areas;
  final String Block;
  final String date;
  dataconsumer(this.name,this.phone,this.Block,this.Areas,this.date);

}
class Block {
  String name;
  String color;

  Block({required this.name, required this.color});
}
class Area {
  String name;
  List<Block> blocks;

  Area({required this.name, required this.blocks});
}
// كلاسات تبع المورد
class MyHome{
  final icon;
  final title;
  final pageName;
  
 
  MyHome(this.icon,this.title,this.pageName);
}
class Mangmentorder{
  final int id;
  final String nameConsumer;
  final String namesupplier;
  final String date;
  final String nameservies;

  Mangmentorder(this.id,this.nameConsumer,this.namesupplier,this.date,this.nameservies,);
}
class MangamentProduct {
  
  String description;
  int quantity;
  double price;
  String image;
  String productName;
  // ignore: non_constant_identifier_names
  MangamentProduct({required this.productName, required this.description, required this.quantity, required this.price, required this.image});
}
class notification{
String title;
String description; 
String time;
String images;
notification(this.title,this.description,this.time,this.images);
}



/// كلاسات العملاء
///سلة الكلاس صفحة 
class Basket{
final String images;
final int Total;
final String NameProdect;
final int quantity;
final int price;
Basket(this.NameProdect,this.Total,this.images,this.quantity,this.price);
}

/// الكلاس صفحة myorder
class consumerOrderpage{
  final int orderNumber;
  final String images;
  final String productsName;
  final String dateorder;
  final int  quantity;
  final double totalPrice;
  final String servertypes;
  consumerOrderpage(this.productsName,this.images,this.dateorder,this.totalPrice,this.quantity,this.servertypes,this.orderNumber);

}
class Product {
  final String images;
  final String name;
  final double price;
  final int quantity;

  Product({required this.name, required this.price, required this.quantity,required this.images});
}

class onbordinmoder{
  final String? title;
  final String? images;
  final String? body;
  onbordinmoder({this.title,this.images,this.body});
}