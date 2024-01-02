// ignore_for_file: avoid_print

import 'package:hume_admin/api/database_api.dart';
import 'package:hume_admin/models/home_banner_model.dart';
//import 'package:hume_admin/modal/home_banner_model.dart';
import 'package:hume_admin/models/shops.dart';

class Bannerservice {
  final _databaseApi = DatabaseApi();

  Future<void> createBanner({
    required HomeBanner banner,
  }) async {
    print('object_____________________');
    await _databaseApi.createBanner(banner);
  }
}
