import 'package:gas_app/Model/iteam.dart';

import 'BlockM.dart';

class SupplierModel{
  String? id;
  String? name;
  String? phone;
  String? password;
  String? istypeUser;
  String? closeAcountDate;
  String? openAcount;
  String? isCloseAcount;
  BlockM? block;
  
  SupplierModel(this.id,this.name,this.phone,this.password,this.isCloseAcount,this.istypeUser,this.openAcount,this.closeAcountDate,this.block);
  factory SupplierModel.fromJson(Map map){
    return SupplierModel(
      map["data"]["supId"].toString(),map["data"]["suppName"].toString(), map["data"]["suppPhone"].toString(), 
      map["data"]["suppPassword"].toString(), map["data"]["suppIsCloseAcount"].toString(),map["data"]["isTypeUser"].toString(),
      map["data"]["suppOpenDateAcount"].toString(),map["data"]["suppCloseDateAcount"].toString(), BlockM.fromJson(map["data"]["Block"]));
  }
}