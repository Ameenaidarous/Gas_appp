import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:gas_app/Controllers/Tapcontrooler.dart';
import 'package:get/get.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:photo_view/photo_view.dart';

import '../Static/Applink.dart';
//import 'package:photo_view/photo_view.dart';
class ZoomaimageActive extends StatelessWidget {
  int index;
  MangmentCoustomersController mangmentCoustomersController = Get.put(MangmentCoustomersController());
  ZoomaimageActive({required this.index});
  @override
  Widget build(BuildContext context) {
    return  InkWell(
  onTap: () {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Hero(
            tag: "imageHero",
            child: Container(
              height: 400,
              child: PhotoView(
                imageProvider: NetworkImage("$imageDocLink/${mangmentCoustomersController.consumerActive[index].isImageDoc.toString()}"),
                minScale: PhotoViewComputedScale.contained * 1,
                maxScale: PhotoViewComputedScale.covered * 2,
              ),
            ),
          ),
        );
      },
    );
  },
  child: Container(
    height: 150,
    width: 150,
    child: Image.network(
        "$imageDocLink/${mangmentCoustomersController.consumerActive[index].isImageDoc}",
        fit: BoxFit.cover,
     ),
  ),
);
  }
}