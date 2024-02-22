class OrderModel {
  late String id;
  String? address;
  String? name;
  String? paymentIntent;
  String? phone;
  String? status;
  String? total;
  String? userId;
  List? shopId;

  OrderModel({
    required this.id,
    required this.address,
    required this.name,
    required this.paymentIntent,
    required this.phone,
    required this.status,
    required this.total,
    required this.userId,
    required this.shopId,
  });

  OrderModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    address = json['address'];
    name = json['name'];
    paymentIntent = json['paymentIntent'];
    phone = json['phone'];
    status = json['status'];
    total = json['total'];
    userId = json['userId'];
    shopId = json['shopId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['address'] = address;
    data['name'] = name;
    data['paymentIntent'] = paymentIntent;
    data['phone'] = phone;
    data['status'] = status;
    data['total'] = total;
    data['userId'] = userId;
    data['shopId'] = shopId;
    return data;
  }
}
