// ignore_for_file: avoid_print

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hume_admin/api/storage_api.dart';
import 'package:hume_admin/helper/data_model.dart';
import 'package:hume_admin/models/shops.dart';
import 'package:hume_admin/routes/app_routes.dart';
import 'package:hume_admin/services/shop_service.dart';
import 'package:hume_admin/utils/ui_utils.dart';
import 'package:path/path.dart';
import 'package:hume_admin/api/image_selection.dart';

class ShopController extends GetxController {
  static ShopController instance = Get.find();
  final _imageSelectorApi = ImageSelectorApi();

  final _shopService = Shopservice();
  final _imagestorageApi = StorageApi();

  RxBool arefieldsFilled = false.obs;
  bool isBannerSelected = false;
  bool isLogoSelected = false;

  String id = '';
  String bannerUrl = '';
  String logoUrl = '';
  TextEditingController name = TextEditingController();
  TextEditingController description = TextEditingController();

  File? bannerImage;
  File? logoImage;

  String? bannerImageName;
  String? logoImageName;

  Future selectImage() async {
    final tempImage = await _imageSelectorApi.selectImage();
    bannerImage = tempImage;
    if (bannerImage != null) {
      // Get the name of the selected image
      bannerImageName = basename(bannerImage!.path);
      isBannerSelected = true;
    }
    update();
  }

  Future selectLogo() async {
    final tempImage = await _imageSelectorApi.selectImage();
    logoImage = tempImage;
    if (logoImage != null) {
      // Get the name of the selected image
      logoImageName = basename(bannerImage!.path);
      isLogoSelected = true;
    }
    update();
  }

  void checkFields() {
    if (name.text.isNotEmpty && description.text.isNotEmpty) {
      arefieldsFilled.value = true;
      update();
    } else {
      arefieldsFilled.value = false;
      update();
    }
  }

  @override
  void onInit() {
    super.onInit();
    name.addListener(() {
      checkFields();
    });
    description.addListener(() {
      checkFields();
    });
  }

  Future createShop() async {
    id = DateTime.now().millisecondsSinceEpoch.toString();

    final CloudStorageResult bannerImageResult = await _imagestorageApi
        .uploadBannerImage(shopId: id, imageToUpload: bannerImage!);
    final CloudStorageResult logoImageResult = await _imagestorageApi
        .uploadLogoImage(shopId: id, imageToUpload: logoImage!);

    await _shopService.createShop(
        shop: Shop(
      id: id,
      name: name.text,
      description: description.text,
      bannerImageUrl: bannerImageResult.imageUrl,
      bannerImageName: bannerImageResult.imageFileName,
      logoImageUrl: logoImageResult.imageUrl,
      logoImageName: logoImageResult.imageFileName,
    ));
    Get.toNamed(AppRoutes.addshop);
    UiUtilites.successAlert('Shop created successfully', 'Congratulations');
  }
}
