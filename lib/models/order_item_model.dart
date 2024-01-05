// ignore_for_file: prefer_collection_literals

class OrderItemModel {
  late String id;
  late String orderId;
  late String productId;
  late String quantity;
  late String size;
  late String total;

  OrderItemModel({
    required this.id,
    required this.orderId,
    required this.productId,
    required this.quantity,
    required this.size,
    required this.total,
  });

  OrderItemModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderId = json['orderId'];
    productId = json['productId'];
    quantity = json['quantity'];
    size = json['size'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['orderId'] = orderId;
    data['productId'] = productId;
    data['quantity'] = quantity;
    data['size'] = size;
    data['total'] = total;

    return data;
  }
}
