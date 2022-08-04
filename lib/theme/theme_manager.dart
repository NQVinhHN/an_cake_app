import 'package:flutter/material.dart';

class ThemeManager extends ChangeNotifier {
  bool themeDark = false;

  void changeSwitch() {
    themeDark = !themeDark;
    notifyListeners();
  }
}
