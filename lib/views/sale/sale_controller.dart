import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:hume_admin/helper/loading.dart';
import 'package:hume_admin/models/order_model.dart';
import 'package:table_calendar/table_calendar.dart';

class SaleController extends GetxController {
  static SaleController instance = Get.find();
  CalendarFormat format = CalendarFormat.month;
  var format1 = 'month';
  DateTime ourdate = DateTime.now();
  DateTime today = DateTime.now();
  DateTime? rangeStart;
  DateTime? rangeEnd;

  bool isOpen = false; // Add this property

  void open() {
    isOpen = true;
    update();
  }

  void close() {
    isOpen = false;
    update();
  }

  void onFormatChanged(DateTime date) {
    today = date;
    ourdate = date;
    rangeStart = null;
    rangeEnd = null;
    getsale();
    update();
  }

  void onDaySelected(DateTime day, DateTime foucsedDay) async {
    today = day;
    ourdate = day;
    getsale();
    update();
  }

  void onRangeSelected(start, end, focusedDay) {
    rangeStart = start;
    rangeEnd = end;
    today = focusedDay;
    ourdate = focusedDay;
    if (end == null) {
      getsale();
    } else {
      getSalesBySelectedRange(start, end);
    }
    update();
  }

  double sum = 0;

  double getsale() {
    List<OrderModel> fetchSales;
    fetchSales = orders;
    sum = 0;
    for (var sale in fetchSales) {
      DateTime dateTime =
          DateTime.fromMillisecondsSinceEpoch(int.parse(sale.id));
      DateTime formattedDate =
          DateTime.utc(dateTime.year, dateTime.month, dateTime.day, 0, 0, 0, 0);
      DateTime formattedTodate =
          DateTime.utc(today.year, today.month, today.day, 0, 0, 0, 0);
      if (formattedDate.toUtc() == formattedTodate.toUtc()) {
        sum += double.parse(sale.total!);
      }
    }
    update();
    return sum;
  }

  List<OrderModel> orders = <OrderModel>[].obs;

  Future<void> fetchSale() async {
    try {
      LoadingHelper.show();
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('orders')
          // .where('status', isEqualTo: 3)
          .get();

      List<OrderModel> fetchSale = querySnapshot.docs.map((doc) {
        print(List<OrderModel>);
        return OrderModel.fromJson(doc.data() as Map<String, dynamic>);
      }).toList();
      orders = <OrderModel>[].obs;
      orders = fetchSale;
      getsale();
      update();
      LoadingHelper.dismiss();
    } catch (e) {
      print('Error fetching orders: $e');
    }
  }

  double getSalesBySelectedRange(DateTime startDate, DateTime endDate) {
    List<OrderModel> fetchSales = orders;
    // print(fetchSales);
    sum = 0;
    DateTime formattedStartDate = DateTime.utc(
        startDate.year, startDate.month, startDate.day, 0, 0, 0, 0);
    DateTime formattedEndDate =
        DateTime.utc(endDate.year, endDate.month, endDate.day, 0, 0, 0, 0);
    for (var sale in fetchSales) {
      DateTime saleDate =
          DateTime.fromMillisecondsSinceEpoch(int.parse(sale.id));
      DateTime formattedSaleDate =
          DateTime.utc(saleDate.year, saleDate.month, saleDate.day, 0, 0, 0, 0);
      if ((formattedSaleDate.isAfter(formattedStartDate) ||
              formattedSaleDate.isAtSameMomentAs(formattedStartDate)) &&
          (formattedSaleDate.isBefore(formattedEndDate) ||
              formattedSaleDate.isAtSameMomentAs(formattedEndDate))) {
        sum += double.parse(sale.total!);
      }
    }
    update();
    print(sum);
    return sum;
  }

  clear() {
    ourdate = DateTime.now();
    today = DateTime.now();
    sum = 0;
    rangeStart = null;
    rangeEnd = null;
    orders = [];
    update();
  }
}
