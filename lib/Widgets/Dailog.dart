import 'package:flutter/material.dart';
import 'package:get/get.dart';

AlertDialog1({String title = "تنبيه",String? content,IconData? iconData,Color backColor = Colors.blueGrey,Color titleColor = Colors.white,Color contentColor = Colors.white,Color iconColor = Colors.white}){
  return  Get.defaultDialog(
      backgroundColor: backColor,
      title: title,titleStyle: TextStyle(color: titleColor),
      content:Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        iconData != null? Icon(iconData,color: iconColor,):Container(),
                        Text(content!,style: TextStyle(color: contentColor),),
                        
                      ],
                    ));
}