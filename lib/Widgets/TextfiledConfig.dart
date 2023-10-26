import 'package:flutter/material.dart';

import '../RepatFunction/ScreenSizes.dart';
import '../Static/ColorName.dart';



class TextfiledConfig extends StatelessWidget {


  
  final TextEditingController textEditingController;
  TextfiledConfig(this.textEditingController);
  @override
  Widget build(BuildContext context) {
    return Container(
            width: 60,
            height: 100,
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: TextFormField(
                controller: textEditingController,
          obscureText: false,
           maxLength: 1,
           keyboardType:TextInputType.number,
                decoration: InputDecoration(
                
                  
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Colors.white)),
                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Colors.white)),
                  focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Colors.white)),
                  filled: true,
                  fillColor: Colors.white,
                  ),
                 
                  
                  ),
            ),
          
      );
  }
}