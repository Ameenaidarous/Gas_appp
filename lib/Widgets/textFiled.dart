  import 'package:flutter/material.dart';
import 'package:gas_app/Static/ColorName.dart';


class TextFiledGas extends StatelessWidget {
    
final IconData iconTextFiled;
final String labelText;
final bool? obsText;
final TextEditingController filedControl;
final TextInputType? inputType;
final String? Function(String?) valid;

TextFiledGas({required this.iconTextFiled,required this.labelText,this.obsText = false,this.inputType = TextInputType.text,required this.valid,required this.filedControl});
  @override
  Widget build(BuildContext context) {
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
                labelStyle: TextStyle(color:Color(0xffd2d1d4),fontSize: 22),
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