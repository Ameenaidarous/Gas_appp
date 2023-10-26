import 'package:dartz/dartz.dart';
import 'package:gas_app/Static/StatusRequest.dart';

handlingData(response){
  if(response is StatusRequest){
    return response;
  }else{
    return StatusRequest.success;
  }
}
handlingDataNew(response){
  if(response is StatusRequest){
    return response;
  }else{
    if(response["status"] == "success"){
    return StatusRequest.success;
    }else{
      
      return StatusRequest.faliure;
    }
  }
}
handlingDataNew1(response){
  if(response is StatusRequest){
    return response;
  }else{
    
    return StatusRequest.success;
    }
  
}