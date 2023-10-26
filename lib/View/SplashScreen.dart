import 'package:flutter/material.dart';
import 'package:gas_app/View/splashviewbody.dart';
import '../Static/ColorName.dart';

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorName.colorblue,
      body:splashviewbody(),

    );
  }
}
