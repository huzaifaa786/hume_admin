import 'dart:io';

import 'package:hume_admin/utils/ui_utils.dart';
import 'package:image_picker/image_picker.dart';

class ImageSelectorApi {
  final picker = ImagePicker();

  selectImage() async {
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      return File(pickedFile.path);
    } else {
      UiUtilites.errorSnackbar('Image selection failed',
          'Failed to select image, please try again.');
      // throw ImageSelectorApiException(
      //   title: 'Image selection failed',
      //   message: 'Failed to select image, please try again.',
      // );
    }
  }

 
 selectMultiImage() async {
  final pickedFiles = await picker.pickMultiImage();

  if (pickedFiles.isNotEmpty) {
    List<File> images = [];
    for (var element in pickedFiles) {
      images.add(File(element.path));
    }
    return images;
  } else {
    UiUtilites.errorSnackbar(
        'Image selection failed', 'Failed to select image, please try again.');
    // throw ImageSelectorApiException(
    //   title: 'Image selection failed',
    //   message: 'Failed to select image, please try again.',
    // );
  }
}
}
