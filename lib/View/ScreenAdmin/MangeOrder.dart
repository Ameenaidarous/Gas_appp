// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';

// import '../../Static/ColorName.dart';

// class MangeOrder extends StatelessWidget {
//   const MangeOrder({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: ColorName.colorblue,
//         title: Text("ادارة  طلبات ",style: TextStyle(fontSize: 22,color: Colors.white),),
//         centerTitle: true,

//       ),
//       body: SafeArea(
//          child: Column(
//            children: [
//              Expanded(
//                child: ListView.builder(
//                itemBuilder:  (context,i) {
//                     return Container(
//                    height: 240,
//                   width:double.infinity,
//                   padding: EdgeInsets.only(top: 25),
//                   margin: EdgeInsets.only(right: 10,left: 10),
//                       child: Card(
//         elevation: 15,
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//              Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                //Icon(Icons.numbers,color:ColorName.colorblue,),
//                Padding(
//                  padding: const EdgeInsets.only(top: 20,right: 20),
//                  child: Row(
//                    children: [
//                      Text('  رقم الطلب',style: TextStyle(fontSize: 22)),
//                       Text(' 1  ',style: TextStyle(fontSize: 22),),
//                    ],
//                  ),
//                ), 
//               Row(children: [
//                 Padding(
//                   padding: const EdgeInsets.only(top: 20,left: 20),
//                   child: Icon(Icons.arrow_back_ios_new,color:ColorName.colorblue,size: 30,),
//                 )
//               ],
//               )
//               ], 
//             ),
//                 Padding(
//                   padding: const EdgeInsets.only(top: 20,right: 20),
//                   child: Row(
//               children: [
                  
//                           Text(' اسم لعميل : ',style: TextStyle(fontSize: 22)
                          
//                           ), 
//                           Text(' امين  ',style: TextStyle(fontSize: 22),),
//               ],

              
//             ),
//                 ),
//               Padding(
//                 padding: const EdgeInsets.only(right: 21,top: 20),
//                 child: Row(
//                   children: [
//                     Row(
//                     children: [
//                     Text('لعنوان  : ',style: TextStyle(fontSize: 22)), 
//                     Text('الغار الاحمر',style: TextStyle(fontSize: 20),),
//                     ],

                    
//             ),
//                   ],
//                 ),
//               ),
//           ],
//         ),

        
          
      


//       ),
//                     );
                    
//                   },
//                   ),
//              ),
//            ],
//          ),
//        )
//     );
//   }
// } 
    