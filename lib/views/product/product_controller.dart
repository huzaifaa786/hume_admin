

import 'dart:developer';

import 'package:hume_admin/api/database_api.dart';
import 'package:hume_admin/api/stroage_api.dart';
import 'package:hume_admin/helper/data_model.dart';
import 'package:hume_admin/models/product_model.dart';
import 'package:hume_admin/api/product_api.dart';

import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hume_admin/api/image_selection.dart';
import 'package:hume_admin/models/shops.dart';
import 'package:hume_admin/utils/ui_utils.dart';

class ProductController extends GetxController {
  static ProductController instance = Get.find();

  final _productApi = ProductApi();
  List<ProductModel> shopProducts = [];

  final _databaseApi = DatabaseApi();
  TextEditingController ProductnameController = TextEditingController();
  TextEditingController productpriceController = TextEditingController();
  TextEditingController productdiscriptionController = TextEditingController();
  final _imageSelectorApi = ImageSelectorApi();
  final _storageApi = StorageApii();
  String category = '';
  List<String> selectedSizes = [];
  List<File> productImages = [];
  List<String> productImageNames = [];
  List<Shop> shops = [];
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
  void onInit() {
    getAllshops();
    GetOneproducts();
    log('ddddddddddddddddddd');
    ProductnameController.addListener(() {
      checkFields();
    });
    productpriceController.addListener(() {
      checkFields();
    });
    productdiscriptionController.addListener(() {
      checkFields();
    });
    products();

    super.onInit();
  }

  int selectedIndex = -1;

  void toggleSize(String size) {
    if (selectedSizes.contains(size)) {
      selectedSizes.remove(size);
    } else {
      selectedSizes.add(size);
    }

    update();
  }

  Future selectImages() async {
    final tempImages = await _imageSelectorApi.selectMultiImage();
    productImages = tempImages;
    checkFields();
    update();
  }

  Future<void> getAllshops() async {
    shops = await _databaseApi.getAllShops();

    print(shops);
    checkFields();
    update();
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

  Future saveProduct() async {
    final productId = DateTime.now().millisecondsSinceEpoch.toString();
    category = categories[selectedIndex];
    final imageUrls = await uploadImages(productId);
    final product = ProductModel(
      id: productId,
      shopId: selectedShop!.id,
      productName: ProductnameController.text,
      productPrice: productpriceController.text,
      productDescription: productdiscriptionController.text,
      category: category,
      selectedSizes: selectedSizes,
      productImageNames: imageUrls,
      productImageUrls: imageUrls,
    );

    try {
      await _productApi.createProduct(product);
      clearFields();
    } catch (e) {
      print('Error saving product: $e');
    }
    UiUtilites.successAlert(Get.context, 'Product Add\nSuccessfully !');
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

  void clearFields() {
    ProductnameController.clear();
    productpriceController.clear();
    productdiscriptionController.clear();
    selectedSizes.clear();
    productImages.clear();
    productImageNames.clear();
    selectedIndex = -1;
    selectedShop = null;
    category = '';
    areFieldsFilled.value = false;
    update();
  }

  products() async {
    String id = Get.parameters['id'].toString();
    shopProducts = await _databaseApi.fetchProducts(id);
    update();
  }

  GetOneproducts() async {
    try {
      String id = Get.parameters['id'].toString();
      ProductModel? product = await _productApi.getProductById(id);

      if (product != null) {
        print('Product found: $product');
        print(product);
      } else {
        print('Product not found');
      }

      update();
    } catch (e) {
      print('Error fetching product: $e');
    }
  }
}
