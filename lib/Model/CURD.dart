import 'dart:convert';

import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:gas_app/Controllers/CheckConnection.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import '../Static/StatusRequest.dart';
class Curd{

  Future<Either<StatusRequest, Map>> postData(String linkUrl,Map data)async{
      try{
      if(CheckConnection.connectionInternet){
       http.Response response = await http.post(Uri.parse(linkUrl),body: data);
        
        if(response.statusCode == 200 || response.statusCode == 201){
          
          Map responseBody = jsonDecode(response.body);
          print(responseBody);
          if(responseBody["status"] == "success"){
          print(responseBody);
          return Right(responseBody);
          }else{
            return const Left(StatusRequest.faliure);
          }
        }else{
          print(response.statusCode);
          return const Left(StatusRequest.serverFalure);
        }
      }else{
        return  const Left(StatusRequest.offlineFalure);
      }
      
      }catch(_){
        return const Left(StatusRequest.otherError);
      }
  }
  Future<Either<StatusRequest, Map>> postDataF(String linkUrl,Map data)async{
      try{
      if(CheckConnection.connectionInternet){
       http.Response response = await http.post(Uri.parse(linkUrl),body: data);
        if(response.statusCode == 200 || response.statusCode == 201){
          
          Map responseBody = jsonDecode(response.body);
          return Right(responseBody);
          
        }else{
          return const Left(StatusRequest.serverFalure);
        }
      }else{
        return  const Left(StatusRequest.offlineFalure);
      }
      
      }catch(_){
        return const Left(StatusRequest.otherError);
      }
  }
  postimagefile(String url,Map data,File file,String filename)async{
 var request = http.MultipartRequest("POST",Uri.parse(url));
 var stream = http.ByteStream(file.openRead());
 var length =await file.length();
 http.MultipartFile multipartFile = http.MultipartFile(filename,stream,length,filename: basename(file.path));
 request.files.add(multipartFile);
 data.forEach((key, value) { 
  request.fields[key] = value;
 });
 var myrequest = await request.send();
 var response = await http.Response.fromStream(myrequest);
 if(response.statusCode == 200){
  Map responseBody = jsonDecode(response.body);
  
  if(responseBody["status"] == "success"){
    print("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
    return true;
  }else{
    false;
  }
 }else{
 return false;
 }
 return false;
  }
  
postimage2files(String url,Map data,File file,String filename,File file1,String filename1)async{
    
 var request = http.MultipartRequest("POST",Uri.parse(url));
 var stream = http.ByteStream(file.openRead());
 var length =await file.length();
 var stream1 = http.ByteStream(file1.openRead());
 var length1 =await file1.length();
 http.MultipartFile multipartFile = http.MultipartFile(filename,stream,length,filename: basename(file.path));
 request.files.add(multipartFile);
 http.MultipartFile multipartFile1 = http.MultipartFile(filename1,stream1,length1,filename: basename(file1.path));
 request.files.add(multipartFile1);
 data.forEach((key, value) { 
  request.fields[key] = value;
 });
 var myrequest = await request.send();
 var response = await http.Response.fromStream(myrequest);
 if(response.statusCode == 200){
  Map responseBody = jsonDecode(response.body);
  print(responseBody.toString()+"-----");
  if(responseBody["status"] == "success"){
    
    return true;
  }else{
    false;
  }
 }else{
 return false;
 }
 return false;
  }

Future<Either<Map,StatusRequest>>postimagefileNew(String url,Map data,File file,String filename)async{
 try{ 
 var request = http.MultipartRequest("POST",Uri.parse(url));
 var stream = http.ByteStream(file.openRead());
 var length =await file.length();
 http.MultipartFile multipartFile = http.MultipartFile(filename,stream,length,filename: basename(file.path));
 request.files.add(multipartFile);
 data.forEach((key, value) { 
  request.fields[key] = value;
 });
 var myrequest = await request.send();
 var response = await http.Response.fromStream(myrequest);
 if(response.statusCode == 200){
  Map responseBody = jsonDecode(response.body);
  return Left(responseBody);
 }else{
  return const Right(StatusRequest.serverFalure);
 }
  
 
 
  }catch(ex){
    return const Right(StatusRequest.otherError);
  }
  



}
Future<Either<Map,StatusRequest>>postimage2filesNew(String url,Map data,File file,String filename,File file1,String filename1)async{
 try{
 var request = http.MultipartRequest("POST",Uri.parse(url));
 var stream = http.ByteStream(file.openRead());
 var length =await file.length();
 var stream1 = http.ByteStream(file1.openRead());
 var length1 =await file1.length();
 http.MultipartFile multipartFile = http.MultipartFile(filename,stream,length,filename: basename(file.path));
 request.files.add(multipartFile);
 http.MultipartFile multipartFile1 = http.MultipartFile(filename1,stream1,length1,filename: basename(file1.path));
 request.files.add(multipartFile1);
 data.forEach((key, value) { 
  request.fields[key] = value;
 });
 var myrequest = await request.send();
 var response = await http.Response.fromStream(myrequest);
 if(response.statusCode == 200){
  Map responseBody = jsonDecode(response.body);
  return Left(responseBody);
  
 }else{
  return const Right(StatusRequest.serverFalure);
 }
 }catch(ex){
    return const Right(StatusRequest.otherError);
  }
}
}
