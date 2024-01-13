// ignore_for_file: unused_field, depend_on_referenced_packages, avoid_print

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:hume_admin/api/storage_api1.dart';
import 'package:hume_admin/helper/data_model.dart';
import 'package:hume_admin/helper/loading.dart';
import 'package:hume_admin/models/home_banner_model.dart';
import 'package:hume_admin/services/banner_service.dart';
import 'package:hume_admin/utils/controller_initlization.dart';
import 'package:path/path.dart';
import 'package:hume_admin/api/image_selection.dart';

class AddBannerController extends GetxController {
  final _imageSelectorApi = ImageSelectorApi();

  final _storeImageApi = StorageApi();
  final _bannerService = Bannerservice();
  File? bannerImage1;
  File? bannerImage2;
  File? bannerImage3;
  HomeBanner? bannerImages;
  String? bannerImageName1;
  String? bannerImageName2;
  String? bannerImageName3;

  Future selectBannerImages1() async {
    final tempImage = await _imageSelectorApi.selectImage();
    bannerImage1 = tempImage;
    if (bannerImage1 != null) {
      bannerImageName1 = basename(bannerImage1!.path);
    }
    update();
  }

  Future selectBannerImages2() async {
    final tempImage = await _imageSelectorApi.selectImage();
    bannerImage2 = tempImage;
    if (bannerImage2 != null) {
      bannerImageName2 = basename(bannerImage2!.path);
    }
    update();
  }

  Future selectBannerImages3() async {
    final tempImage = await _imageSelectorApi.selectImage();
    bannerImage3 = tempImage;
    if (bannerImage3 != null) {
      bannerImageName3 = basename(bannerImage3!.path);
    }
    update();
  }

  Future storeBanner() async {
    LoadingHelper.show();
    if (bannerImage1 != null && bannerImage2 != null && bannerImage3 != null) {
      var id = DateTime.now().millisecondsSinceEpoch.toString();
      final CloudStorageResult image1 = await _storeImageApi.uploadHomeBanner(
          imageName: bannerImageName1.toString(), imageToUpload: bannerImage1!);
      final CloudStorageResult image2 = await _storeImageApi.uploadHomeBanner(
          imageName: bannerImageName1.toString(), imageToUpload: bannerImage2!);
      final CloudStorageResult image3 = await _storeImageApi.uploadHomeBanner(
          imageName: bannerImageName1.toString(), imageToUpload: bannerImage3!);

      await _bannerService.createBanner(
          banner: HomeBanner(
        id: id,
        imageUrl1: image1.imageUrl.toString(),
        imageUrl2: image2.imageUrl.toString(),
        imageUrl3: image3.imageUrl.toString(),
      ));
      LoadingHelper.dismiss();
      update();
    } else {
      LoadingHelper.dismiss();
      throw ArgumentError('One or more of the banner images are null.');
    }
  }

  void fetchBannerImages() {
    try {
      final collectionRef = FirebaseFirestore.instance.collection('banners');
      collectionRef.limit(1).get().then((snapshot) {
        if (snapshot.docs.isNotEmpty) {
          final document = snapshot.docs.first;
          final data = document.data();
          bannerImages = HomeBanner.fromJson(data);
          print(bannerImages);
          update();
        } else {
          print('No documents found in the collection');
        }
      });
    } catch (e) {
      print('Error fetching banner images: $e');
    }
  }

  Future<void> updateBanner() async {
    try {
      LoadingHelper.show();
      DocumentReference docRef =
          firebaseFirestore.collection('banners').doc(bannerImages!.id);
      Map<String, dynamic> updatedData = {
        'imageUrl1': bannerImages!.imageUrl1,
        'imageUrl2': bannerImages!.imageUrl2,
        'imageUrl3': bannerImages!.imageUrl3,
      };

      if (bannerImage1 != null) {
        final CloudStorageResult image1 = await _storeImageApi.uploadHomeBanner(
            imageName: bannerImageName1.toString(),
            imageToUpload: bannerImage1!);
        print(image1);
        updatedData['imageUrl1'] = image1.imageUrl;
      }

      if (bannerImage2 != null) {
        final CloudStorageResult image2 = await _storeImageApi.uploadHomeBanner(
            imageName: bannerImageName2.toString(),
            imageToUpload: bannerImage2!);
        updatedData['imageUrl2'] = image2.imageUrl;
      }

      if (bannerImage3 != null) {
        final CloudStorageResult image3 = await _storeImageApi.uploadHomeBanner(
            imageName: bannerImageName3.toString(),
            imageToUpload: bannerImage3!);
        updatedData['imageUrl3'] = image3.imageUrl;
      }
      // Update the document with the new data
      await docRef.update(updatedData);

      if (docRef.id.isNotEmpty) {
        Get.back();
      } else {
        print('Failed to store data.');
      }
      LoadingHelper.dismiss();
    } catch (e) {
      LoadingHelper.dismiss();
      print('Error storing data: $e');
    }
  }
}
