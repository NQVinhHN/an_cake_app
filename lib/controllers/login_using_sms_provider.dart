import 'package:flutter/material.dart';

class LoginUsingSMSProvider extends ChangeNotifier {
  String _phoneNumberCode = "";
  String get phoneNumberCode => _phoneNumberCode;
  void changePhoneNumberCode(String phoneNumberCode) {
    _phoneNumberCode = phoneNumberCode;
    notifyListeners();
  }

  String _phoneNumber = "";
  String get phoneNumber => _phoneNumber;
  void addPhoneNumber(String phoneNumber) {
    _phoneNumber = phoneNumber;
    notifyListeners();
  }
}
