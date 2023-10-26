  import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:gas_app/Static/ColorName.dart';


class TextFiledGas1 extends StatelessWidget {
    
final IconData iconTextFiled;
final String labelText;
final bool? obsText;
final TextEditingController filedControl;
final TextInputType? inputType;
final void Function()? onPressed1;
final String? Function(String?) valid;
final bool? bool1;

TextFiledGas1({required this.iconTextFiled,this.bool1,this.onPressed1,required this.labelText,this.obsText = false,this.inputType = TextInputType.text,required this.valid,required this.filedControl});
  @override
  Widget build(BuildContext context) {
    if(bool1 == true){
      return Row(
        children: [
          Expanded(child: MaterialButton(height: 50,color: Colors.lightBlue,child: Text("تحقق",style: TextStyle(color: Colors.white),),onPressed: onPressed1)),
          Expanded(
            flex: 4,
            child: Container(
                  width: 350,
                  height: 70,
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: filedControl,
                    keyboardType: inputType,
                    validator: valid,
                    
                    decoration: InputDecoration(
                      
                      labelText: labelText,
                      labelStyle: TextStyle(color: ColorName.textTextFiled),
                      prefixIcon: Icon(iconTextFiled,color: ColorName.iconTextFiled,),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Colors.white)),
                      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Colors.white)),
                      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Colors.white)),
                      filled: true,
                      fillColor: Colors.white, 
                      ),
                      obscureText: obsText!,
                      
                      ),
                
            ),
          ),
        ],
      );
    }
    return Container(
            width: 350,
            height: 70,
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: filedControl,
              keyboardType: inputType,
              validator: valid,
              
              decoration: InputDecoration(
                
                labelText: labelText,
                labelStyle: TextStyle(color: ColorName.textTextFiled),
                prefixIcon: Icon(iconTextFiled,color: ColorName.iconTextFiled,),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Colors.white)),
                enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Colors.white)),
                focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Colors.white)),
                filled: true,
                fillColor: Colors.white, 
                ),
                obscureText: obsText!,
                
                ),
          
      );
    }
  }