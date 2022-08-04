import 'dart:math';

import 'package:get/get.dart';

import '../../../models/trending_screen_list_gridviews_product.dart';

class CartItem {
  final int id;
  final Product product;
  var quantity = 1.obs;

  double get subTotal => product.price * quantity.value;

  CartItem({required this.product}) : id = Random().nextInt(100);
}
