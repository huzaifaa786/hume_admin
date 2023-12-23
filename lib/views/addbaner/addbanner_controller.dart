import 'dart:io';

import 'package:get/get.dart';
import 'package:hume_admin/api/image_selection.dart';

class AddBannerController extends GetxController {
  static AddBannerController instance = Get.find();
  final _imageSelectorApi = ImageSelectorApi();
  File? profileImage;
  Future selectProfileImage() async {
    final tempImage = await _imageSelectorApi.selectImage();
    profileImage = tempImage;

    update();
  }
}
