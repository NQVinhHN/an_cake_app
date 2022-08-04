import 'package:flutter/material.dart';

class LoginScreenProvider extends ChangeNotifier {
  String _name = "";
  String get name => _name;
  void setName(String name) {
    _name = name;
    notifyListeners();
  }

  String _phone = "";
  String get phone => _phone;
  void setPhone(String phone) {
    _phone = phone;
    notifyListeners();
  }
}
