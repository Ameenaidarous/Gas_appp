import 'package:gas_app/Model/iteam.dart';

import 'BlockM.dart';

class CoustmerModel{
  String? id;
  String? name;
  String? phone;
  String? password;
  String? isActivePhone;
  String? isActiveAcount;
  String? istypeUser;
  String? istypeCoustmer;
  String? imageProfle;
  String? counter;
  String? isImageDoc;
  String? closeAcountDate;
  String? openAcount;
  String? isCloseAcount;
  BlockM? block;
  
  CoustmerModel(this.id,this.name,this.phone,this.password,this.isActivePhone,this.isCloseAcount,this.istypeUser,this.istypeCoustmer,
  this.imageProfle,this.counter,this.isImageDoc,this.isActiveAcount,this.openAcount,
  this.closeAcountDate,this.block);
  factory CoustmerModel.fromJson(Map map){
    return CoustmerModel(
      map["data"]["cousId"].toString(),map["data"]["cousName"], map["data"]["cousPhone"], 
      map["data"]["cousPass"], map["data"]["cousIsActivePhone"].toString(), map["data"]["cousIsCloseAcount"].toString(),
       map["data"]["isTypeUser"].toString(), map["data"]["isTypeCoustomer"].toString(), map["data"]["cousImageProfile"],
        map["data"]["counterQuntity"].toString(), map["data"]["cousImageDoc"], map["data"]["cousIsActiveAcount"].toString(),
         map["data"]["cousOpenDateAcount"], map["data"]["cousCloseDateAcount"].toString(), BlockM.fromJson(map["data"]["Block"]));
  }
}