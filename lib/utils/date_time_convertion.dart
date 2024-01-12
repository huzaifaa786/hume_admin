import 'package:intl/intl.dart';

String convertTimestampToDate(String timestampString) {
  int timestamp = int.parse(timestampString);
  DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp);
  String formattedDate = DateFormat("dd/MM/yyyy").format(dateTime);
  return formattedDate;
}