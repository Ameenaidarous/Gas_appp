import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  TextEditingController nema=TextEditingController();
  TextEditingController password=TextEditingController();
    TextEditingController location=TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('الملف الشخصي'),),
      

      body: Stack(
        children: [
          Container(
            height: 50,
            width: double.infinity,
            child: CircleAvatar(backgroundImage: AssetImage("imagess/12.png"),maxRadius: 40,child: 
            Container(height: 10,width: 10,
          

            decoration: BoxDecoration(
              color: Colors.red,
            borderRadius: BorderRadius.circular(50)
            ),

                        )),
            
            color: Color.fromARGB(255, 0, 23, 125),
          ),
          Row(children: [
            Text("الاسم"),TextField(
              controller: nema,
            

            ),
                 Text("كلمة المرور"),TextField(
              controller: nema,
            

            ),     Text("رقم الجوال"),TextField(
              controller: nema,
            

            ),
                 Text("عنوان السكن"),TextField(
              controller: nema,
            

            ),




          ],)
          

          

          

          
          




        ],




      ),







    );
  }
}