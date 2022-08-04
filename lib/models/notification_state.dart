import 'dart:math';

import 'package:an_cake_app/models/trending_screen_list_gridviews_product.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../translations/locale_keys.g.dart';

class NotificationItem {
  final Product product;
  final int id;

  NotificationItem({
    required this.product,
  }) : id = Random().nextInt(100);
}

class NotificationState extends ChangeNotifier {
  static String firstItem = LocaleKeys.ns_clear_1_notifications.tr();
  final List<String> choices = <String>[firstItem];
  final notificationList = <NotificationItem>[];

  void addToNotificationList(Product p) {
    notificationList.add(NotificationItem(product: p));
    notifyListeners();
  }

  void choiceAction(String choice) {
    if (choice == NotificationState.firstItem) {
      removeNotificationItem;
      notifyListeners();
    }
  }

  void removeNotificationItem(NotificationItem notificationItem) {
    notificationList
        .removeWhere((element) => element.id == notificationItem.id);
    notifyListeners();
  }

  void deleteAllList() {
    notificationList.clear();
    notifyListeners();
  }
}
