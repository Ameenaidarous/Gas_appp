class NotificationModel {
  String? id;
  String? notifiName;
  String? notifContent;
  String? sender;
  String? isShow;
  String? cousId;
  String? supId;
  String? createDate;
  String? isDeleted;
  

  NotificationModel(
      {this.id,
      this.notifiName,
      this.notifContent,
      this.sender,
      this.isShow,
      this.cousId,
      this.supId,
      this.createDate,
      this.isDeleted,
      });

  NotificationModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];toString();
    notifiName = json['NotifiName'];
    notifContent = json['NotifContent'];
    sender = json['Sender'];
    isShow = json['isShow'];toString();
    cousId = json['cousId'];toString();
    supId = json['supId'];toString();
    createDate = json['createDate'];toString();
    isDeleted = json['isDeleted'];toString();
  }
}