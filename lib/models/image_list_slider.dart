import 'package:flutter/material.dart';

class ImageListSlider extends ChangeNotifier {
  final List<String> _imgList = [
    'assets/fresh_cakes.jpg',
    'assets/birthday_cake.jpg',
    'assets/lunar_cakes.jpg',
  ];
  List<String> get imgList => _imgList;
}
