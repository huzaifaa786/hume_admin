import 'dart:io';

import 'package:get/get.dart';
import 'package:hume_admin/api/image_selection.dart';

class AddBannerController extends GetxController {
  static AddBannerController instance = Get.find();
  final _imageSelectorApi = ImageSelectorApi();
  File? bannerImage;
  Future selectProfileImage() async {
    final tempImage = await _imageSelectorApi.selectImage();
    bannerImage = tempImage;

    update();
  }
}
