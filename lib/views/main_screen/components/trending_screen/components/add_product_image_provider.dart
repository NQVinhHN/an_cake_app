import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class AddProductImageProvider extends ChangeNotifier {
  File? imageProduct;

  Future pickImage() async {
    try {
      final imageGallery =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (imageGallery == null) return;
      final imageTemporary = File(imageGallery.path);
      this.imageProduct = imageTemporary;
    } on PlatformException catch (e) {
      debugPrint("Failed to pick Image: $e");
    }
    notifyListeners();
  }

  void resetImageFile() {
    imageProduct = null;
    notifyListeners();
  }
}
