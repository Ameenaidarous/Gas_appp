import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:gas_app/Model/CURD.dart';
import 'package:gas_app/Static/StatusRequest.dart';
import 'package:get_storage/get_storage.dart';

import '../Controllers/counsumerController.dart';

class TestData{
  final Curd curd;
  TestData(this.curd);
  
  getData({required String linkUrl,required Map data})async{
    Either response =  await curd.postData(linkUrl, data);
    return response.fold((l) => l, (r) => r);
  }
  getDataNew({required String linkUrl,required Map data})async{
    Either response =  await curd.postDataF(linkUrl, data);
    return response.fold((l) => l, (r) => r);
  }
  getDataWith2Images({required String linkUrl,required Map data,required File imageFileDoc,required String cousImageDoc,required File imageFileProfile,required String cousImageProfile})async{
    Either response =  await curd.postimage2filesNew(linkUrl, data,imageFileDoc,cousImageDoc,imageFileProfile,cousImageProfile);
    return response.fold((l) => l, (r) => r);
  }
  getDataWithImages({required String linkUrl,required Map data,required File imageFileProfile,required String cousImageProfile})async{
    Either response =  await curd.postimagefileNew(linkUrl, data,imageFileProfile,cousImageProfile);
    return response.fold((l) => l, (r) => r);
  }
}









