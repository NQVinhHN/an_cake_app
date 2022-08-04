import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../translations/locale_keys.g.dart';

class LowerHalfProvider extends ChangeNotifier {
  Color colorButtonLang1 = Colors.red;
  Color colorButtonLang2 = Colors.grey;

  Color colorButtonCity1 = Colors.red;
  Color colorButtonCity2 = Colors.grey;
  String cityName = LocaleKeys.uds_washington_city.tr();

  void pressButtonLang1() async {
    colorButtonLang1 = Colors.red;
    colorButtonLang2 = Colors.grey;
    notifyListeners();
  }

  void pressButtonLang2() {
    colorButtonLang1 = Colors.grey;
    colorButtonLang2 = Colors.red;
    notifyListeners();
  }

  void pressButtonCity1() {
    colorButtonCity1 = Colors.red;
    colorButtonCity2 = Colors.grey;
    cityName = LocaleKeys.uds_washington_city.tr();
    notifyListeners();
  }

  void pressButtonCity2() {
    colorButtonCity1 = Colors.grey;
    colorButtonCity2 = Colors.red;
    cityName = LocaleKeys.uds_hanoi_city.tr();
    notifyListeners();
  }
}
