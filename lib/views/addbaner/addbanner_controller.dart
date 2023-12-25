import 'dart:io';

import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:hume_admin/api/image_selection.dart';

class AddBannerController extends GetxController {
  static AddBannerController instance = Get.find();
  final _imageSelectorApi = ImageSelectorApi();
  File? bannerImage;
  String? bannerImageName; // Variable to store the name

  Future selectProfileImage() async {
    final tempImage = await _imageSelectorApi.selectImage();
    bannerImage = tempImage;
    if (bannerImage != null) {
      // Get the name of the selected image
      bannerImageName = basename(bannerImage!.path);
    }

    update();
  }
}
