
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:gas_app/Static/ColorNam.dart';
// import 'package:gas_app/Widgets/Button.dart';

// import 'TextFiled1.dart';
// import 'TextfiledConfig.dart';

// class Config extends StatelessWidget {
  

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color.fromARGB(255, 238, 238, 240),
//       body: SingleChildScrollView(child:
      
//       Column(children: [
//       Image.asset("Assets/imagess/Logo.png"),
//       Text("التحقق",style: TextStyle(color: Colors.black,fontSize: 30,fontWeight: FontWeight.bold),
//       ),
//       Text("ادخل رمز التحقق  عبر واتس ",style: TextStyle(fontSize: 20),
//       ),
//       Padding(
//         padding: const EdgeInsets.all(20),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//           Row(children: [
//             Textfiled(),
//           ],
//           ),
//           Row(children: [
//             Textfiled(),
//           ],
//           ),
//             Row(children: [
//             Textfiled(),
//           ],
//           ),
//            Row(children: [
//             Textfiled(),
//           ],
//           ),
//           Row(children: [
//             Textfiled(),
//           ],
//           ),
//         ],
//         ),
//       ),
//       Padding(
//         padding: const EdgeInsets.only(top: 10),
//         child: ButtonSign( 
//           text: "التحقق",
//           onTap: (){},
//         ),
//       ),
//       Padding(
//         padding: const EdgeInsets.only(top: 10,left: 10,right: 10),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(" لم يتم ارسل  رقم التحقق  ؟  ",style: TextStyle(fontSize: 20),),
//             InkWell(child: Text("ارسال رمز حديد",style: TextStyle(fontSize: 20,color: ColorName.colorblue),
//             ),
//             onTap: (){},
//             ),
//           ],
//         ),
//       ),
      
      

//       ],
//       )
//        ),
//     );
//   }
// }