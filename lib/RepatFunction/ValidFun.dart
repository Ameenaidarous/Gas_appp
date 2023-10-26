
phoneOrNameFiled(String val,{bool? isPhone,required int min,required int max}){
    if(val.isEmpty){
          return "يرجى تعبئة الحقل";
    }      
    else if(isPhone == true){
      
      if(!val.startsWith("77")&&!val.startsWith("73")&&!val.startsWith("78")&&!val.startsWith("71")&&!val.startsWith("70")){
         
          return "خطأ في ادخال الرقم";
      }else if(val.length > max || val.length <= min){
        return "يجب ادخال مابين 8 الى 20 حرف و رقم";
      }
      /*
      else if(isPhone == false){
        
      }
    */
    }
} 
confirmPasswor(String val,{required String pass,required int min,required int max}){
    if(val.isEmpty){
          return "يرجى تعبئة الحقل";
    }if(val.length > max || val.length <= min){
        return "يجب ادخال مابين 8 الى 20 حرف و رقم";
      }else if(val != pass){
        return "كلمة السر غير متطابقة";
      }
    
    
} 