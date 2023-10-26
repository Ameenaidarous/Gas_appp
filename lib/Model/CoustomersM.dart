import 'package:gas_app/Model/iteam.dart';

import 'BlockM.dart';

class CoustmerModelCopy{
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
  String? blockId;
  
  CoustmerModelCopy(this.id,this.name,this.phone,this.password,this.isActivePhone,this.isCloseAcount,this.istypeUser,this.istypeCoustmer,
  this.imageProfle,this.counter,this.isImageDoc,this.isActiveAcount,this.openAcount,
  this.closeAcountDate,this.blockId);
  factory CoustmerModelCopy.fromJson(Map map){
    return CoustmerModelCopy(
      map["cousId"].toString(),map["cousName"], map["cousPhone"], 
      map["cousPass"], map["cousIsActivePhone"].toString(), map["cousIsCloseAcount"].toString(),
       map["isTypeUser"].toString(), map["isTypeCoustomer"].toString(), map["cousImageProfile"],
        map["counterQuntity"].toString(), map["cousImageDoc"], map["cousIsActiveAcount"].toString(),
         map["cousOpenDateAcount"], map["cousCloseDateAcount"].toString(),map["cousBlockId"].toString());
  }
}