import 'package:flutter/material.dart';

import 'cake_list_gridviews.dart';

class NotificationList {
  final String img;
  final String notiquotes;
  final Icon icon;

  NotificationList(
      {required this.img, required this.notiquotes, required this.icon});
}

final List<NotificationList> notiList = [
  NotificationList(
    notiquotes:
        'You have purchase this cake. We will send the receipt and the cake in no time. Thank you for choosing us.',
    icon: const Icon(Icons.more_horiz_outlined),
    img: cakeListGridView[0].img,
  ),
  NotificationList(
    notiquotes:
        'You have purchase this cake. We will send the receipt and the cake in no time. Thank you for choosing us.',
    icon: const Icon(Icons.more_horiz_outlined),
    img: cakeListGridView[1].img,
  ),
  NotificationList(
    notiquotes:
        'You have purchase this cake. We will send the receipt and the cake in no time. Thank you for choosing us.',
    icon: const Icon(Icons.more_horiz_outlined),
    img: cakeListGridView[2].img,
  ),
  NotificationList(
    notiquotes:
        'You have purchase this cake. We will send the receipt and the cake in no time. Thank you for choosing us.',
    icon: const Icon(Icons.more_horiz_outlined),
    img: cakeListGridView[3].img,
  ),
  NotificationList(
      notiquotes:
          'You have purchase this cake. We will send the receipt and the cake in no time. Thank you for choosing us.',
      icon: const Icon(Icons.more_horiz_outlined),
      img: cakeListGridView[4].img),
  NotificationList(
      notiquotes:
          'You have purchase this cake. We will send the receipt and the cake in no time. Thank you for choosing us.',
      icon: const Icon(Icons.more_horiz_outlined),
      img: cakeListGridView[5].img),
  NotificationList(
      notiquotes:
          'You have purchase this cake. We will send the receipt and the cake in no time. Thank you for choosing us.',
      icon: const Icon(Icons.more_horiz_outlined),
      img: cakeListGridView[5].img),
  NotificationList(
      notiquotes:
          'You have purchase this cake. We will send the receipt and the cake in no time. Thank you for choosing us.',
      icon: const Icon(Icons.more_horiz_outlined),
      img: cakeListGridView[5].img),
];
