import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class ImageGalleryProvider extends ChangeNotifier {
  File? imageGallery;

  Future pickImage() async {
    try {
      final imageGallery =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (imageGallery == null) return;
      final imageTemporary = File(imageGallery.path);
      this.imageGallery = imageTemporary;
    } on PlatformException catch (e) {
      debugPrint("Failed to pick Image: $e");
    }
    notifyListeners();
  }
}
