// ignore_for_file: avoid_print

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hume_admin/api/database_api.dart';
import 'package:hume_admin/api/storage_api1.dart';
import 'package:hume_admin/helper/data_model.dart';
import 'package:hume_admin/helper/loading.dart';
import 'package:hume_admin/models/shops.dart';
import 'package:hume_admin/routes/app_routes.dart';
import 'package:hume_admin/services/shop_service.dart';
import 'package:hume_admin/utils/ui_utils.dart';
import 'package:path/path.dart';
import 'package:hume_admin/api/image_selection.dart';

class ShopController extends GetxController {
  static ShopController instance = Get.find();

  List<Shop> shops = [];
  Shop? shopDetails;

  final _shopService = Shopservice();
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
    'Clothes',
    'Furniture',
    'Bags and shoes',
    'Makeup',
    'Home & kitchen',
    'Skin & Hair Products',
    'Perfumes',
    'Devices',
    'Accessories',
    'Personal Services',
    'Foods'
  ];

  Future selectImage() async {
    final tempImage = await _imageSelectorApi.selectImage();

    bannerImage = tempImage;

    if (bannerImage != null) {
      bannerImageName = basename(bannerImage!.path);

      isBannerSelected = true;
    }
    update();
  }

  Future selectLogo() async {
    final tempImage = await _imageSelectorApi.selectImage();

    logoImage = tempImage;

    if (logoImage != null) {
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
    index();
    update();
  }

  Future createShop() async {
    LoadingHelper.show();
    id = DateTime.now().millisecondsSinceEpoch.toString();
    category = categories[selectedIndex];

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
      category: category,
    ));
    clear();
    update();
    LoadingHelper.dismiss();
    UiUtilites.successSnackbar('Shop created successfully', 'Congratulatios');
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

//----------fetch all shops-------------
  index() async {
    shops = await _databaseApi.fetchShops();
    update();
  }

//------------delete shop---------------
  Future deleteShop(String id) async {
    await _databaseApi.deleteShop(id);

    shops = await index();
    UiUtilites.successAlert(context, 'Success');
    update();
  }

//-----------update shop----------
  shopDetail(String id) async {
    shopDetails = await _databaseApi.editShop(id);
    name.text = shopDetails!.name.toString();
    description.text = shopDetails!.description.toString();
    int index = categories.indexOf(shopDetails!.category.toString());
    if (index != -1) {
      selectedIndex = index;
    }
    Get.toNamed(AppRoutes.editshop);
  }

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
    clear();
    update();
    LoadingHelper.dismiss();
    Get.toNamed(AppRoutes.shop);
    UiUtilites.successSnackbar('Shop updated successfully', 'Congratulatios');
  }
}
