// ignore_for_file: prefer_collection_literals

class NotificationModel {

  late String notificationId;
  late String orderId;
  late String userId;
  late String shopId;
  late String content;
  late bool forAdmin;
  late bool seen;

  NotificationModel({
    required this.notificationId,
    required this.orderId,
    required this.userId,
    required this.shopId,
    required this.content,
    required this.forAdmin,
    required this.seen,
  });

 NotificationModel.fromJson(Map<String, dynamic> json) {
    notificationId = json['notificationId'];
    orderId = json['orderId'];
    userId = json['userId'];
    shopId = json['shopId'];
    content = json['content'];
    forAdmin = json['forAdmin'];
    seen = json['seen'];
  }
  
 Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['notificationId'] = notificationId;
    data['orderId'] = orderId;
    data['userId'] = userId;
    data['shopId'] = shopId;
    data['content'] = content;
    data['forAdmin'] = forAdmin;
    data['seen'] = seen;
    return data;
  }

}
