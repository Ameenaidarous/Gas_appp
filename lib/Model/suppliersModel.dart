class SupplierModel1 {
  String? supId;
  String? suppName;
  String? suppPhone;
  String? suppPassword;
  String? isTypeUser;
  String? supBlockId;
  String? suppOpenDateAcount;
  String? suppCloseDateAcount;
  String? suppIsCloseAcount;
  String? suppStatus;
  String? blockId;
  String? blockName;
  String? areaId;

  SupplierModel1(
      {this.supId,
      this.suppName,
      this.suppPhone,
      this.suppPassword,
      this.isTypeUser,
      this.supBlockId,
      this.suppOpenDateAcount,
      this.suppCloseDateAcount,
      this.suppIsCloseAcount,
      this.suppStatus,
      this.blockId,
      this.blockName,
      this.areaId});

  SupplierModel1.fromJson(Map<String, dynamic> json) {
    supId = json['supId'].toString();
    suppName = json['suppName'];
    suppPhone = json['suppPhone'];
    suppPassword = json['suppPassword'];
    isTypeUser = json['isTypeUser'].toString();
    supBlockId = json['supBlockId'].toString();
    suppOpenDateAcount = json['suppOpenDateAcount'];
    suppCloseDateAcount = json['suppCloseDateAcount'];
    suppIsCloseAcount = json['suppIsCloseAcount'].toString();
    suppStatus = json['suppStatus'].toString();
    blockId = json['blockId'].toString();
    blockName = json['blockName'].toString();
    areaId = json['areaId'].toString();
  }
}