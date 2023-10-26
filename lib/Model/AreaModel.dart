class AreaM{
  String? id;
  String? name;
  AreaM({this.id,this.name});

    factory AreaM.fromJson(Map from){
    return AreaM(
        id:from["areaId"].toString(),
        name:from["areaName"]
    );
     
   }
}