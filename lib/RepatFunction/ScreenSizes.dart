import 'package:flutter/cupertino.dart';

double perWidth(BuildContext context,{whidth}){
  whidth /=  100;
  return MediaQuery.of(context).size.width * whidth;
}
double perHigh(BuildContext context,double high){
  high /=  100;
  return MediaQuery.of(context).size.width * high;
}
int perHighInt(BuildContext context,double high){
  high /=  100;
  return (MediaQuery.of(context).size.width * high).round();
}