// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:gas_app/Model/iteam_list.dart';

// import '../../Static/ColorName.dart';
// import '../../Static/TextNames.dart';


// class Order_Page_Admin extends StatelessWidget {
  

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: ColorName.coloendBackgraoundLogin,
//       appBar: AppBar(
//       title: Text("صفحة الطلبات ",style: TextStyle(color:Colors.white, fontSize: 30),
//       ),
//       centerTitle: true,
//       backgroundColor: ColorName.colorblue,

//       ),
//       body:  SafeArea(
//           child: Expanded(
//               child: ListView.builder(
//                   itemCount: order.length,
//                   itemBuilder: (context, i) {
//                     return Padding(
//                       padding: const EdgeInsets.all(15),
//                       child: Card(
//                               color: Color.fromARGB(255, 247, 247, 248),
//                               elevation: 15,
//                               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//                               child:Column(
//                                     crossAxisAlignment: CrossAxisAlignment.start,
//                                     children: [
//                                       Padding(
//                                         padding: const EdgeInsets.only(top: 15,right: 15,left: 15),
//                                         child: Row(
//                                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                           children: [
//                                             Row(
                                             
//                                               children: [
//                                                  Text(TextNames.ordernaber,
//                                                           style: TextStyle(fontSize: 20)),
//                                                       Text(
//                                                         "${order[i].id}",
//                                                         style: TextStyle(fontSize: 20),
//                                                       ),
//                                               ],
//                                             ),
//                                             Icon(Icons.arrow_back_ios_new_rounded, size: 30, )
//                                           ],

//                                         ),

//                                       ),
//                                       Padding(
//                                         padding: const EdgeInsets.only(top: 15,right: 15),
//                                         child: Row(
                                          
//                                           children: [
//                                           // Text(
//                                           //         TextNames.nameconsumer,
//                                           //         style: TextStyle(fontSize: 20),
//                                           //       ),
//                                           Icon(Icons.person_pin,size: 40,color: ColorName.colorblue,),
//                                                 Padding(
//                                                   padding: const EdgeInsets.only(right: 15),
//                                                   child: Text(order[i].nameConsumer,
//                                                       style: TextStyle(fontSize: 20)
//                                                       ),
//                                                 ),
//                                         ],
//                                         ),
//                                       ),
                                     
//                                       Padding(
//                                         padding: const EdgeInsets.only(top: 15,bottom: 10),
//                                         child: Row(
//                                           mainAxisAlignment: MainAxisAlignment.spaceAround,
//                                           children: [
//                                             Row(
                                                 
//                                               children: [

//                                                 Padding(
//                                                   padding: const EdgeInsets.only(left: 5),
//                                                   child: Icon(
//                                                         Icons.phone,
//                                                         size: 30,
//                                                         color:ColorName.colorblue,
//                                                       ),
//                                                 ),
//                                              Text(
//                                                       "735567645",
//                                                       style: TextStyle(fontSize: 20),
//                                                     ),
//                                               ],
//                                             ),
//                                                Row(
//                                           children: [
//                                             Padding(
//                                               padding: const EdgeInsets.only(left: 5),
//                                               child: Icon(
//                                                       Icons.date_range,
//                                                       size: 30,
//                                                       color:
//                                                          ColorName.colorblue,
//                                                     ),
//                                             ),
//                                              Text(order[i].date,
//                                                       style: TextStyle(fontSize: 20)),
                                                  
//                                           ],
//                                         ),
//                                           ],
//                                         ),
//                                       ),
                                   
                                     
                                     
                                      
//                                     ],
//                                   ),
                             
                             
//                               ),
//                     );
                    
                    
//                   }
//                   )
//                   ),
//         ),
//     );
//   }
// }