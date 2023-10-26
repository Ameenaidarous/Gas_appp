import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gas_app/View/ScreenConsumer/Myordercancelled.dart';

import 'Myorder.dart';
import 'Myordercomplete.dart';

class MyOder extends StatelessWidget {
  const MyOder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Color(0xfff6f6f8),
      appBar: AppBar(
         title: Text("طلباتي",style: TextStyle(color: Colors.black,fontSize: 24),),
          centerTitle: true,
          backgroundColor: Color(0xfff6f6f8),
          elevation: 0,
      ),
      body: PageView(children: [
        MyOrderpending(),
        MyOrderComplete(),
        MyOrderCancelled(),
      ],),
    );
  }
}