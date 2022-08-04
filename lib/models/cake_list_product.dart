import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../translations/locale_keys.g.dart';

class CakeList {
  final String name;
  final String img;
  CakeList({required this.name, required this.img});
}

class CakeListProvider extends ChangeNotifier {
  final List<CakeList> _cakeList = [
    CakeList(
        name: LocaleKeys.cls_cake_list_birthday.tr(),
        img: "assets/birthday_cake_list.jpg"),
    CakeList(
        name: LocaleKeys.cls_cake_list_lunar.tr(),
        img: "assets/lunar_cakes_list.jpg"),
    CakeList(
        name: LocaleKeys.cls_cake_list_special.tr(),
        img: "assets/special_cake.jpg"),
    CakeList(
        name: LocaleKeys.cls_cake_list_eggless.tr(),
        img: "assets/eggless_cake.jpg"),
    CakeList(
        name: LocaleKeys.cls_cake_list_valentine.tr(),
        img: "assets/valentine_cake.jpg"),
  ];
  List<CakeList> get cakeList => _cakeList;
}
