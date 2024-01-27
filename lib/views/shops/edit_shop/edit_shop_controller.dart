// ignore_for_file: avoid_print

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hume_admin/api/database_api.dart';
import 'package:hume_admin/api/storage_api1.dart';
// import 'package:hume_admin/api/storage_api.dart';
import 'package:hume_admin/helper/data_model.dart';
import 'package:hume_admin/helper/loading.dart';
import 'package:hume_admin/models/shops.dart';
import 'package:hume_admin/utils/ui_utils.dart';
import 'package:path/path.dart';
import 'package:hume_admin/api/image_selection.dart';

class EditShopController extends GetxController {
  static EditShopController instance = Get.find();

  List<Shop> shops = [];
  Shop? shopDetails;

  final _imagestorageApi = StorageApi();
  final _databaseApi = DatabaseApi();
  final _imageSelectorApi = ImageSelectorApi();

  RxBool arefieldsFilled = false.obs;
  bool isBannerSelected = false;
  bool isLogoSelected = false;

  String id = '';
  String bannerUrl = '';
  String logoUrl = '';
  String category = '';
  TextEditingController name = TextEditingController();
  TextEditingController description = TextEditingController();

  File? bannerImage;
  File? logoImage;

  String? bannerImageName;
  String? logoImageName;

  int selectedIndex = -1;

  List<String> categories = [
    'Clothes'.tr,
    'Furniture'.tr,
    'Bags and Shoes'.tr,
    'MakeUp'.tr,
    'Home & Kitchen'.tr,
    'Skin & Hair Products'.tr,
    'Perfumes'.tr,
    'Devices'.tr,
    'Accessories'.tr,
    'Personal Services'.tr,
    'Foods'.tr
  ];

  @override
  void onInit() {
    super.onInit();
    name.addListener(() {
      checkFields();
    });
    description.addListener(() {
      checkFields();
    });
    shopDetail();
    update();
  }

  Future selectImage() async {
    final tempImage = await _imageSelectorApi.selectImage();
    bannerImage = tempImage;
    if (bannerImage != null) {
      bannerImageName = basename(bannerImage!.path);
      isBannerSelected = true;
    }
    update();
  }

  selectLogo() async {
    final tempImage = await _imageSelectorApi.selectImage();
    logoImage = tempImage;
    if (logoImage != null) {
      logoImageName = basename(logoImage!.path);
      update();
      print(logoImage);
    }
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

  clear() {
    name.clear();
    description.clear();
    bannerImage = null;
    logoImage = null;
    bannerImageName = '';
    logoImageName = '';
    category = '';
    selectedIndex = -1;
    isLogoSelected = false;
    isBannerSelected = false;
    bannerUrl = '';
    logoUrl = '';
    shopDetails = null;
  }

//-----------fetching shop details----------
  shopDetail() async {
    id = Get.parameters['id'].toString();
    shopDetails = await _databaseApi.editShop(id);
    name.text = shopDetails!.name.toString();
    description.text = shopDetails!.description.toString();
    bannerUrl = shopDetails!.bannerImageUrl.toString();
    bannerImageName = shopDetails!.bannerImageName.toString();
    logoUrl = shopDetails!.logoImageUrl.toString();
    logoImageName = shopDetails!.logoImageName.toString();
    int index = categories.indexOf(shopDetails!.category.toString());
    if (index != -1) {
      selectedIndex = index;
    }
    update();
  }

//------------update shop with new values------------
  updateShop() async {
    LoadingHelper.show();

    if (bannerImage != null) {
      final CloudStorageResult bannerImageResult = await _imagestorageApi
          .uploadBannerImage(shopId: id, imageToUpload: bannerImage!);
      bannerUrl = bannerImageResult.imageUrl;
      bannerImageName = bannerImageResult.imageFileName;
    } else {
      bannerUrl = shopDetails!.bannerImageUrl.toString();
      bannerImageName = shopDetails!.bannerImageName.toString();
    }

    if (logoImage != null) {
      final CloudStorageResult logoImageResult = await _imagestorageApi
          .uploadLogoImage(shopId: id, imageToUpload: logoImage!);

      logoUrl = logoImageResult.imageUrl;
      logoImageName = logoImageResult.imageFileName;
    } else {
      logoUrl = shopDetails!.logoImageUrl.toString();
      logoImageName = shopDetails!.logoImageName.toString();
    }

    category = categories[selectedIndex];

    _databaseApi.updateShop(Shop(
      id: shopDetails!.id.toString(),
      name: name.text,
      description: description.text,
      bannerImageUrl: bannerUrl,
      bannerImageName: bannerImageName,
      logoImageUrl: logoUrl,
      logoImageName: logoImageName,
      category: category,
    ));
    update();
    LoadingHelper.dismiss();
    Get.back();
    clear();
    UiUtilites.successSnackbar(
        'Shop updated successfully'.tr, 'Congratulatios'.tr);
  }
}
