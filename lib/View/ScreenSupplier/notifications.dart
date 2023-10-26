

// import 'package:flutter/material.dart';

// import '../../Static/ColorName.dart';
// import '../../model/iteam_list.dart';
// class notifications extends StatelessWidget {
  

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//        backgroundColor:ColorName.colobeginBackgraoundLogin,
//       appBar: AppBar(
//         title: Text("الاشعارات",style: TextStyle(fontSize: 24),),
//         centerTitle: true,
//        backgroundColor:ColorName.colobeginBackgraoundLogin,
//        elevation: 0,
//       ),
//       body: SafeArea(child:ListView.builder(
//         itemCount: listnotification.length,
//         itemBuilder:((context, index) {
//           return Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Card(
//               color: Color.fromARGB(255, 251, 251, 253),
//               shape:RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(15)
//                     ),
//               elevation: 10,
//              child: ListTile(
//               title: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                 Text("${listnotification[index].title}",style: TextStyle(fontSize: 20,color: Color(0xff528fbc)),),
//                 Row(
//                   children: [
                    
//                     Text("${listnotification[index].time}",style: TextStyle(fontSize: 20,color: Color(0xff528fbc)
//                     ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(right: 5,bottom: 15),
//                       child:Icon(Icons.circle,color: Colors.red,size: 40,)
//                     ),
//                   ],
//                 )
//               ],            
//               ),
//               subtitle: Text("${listnotification[index].description}",style: TextStyle(fontSize: 20,color: Color(0xff528fbc)),

//               ),
//               leading:Image.asset("Assets/imagess/${listnotification[index].images}",width:100,)
//               ),
//              ),
//           );
        
//         }
//         )
//         )
      
//        ),
//     );
//   }
// }