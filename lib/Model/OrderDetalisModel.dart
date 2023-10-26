class OrdersDetails {
  List<Orders>? orders;
  String? totalPrice;

  OrdersDetails({this.orders, this.totalPrice});

  OrdersDetails.fromJson(Map<String, dynamic> json) {
    if (json['Orders'] != null) {
      orders = <Orders>[];
      json['Orders'].forEach((v) {
        orders!.add(Orders.fromJson(v));
      });
    }
    totalPrice = json['totalPrice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.orders != null) {
      data['Orders'] = this.orders!.map((v) => v.toJson()).toList();
    }
    data['totalPrice'] = this.totalPrice;
    return data;
  }
}

class Orders {
  String? id;
  String? orderId;
  String? quntity;
  String? totelPriceProduct;
  String? productName;
  String? productDescription;
  String? price;
  String? productImage;

  Orders(
      {this.id,
      this.orderId,
      this.quntity,
      this.totelPriceProduct,
      this.productName,
      this.productDescription,
      this.price,
      this.productImage});

  Orders.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderId = json['orderId'];
    quntity = json['quntity'];
    totelPriceProduct = json['totelPriceProduct'];
    productName = json['productName'];
    productDescription = json['productDescription'];
    price = json['price'];
    productImage = json['productImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['orderId'] = this.orderId;
    data['quntity'] = this.quntity;
    data['totelPriceProduct'] = this.totelPriceProduct;
    data['productName'] = this.productName;
    data['productDescription'] = this.productDescription;
    data['price'] = this.price;
    data['productImage'] = this.productImage;
    return data;
  }
}