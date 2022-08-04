import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../translations/locale_keys.g.dart';

class Product {
  final int id;
  final String name;
  final ImageProvider img;
  final double price;
  final double rating;
  final int shippingStatus;
  final String discountType;
  bool favTap = false;
  Product(
      {required this.name,
      required this.img,
      required this.price,
      required this.rating,
      required this.shippingStatus,
      required this.discountType})
      : id = Random().nextInt(100);
}

class ProductList extends ChangeNotifier {
  final List<Product> _productList = [
    Product(
        name: "Black Forest",
        img: AssetImage("assets/black_forest_cake.jpg"),
        price: 11,
        rating: 4.8,
        shippingStatus: 1,
        discountType: LocaleKeys.ts_free_delivery.tr()),
    Product(
        name: "Chocolate Peanut",
        img: AssetImage("assets/chocolate_peanut.jpg"),
        price: 30,
        rating: 4.9,
        shippingStatus: 4,
        discountType: LocaleKeys.ts_discount.tr()),
    Product(
        name: "Fullerton Heritage",
        img: AssetImage("assets/fullerton_heritage.jpg"),
        price: 15,
        rating: 4.8,
        shippingStatus: 2,
        discountType: LocaleKeys.ts_return_coins.tr()),
    Product(
        name: "Luxurious Vegan Chocolate",
        img: AssetImage("assets/luxurious_vegan_chocolate.jpg"),
        price: 23,
        rating: 4.7,
        shippingStatus: 3,
        discountType: LocaleKeys.ts_free_delivery.tr()),
    Product(
        name: "Opera",
        img: AssetImage("assets/opera_cake.jpg"),
        price: 50,
        rating: 4.6,
        shippingStatus: 3,
        discountType: LocaleKeys.ts_buy1_get1.tr()),
    Product(
        name: "Momofuku Milk",
        img: AssetImage("assets/momofuku_milk_bar.jpg"),
        price: 25,
        rating: 4.9,
        shippingStatus: 3,
        discountType: LocaleKeys.ts_free_delivery.tr()),
  ];
  String _addNameProduct = "";
  String get addNameProduct => _addNameProduct;
  void setNameProduct(String addNameProduct) {
    _addNameProduct = addNameProduct;
    notifyListeners();
  }

  String _addPriceProduct = "";
  String get addPriceProduct => _addPriceProduct;
  void setPriceProduct(String addPriceProduct) {
    _addPriceProduct = addPriceProduct;
    notifyListeners();
  }

  String _addRatingProduct = "";
  String get addRatingProduct => _addRatingProduct;
  void setRatingProduct(String addRatingProduct) {
    _addRatingProduct = addRatingProduct;
    notifyListeners();
  }

  String _addShippingProduct = "";
  String get addShippingProduct => _addShippingProduct;
  void setShippingProduct(String addShippingProduct) {
    _addShippingProduct = addShippingProduct;
    notifyListeners();
  }

  String _addDiscountProduct = "";
  String get addDiscountProduct => _addDiscountProduct;
  void setDiscountProduct(String addDiscountProduct) {
    _addDiscountProduct = addDiscountProduct;
    notifyListeners();
  }

  void addToProduct({name, img, rating, shipping, price, discountType}) {
    productList.add(
      Product(
        name: name,
        img: img,
        rating: rating,
        shippingStatus: shipping,
        price: price,
        discountType: discountType,
      ),
    );
    notifyListeners();
  }

  static String firstItem = LocaleKeys.ts_discount.tr();
  static String secondItem = LocaleKeys.ts_return_coins.tr();
  static String thirdItem = LocaleKeys.ts_buy1_get1.tr();
  static String fourthItem = LocaleKeys.ts_free_delivery.tr();
  final List<String> choices = <String>[
    firstItem,
    secondItem,
    thirdItem,
    fourthItem,
  ];
  void choiceAction(String choice) {
    if (choice == ProductList.firstItem) {
      setDiscountProduct(firstItem);
    } else if (choice == ProductList.secondItem) {
      setDiscountProduct(secondItem);
    } else if (choice == ProductList.thirdItem) {
      setDiscountProduct(thirdItem);
    } else {
      setDiscountProduct(fourthItem);
    }
    notifyListeners();
  }

  List<Product> get productList => _productList;
  void resetAllInput() {
    setNameProduct('');
    setShippingProduct('');
    setPriceProduct('');
    setRatingProduct('');
    setDiscountProduct('');
    notifyListeners();
  }
}
