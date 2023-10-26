class BlockM{
  String? id;
  String? name; 
  String? areaId;
  BlockM({this.id,this.name,this.areaId});
  BlockM.withoutFkId(this.id,this.name);
  factory BlockM.fromJson(Map from){
    return BlockM(
        id:from["blockId"].toString(),
        name:from["blockName"],
        areaId: from["areaId"].toString()
    );
     
   }
}