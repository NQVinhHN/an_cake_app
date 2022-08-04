import 'package:flutter/material.dart';

class CakeGridView {
  final String name;
  final ImageProvider img;
  CakeGridView({required this.name, required this.img});
}

class CakeListGridView extends ChangeNotifier {
  final cakeListGridView = <CakeGridView>[
    CakeGridView(
      name: "Black Forest",
      img: AssetImage("assets/black_forest_cake.jpg"),
    ),
    CakeGridView(
      name: "Chocolate Peanut",
      img: AssetImage("assets/chocolate_peanut.jpg"),
    ),
    CakeGridView(
      name: "Fullerton Heritage",
      img: AssetImage("assets/fullerton_heritage.jpg"),
    ),
    CakeGridView(
      name: "Luxurious Vegan Chocolate",
      img: AssetImage("assets/luxurious_vegan_chocolate.jpg"),
    ),
    CakeGridView(
      name: "Opera",
      img: AssetImage("assets/opera_cake.jpg"),
    ),
    CakeGridView(
      name: "Momofuku Milk",
      img: AssetImage("assets/momofuku_milk_bar.jpg"),
    ),
  ];
  String _addName = "";
  String get addName => _addName;
  void setName(String addName) {
    _addName = addName;
    notifyListeners();
  }

  void addToGallery(name, img) {
    cakeListGridView.add(CakeGridView(img: img, name: name));
    notifyListeners();
  }
}
