class OrdersItemsModel {
  late String id;
  String? productId;
  String? quantity;
  String? size;
  String? total;
  String? orderId;
  OrdersItemsModel({
    required this.id,
    required this.productId,
    required this.quantity,
    required this.size,
    required this.total,
    required this.orderId,
  });

  OrdersItemsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['productId'];
    quantity = json['quantity'];
    size = json['size'];
    total = json['total'];
    orderId = json['orderId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['productId'] = productId;
    data['quantity'] = quantity;
    data['size'] = size;
    data['total'] = total;
    data['orderId'] = orderId;
    return data;
  }
}
