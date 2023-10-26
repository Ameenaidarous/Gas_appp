import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../Static/ColorNam.dart';
import 'Button.dart';

class ViewNotificatinDetalis extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 246, 245, 245),
      appBar: AppBar(title: Text("تفاصيل الاشعارات",style: TextStyle(fontSize: 25,color: Colors.white),
      
      ),
      centerTitle: true,
      backgroundColor: ColorName.colorblue,
      ),
      body:  Container(
        height:double.infinity,
        child: Form(
         // key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Card(
              elevation: 15,

              child: SingleChildScrollView(
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20,left: 25,right: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("عنوان",style: TextStyle(fontSize: 25,color: ColorName.colorblue),),
                        TextFormField(
                          decoration: InputDecoration(
                            fillColor: Colors.white, 
                             border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide:BorderSide.none),
                          ),
                              
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:50,right: 25,left: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("الرسالة",style: TextStyle(fontSize: 25,color: ColorName.colorblue),),
                        TextFormField(
                         maxLines: 10,
                          decoration: InputDecoration(
                            
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide:BorderSide.none),
                          ),
                        ),
                      ],
                    ),
                  ),
                
               
                ],
                ),
              ),
            ),
          ),
    
        ),
      )
     
    );
  }
}