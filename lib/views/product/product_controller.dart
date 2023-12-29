import 'package:hume_admin/api/database_api.dart';
import 'package:hume_admin/api/stroage_api.dart';
import 'package:hume_admin/helper/data_model.dart';
import 'package:hume_admin/modal/product_model.dart';
import 'package:hume_admin/api/product_api.dart';

import 'dart:io';
import 'dart:developer';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hume_admin/api/image_selection.dart';

class ProductController extends GetxController {
  static ProductController instance = Get.find();

  final _productApi = ProductApi();
  List<ProductModel> shopProducts = [];

  final _databaseApi = DatabaseApi();
  TextEditingController ProductnameController = TextEditingController();
  TextEditingController productpriceController = TextEditingController();
  TextEditingController productdiscriptionController = TextEditingController();
  final _imageSelectorApi = ImageSelectorApi();
  final _storageApi = StorageApi();
  String category = '';
  List<String> selectedSizes = [];
  List<File> productImages = [];
  List<String> productImageNames = [];
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

  int selectedIndex = -1;

  void toggleSize(String size) {
    print(size);

    if (selectedSizes.contains(size)) {
      selectedSizes.remove(size);
    } else {
      selectedSizes.add(size);
    }
    log('fffffffffffffffffffff');
    print(selectedSizes);
    update();
  }

  Future selectImages() async {
    final tempImages = await _imageSelectorApi.selectMultiImage();
    productImages = tempImages;
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
      shopId: '1',
      productName: ProductnameController.text,
      productPrice: double.parse(productpriceController.text),
      productDescription: productdiscriptionController.text,
      category: category,
      selectedSizes: selectedSizes,
      productImageNames: imageUrls,
      productImageUrls: imageUrls,
    );

    try {
      await _productApi.createProduct(product);
    } catch (e) {
      print('Error saving product: $e');
    }
  }

  @override
  void onInit() {
    super.onInit();
    products();
    update();
  }

  products() async {
    String id = Get.parameters['id'].toString();
    shopProducts = await _databaseApi.fetchProducts(id);
    update();
  }
}
