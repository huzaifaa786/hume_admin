// ignore_for_file: non_constant_identifier_names, avoid_print

import 'package:hume_admin/api/database_api.dart';
import 'package:hume_admin/api/order_api.dart';
import 'package:hume_admin/api/stroage_api.dart';
import 'package:hume_admin/helper/data_model.dart';
import 'package:hume_admin/helper/loading.dart';
import 'package:hume_admin/models/product_model.dart';
import 'package:hume_admin/api/product_api.dart';
import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hume_admin/api/image_selection.dart';
import 'package:hume_admin/models/shops.dart';
import 'package:hume_admin/models/combine_order.dart';
import 'package:hume_admin/utils/ui_utils.dart';

class ProductController extends GetxController {
  static ProductController instance = Get.find();

  final _productApi = ProductApi();
  List<ProductModel> shopProducts = [];
  String? id;
  final _databaseApi = DatabaseApi();
  TextEditingController ProductnameController = TextEditingController();
  TextEditingController productpriceController = TextEditingController();
  TextEditingController productdiscriptionController = TextEditingController();
  final _imageSelectorApi = ImageSelectorApi();
  final _storageApi = StorageApii();
  String category = '';
  List<String> selectedSizes = [];
  List<String> shoseselectedSizes = [];
  List<File> productImages = [];
  List<String> productImageNames = [];
  List<Shop> shops = [];
  Shop? shop;
  final OrderApi orderApi = OrderApi();
  Shop? selectedShop;
  RxBool areFieldsFilled = false.obs;
  String? shopname;
  List<String> categories = [
    'Clothes',
    'Craft Tools',
    'Bags and Shoes',
    'MakeUp',
    'Home & Kitchen',
    'Skin & Hair Products',
    'Perfumes',
    'Accessories',
  ];
  @override
  void onInit() {
    shoseselectedSizes = [];
    update();
    print(shoseselectedSizes);
    id = Get.parameters['id'];
    shopname = Get.parameters['shopname'];

    products();
    fetchOrders();
    getAllshops();
    print('object**********');
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

  void toggleSize(String size) {
    if (selectedSizes.contains(size)) {
      selectedSizes.remove(size);
    } else {
      selectedSizes.add(size);
    }
    update();
  }

  void toggleshoseSize(String size) {
    if (shoseselectedSizes.contains(size)) {
      shoseselectedSizes.remove(size);
    } else {
      shoseselectedSizes.add(size);
    }
    print(shoseselectedSizes);
    update();
  }

  Future selectImages() async {
    final tempImages = await _imageSelectorApi.selectMultiImage();
    productImages = tempImages;

    checkFields();
    update();
  }

  Future<void> getAllshops() async {
    LoadingHelper.show();
    shops = await _databaseApi.getAllShops();
    print(shops);
    checkFields();
    LoadingHelper.dismiss();
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
    LoadingHelper.show();
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
      shoseselectedSizes: shoseselectedSizes,
      productImageNames: imageUrls,
      productImageUrls: imageUrls,
    );
    try {
      await _productApi.createProduct(product);
      clearFields();
    } catch (e) {
      print('Error saving product: $e');
      LoadingHelper.dismiss();
      return;
    }
    LoadingHelper.dismiss();
    Get.back();
    UiUtilites.successSnackbar('Product Add Successfully !'.tr, 'Success!'.tr);
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
    selectedSizes = [];
    shoseselectedSizes = [];
    productImages.clear();
    productImageNames.clear();
    selectedIndex = -1;
    selectedShop = null;
    category = '';
    areFieldsFilled.value = false;
    update();
  }

  products() async {
    if (Get.parameters['id'] != null) {
      shopProducts = await _databaseApi.fetchProducts(id);
      print(shopProducts);
      update();
    } else {
      shopProducts = await _databaseApi.fetchProducts(id);
      print(shopProducts);
      update();
    }
  }

  List<OrderCombinedModel> orders = [];

  fetchOrders() async {
    if (Get.parameters['id'] != null) {
      List<OrderCombinedModel>? newItems =
          await orderApi.fetchOrderbyTrainer(Get.parameters['id']!);

      orders.addAll(newItems!);
      print(orders);

      update();
    } else {
      List<OrderCombinedModel>? newItems =
          await orderApi.fetchOrderbyTrainer(id!);

      orders.addAll(newItems!);
      print(orders);
      update();
    }
  }
}
