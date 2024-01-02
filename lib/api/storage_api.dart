import 'dart:developer';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart' as storage;
import 'package:flutter/services.dart';
import 'package:hume_admin/exceptions/storage_api_exceptions.dart';
import 'package:hume_admin/helper/data_model.dart';

class StorageApi {
  Future<CloudStorageResult> uploadBannerImage({
    required String shopId,
    required File imageToUpload,
  }) async {
    final imageFileName = "SBI._$shopId";

    final storage.Reference storageReference = storage.FirebaseStorage.instance
        .ref()
        .child("shops/bannerImages/$shopId/$imageFileName");

    try {
      final storage.UploadTask uploadTask =
          storageReference.putFile(imageToUpload);

      final storage.TaskSnapshot storageTaskSnapshot =
          await Future.value(uploadTask);

      final downloadUrl = await storageTaskSnapshot.ref.getDownloadURL();

      if (uploadTask.storage.bucket.isNotEmpty) {
        final url = downloadUrl.toString();
        return CloudStorageResult(
          imageUrl: url,
          imageFileName: imageFileName,
        );
      } else {
        throw StorageApiException(
          title: 'Server Error',
          message: 'An error occured while uploading the image.',
        );
      }
    } on PlatformException catch (e) {
      throw StorageApiException(
        title: 'Failed to upload image',
        message: e.message,
      );
    }
  }

  Future<CloudStorageResult> uploadLogoImage({
    required String shopId,
    required File imageToUpload,
  }) async {
    final imageFileName = "SLI._$shopId";

    final storage.Reference storageReference = storage.FirebaseStorage.instance
        .ref()
        .child("shops/logoImages/$shopId/$imageFileName");

    try {
      final storage.UploadTask uploadTask =
          storageReference.putFile(imageToUpload);

      final storage.TaskSnapshot storageTaskSnapshot =
          await Future.value(uploadTask);

      final downloadUrl = await storageTaskSnapshot.ref.getDownloadURL();

      if (uploadTask.storage.bucket.isNotEmpty) {
        final url = downloadUrl.toString();
        return CloudStorageResult(
          imageUrl: url,
          imageFileName: imageFileName,
        );
      } else {
        throw StorageApiException(
          title: 'Server Error',
          message: 'An error occured while uploading the image.',
        );
      }
    } on PlatformException catch (e) {
      throw StorageApiException(
        title: 'Failed to upload image',
        message: e.message,
      );
    }
  }

Future<CloudStorageResult> uploadHomeBanner({
    required String imageName,
    required File imageToUpload,
  }) async {
    final imageFileName = "HBI._$imageName";

    final storage.Reference storageReference = storage.FirebaseStorage.instance
        .ref()
        .child("home/banner/$imageName/$imageFileName");

    try {
      final storage.UploadTask uploadTask =
          storageReference.putFile(imageToUpload);

      final storage.TaskSnapshot storageTaskSnapshot =
          await Future.value(uploadTask);

      final downloadUrl = await storageTaskSnapshot.ref.getDownloadURL();

      if (uploadTask.storage.bucket.isNotEmpty) {
        final url = downloadUrl.toString();
        return CloudStorageResult(
          imageUrl: url,
          
          imageFileName: imageFileName,
        );
      } else {
        throw StorageApiException(
          title: 'Server Error',
          message: 'An error occured while uploading the image.',
        );
      }
    } on PlatformException catch (e) {
      throw StorageApiException(
        title: 'Failed to upload image',
        message: e.message,
      );
    }
  }



}
