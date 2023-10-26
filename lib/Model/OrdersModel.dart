class OrdersModel {
  String? orderId;
  String? totalPrice;
  String? cousName;
  String? createDate;
  String? stateOrder;
  String? typeService;
  String? isDeleted;
  String? cousPhone;
  String? cousBlockId;
  String? cousBlockName;

  OrdersModel(
      {this.orderId ,
      this.totalPrice,
      this.cousName,
      this.createDate,
      this.stateOrder,
      this.typeService,
      this.isDeleted,
      this.cousPhone,
      this.cousBlockId,
      this.cousBlockName,
 });

  OrdersModel.fromJson(Map<dynamic, dynamic> json) {
    orderId = json['orderId'].toString();
    totalPrice = json['totalPrice'].toString();
    cousName = json['cousName'].toString();
    createDate = json['createDate'].toString();
    stateOrder = json['stateOrder'].toString();
    typeService = json['typeService'].toString();
    isDeleted = json['isDeleted'].toString();
    cousPhone = json['cousPhone'].toString();
    cousBlockId = json['blockId'].toString();
    cousBlockName = json['blockName'].toString();
  }
}