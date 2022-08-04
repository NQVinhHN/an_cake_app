import 'package:flutter/material.dart';

import '../../../models/trending_screen_list_gridviews_product.dart';
import 'cart_item.dart';

class CartState extends ChangeNotifier {
  final cartList = <CartItem>[];
  double get totalPrice {
    double total = 0;
    for (CartItem cartItem in cartList) {
      total += cartItem.subTotal;
      cartList.fold(0, (previousValue, element) => null);
    }
    return total;
  }

  void addToCart(Product p, [int number = 1]) {
    var productExisted = false;
    for (CartItem cartItem in cartList) {
      if (cartItem.product.id == p.id) {
        cartItem.quantity += number;
        productExisted = true;
        break;
      }
    }
    if (!productExisted) {
      cartList.add(CartItem(product: p));
    }
    notifyListeners();
  }

  void changeProductNumber(int cartId, int productNumber) {
    for (CartItem cartItem in cartList) {
      if (cartItem.id == cartId) {
        cartItem.quantity += productNumber;
        break;
      }
    }
    notifyListeners();
  }

  void removeCartItem(CartItem cartItem) {
    cartList.removeWhere((element) => element.id == cartItem.id);
    notifyListeners();
  }
}
