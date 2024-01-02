import 'dart:io';

import 'package:get/get.dart';
import 'package:hume_admin/api/database_api.dart';
import 'package:hume_admin/api/storage_api.dart';
import 'package:hume_admin/helper/data_model.dart';
import 'package:hume_admin/models/home_banner_model.dart';
//import 'package:hume_admin/modal/home_banner_model.dart';
import 'package:hume_admin/services/banner_service.dart';
import 'package:path/path.dart';
import 'package:hume_admin/api/image_selection.dart';

class AddBannerController extends GetxController {
  static AddBannerController instance = Get.find();
  final _imageSelectorApi = ImageSelectorApi();

// List to store image names

  final _storeImageApi = StorageApi();
  final _bannerService = Bannerservice();
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

  Future storeBanner() async {
    print('object****************');
    var id = DateTime.now().millisecondsSinceEpoch.toString();
    final CloudStorageResult result = await _storeImageApi.uploadHomeBanner(
        imageName: bannerImageName.toString(), imageToUpload: bannerImage!);
    result.imageFileName.toString();
    result.imageUrl.toString();
  

    print('object****************123213');

    await _bannerService.createBanner(
        banner: HomeBanner(
      id: id,
      imageName: result.imageFileName.toString(),
      imageUrl1: result.imageUrl.toString(),
      imageUrl2: result.imageUrl.toString(),
      imageUrl3: result.imageUrl.toString(),
    ));
    // clear();
    update();
  }
}
