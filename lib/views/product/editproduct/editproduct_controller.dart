import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hume_admin/api/stroage_api.dart';
import 'package:hume_admin/api/database_api.dart';
import 'package:hume_admin/api/image_selection.dart';
import 'package:hume_admin/api/product_api.dart';
import 'package:hume_admin/api/storage_api.dart';
import 'package:hume_admin/helper/data_model.dart';
import 'package:hume_admin/models/product_model.dart';
import 'package:hume_admin/models/shops.dart';
import 'package:hume_admin/utils/ui_utils.dart';

class EditProductController extends GetxController {
  static EditProductController instance = Get.find();

  TextEditingController ProductnameController = TextEditingController();
  TextEditingController productpriceController = TextEditingController();
  TextEditingController productdiscriptionController = TextEditingController();
  final _databaseApi = DatabaseApi();
  List<Shop> shops = [];
  String category = '';
  List<String> selectedSizes = [];
  final _imageSelectorApi = ImageSelectorApi();
  final _storageApi = StorageApii();
  List<File> productImages = [];
  List<dynamic> mergedList = [];
  List<String> productImageNames = [];
  List<dynamic> productNetworkImages = [];
  final _productApi = ProductApi();
  Shop? shop;
  Shop? selectedShop;
  RxBool areFieldsFilled = false.obs;

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
  void toggleSize(String size) {
    if (selectedSizes.contains(size)) {
      selectedSizes.remove(size);
    } else {
      selectedSizes.add(size);
    }

    update();
  }

  void deletenetworkImage(int index) {
    if (index >= 0 && index < productNetworkImages.length) {
      productNetworkImages.removeAt(index);
      update();
    }
  }

  void deletefileImage(int index) {
    if (index >= 0 && index < productImages.length) {
      productImages.removeAt(index);
      update();
    }
  }

  void onInit() {
    print('ssssssssssssssssssssssssssssssssssssssssss');
    getAllshops();
    GetOneproducts();

    ProductnameController.addListener(() {
      checkFields();
    });
    productpriceController.addListener(() {
      checkFields();
    });
    productdiscriptionController.addListener(() {
      checkFields();
    });

    super.onInit();
  }

  int selectedIndex = -1;

  Future<void> getAllshops() async {
    shops = await _databaseApi.getAllShops();

    print(shops);
    checkFields();
    update();
  }

  Future selectImages() async {
    final tempImages = await _imageSelectorApi.selectMultiImage();
    productImages = tempImages;
    checkFields();
    update();
  }

  void checkFields() {
    if (ProductnameController.text.isNotEmpty &&
        productpriceController.text.isNotEmpty &&
        productdiscriptionController.text.isNotEmpty &&
        selectedIndex != -1 &&
        productImages.isNotEmpty &&
        selectedShop != null) {
      areFieldsFilled.value = true;
      update();
    } else {
      areFieldsFilled.value = false;
      update();
    }
  }

  Future<void> getOneshops(shopId) async {
    shop = await _databaseApi.getShopById(shopId);
    selectedShop = shops.firstWhereOrNull((element) => element.id == shop!.id);
    update();
  }

  GetOneproducts() async {
    try {
      String id = Get.parameters['id'].toString();

      ProductModel? product = await _productApi.getProductById(id);

      if (product != null) {
        getOneshops(product.shopId);
        ProductnameController.text = product.productName;
        productpriceController.text = product.productPrice;
        productdiscriptionController.text = product.productDescription;
        selectedSizes = product.selectedSizes;
        selectedIndex = categories.indexOf(product.category);
        productNetworkImages = product.productImageUrls;
      } else {}

      update();
      checkFields();
    } catch (e) {
      print('Error fetching product: $e');
    }
  }

  Future<List<String>> uploadImages(productId) async {
    List<String> imageUrls = [];

    for (var image in productImages) {
      try {
        final CloudStorageResult storageResult =
            await _storageApi.uploadProfileImage(
          productId: productId,
          imageToUpload: image,
        );

        imageUrls.add(storageResult.imageUrl);
      } catch (e) {
        print('Error uploading image: $e');
      }
    }
    return imageUrls;
  }

  Future<List<String>> updateProductImages(productId, productImages) async {
    List<String> imageUrls = [];

    for (var image in productImages) {
      try {
        final CloudStorageResult storageResult =
            await _storageApi.uploadProfileImage(
          productId: productId,
          imageToUpload: image,
        );

        imageUrls.add(storageResult.imageUrl);
      } catch (e) {
        print('Error uploading image: $e');
      }
    }

    return imageUrls;
  }

  Future<void> updateProduct() async {
    String productId = Get.parameters['id'].toString();
    List<String> newImageUrls = await uploadImages(productId);

    List<String> updatedImageUrls = [
      ...productNetworkImages,
      ...newImageUrls,
    ];

    try {
      if (selectedShop != null) {
        await _productApi.updateProduct(
          productId,
          ProductModel(
              id: productId,
              productName: ProductnameController.text,
              productPrice: productpriceController.text,
              productDescription: productdiscriptionController.text,
              selectedSizes: selectedSizes,
              category: categories[selectedIndex],
              shopId: selectedShop!.id,
              productImageUrls: updatedImageUrls,
              productImageNames: updatedImageUrls),
        );
      }
    } catch (e) {
      print('Error updating product: $e');
    }

    clearFields();
    UiUtilites.successAlert(Get.context, 'Product Edit\nSuccessfully !');
  }

  void clearFields() {
    ProductnameController.clear();
    productpriceController.clear();
    productdiscriptionController.clear();
    selectedSizes.clear();

    productImageNames.clear();
    selectedIndex = -1;
    selectedShop = null;
    category = '';
    areFieldsFilled.value = false;
    update();
  }
}