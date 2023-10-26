import 'package:flutter/material.dart';


import 'package:get/get.dart';

class AccountController extends GetxController {
  var data = "امين العيدروس".obs;
   var data1 = "735567645".obs;
   var data2 = "الشرج - الغار الاحمر ".obs;

  void updateData(String newData) {
    data.value = newData;
    data1.value=newData;
  }

  void changeData() {
    showDialog(
      context: Get.context!,
      builder: (context) => AlertDialog(
        title: Text('تعديل في بيانات '),
        content: TextFormField(
          initialValue: data.value,
          onChanged: (value) {
            updateData(value);
          },
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('اغلاق'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('حفظ'),
          ),
        ],
      ),
    );
  }
}