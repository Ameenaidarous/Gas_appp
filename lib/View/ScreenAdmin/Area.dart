
import 'package:flutter/material.dart';
import 'package:gas_app/View/ScreenAdmin/Block.dart';
import 'package:get/get.dart';

import '../../Static/ColorName.dart';
import '../../Static/TextNames.dart';
import '../../Widgets/TextFiled1.dart';

class MyHomeArea extends StatelessWidget {
  final _areaController = TextEditingController();
  final _neighborhoodController = TextEditingController();

  final _areas = List<String>.empty(growable: true).obs;
  final _neighborhoods = List<String>.empty(growable: true).obs;

  void _addAreaAndNeighborhood() {
    final area = _areaController.text;
    final neighborhood = _neighborhoodController.text;

    if (area.isNotEmpty && neighborhood.isNotEmpty) {
      _areas.add(area);
      _neighborhoods.add(neighborhood);

      _areaController.clear();
      _neighborhoodController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorName.coloendBackgraoundLogin,
      appBar: AppBar(
        title: Text("اضافة منطقة",style: TextStyle(fontSize: 30,color: Colors.white),),
        backgroundColor: ColorName.colorblue,
        centerTitle: true,
      ),
      body: ListView(
        
      
        padding: const EdgeInsets.only(top: 100,right: 20,left:20 ),
        children: [
        Textfiled(
            filedControl: _areaController,
            labelText: TextNames.AreaName,
            obsText: false,
            inputType: TextInputType.streetAddress,
            valid: ((p0) {}),
          ),
          SizedBox(height: 150),
          MaterialButton(
            color:ColorName.colorblue,
            padding: EdgeInsets.symmetric(horizontal: 100),
            onPressed:() {
            Get.to(BlockPage());
            },
            child: Text('إضافة',style: TextStyle(fontSize: 30,color: Colors.white),),
          ),
         
       
        ],
      ),
    );
  }
}