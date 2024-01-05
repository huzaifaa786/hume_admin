import 'package:get/get.dart';
import 'package:hume_admin/api/order_api.dart';
import 'package:hume_admin/models/order_item_model.dart';

class OrderController extends GetxController {
  static OrderController instance = Get.find();
  final _orderApi = OrderApi();

  final String orderId = Get.parameters['orderId'].toString();
  List<OrderItemModel> fetchOrderItems = [];
  List<Map<String, dynamic>> products = [];

  @override
  void onInit() {
    super.onInit();
    fetchproducts();
    update();
  }

  fetchproducts() async {
    fetchOrderItems = await _orderApi.fetchOrderItems(orderId);
    for (var orderitem in fetchOrderItems) {
      final productDetail = await _orderApi.fetchProduct(orderitem.productId);

      final product = {
        'productName': productDetail!.productName.toString(),
        'productImage': productDetail.productImageUrls[0],
        'size': orderitem.size,
        'quantity': orderitem.quantity,
        'total': orderitem.total,
      };
      products.add(product);
    }
    update();
  }
}
