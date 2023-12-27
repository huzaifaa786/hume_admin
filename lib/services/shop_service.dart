// ignore_for_file: avoid_print

import 'package:hume_admin/api/database_api.dart';
import 'package:hume_admin/models/shops.dart';

class Shopservice {
 
  final _databaseApi = DatabaseApi();

  Future<void> createShop({
    required Shop shop,
  }) async {
    await _databaseApi.createShop(shop);
  }

}
