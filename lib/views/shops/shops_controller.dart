import 'dart:io';

import 'package:get/get.dart';
import 'package:hume_admin/api/image_selection.dart';

class ShopController extends GetxController {
  static ShopController instance = Get.find();
  final _imageSelectorApi = ImageSelectorApi();
  File? profileImage;
  Future selectImage() async {
    final tempImage = await _imageSelectorApi.selectImage();
    profileImage = tempImage;

    update();
  }
}
