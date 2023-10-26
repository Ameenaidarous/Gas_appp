import 'package:flutter/material.dart';

import '../../Static/ColorName.dart';
import '../../Widgets/TheList.dart';

class mylist extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:ColorName.colobeginBackgraoundLogin,
      appBar: AppBar(title: Text('القائمة ',style: TextStyle(fontSize: 30),
      ),
      backgroundColor: ColorName.colobeginBackgraoundLogin,
      elevation: 0,
      centerTitle: true,
      ),
      body: Listmore(),
    );
  }
}
