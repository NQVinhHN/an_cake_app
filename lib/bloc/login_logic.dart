import 'dart:async';

import 'package:flutter/material.dart';

import '../event/event.dart';

class LoginLogic extends ChangeNotifier {
  final StreamController _userEmail = StreamController.broadcast();
  final StreamController _userPass = StreamController.broadcast();

  Stream get userEmail => _userEmail.stream;

  Stream get userPass => _userPass.stream;

  bool isValidInfo(String email, pass) {
    if (!RegisterEvent.isValidEmail(email)) {
      _userEmail.sink.addError('Sai địa chỉ Email');
      notifyListeners();
      return false;
    }
    _userEmail.sink.add('ok');
    if (!RegisterEvent.isValidPass(pass)) {
      _userPass.sink.addError('Sai mật khẩu');
      notifyListeners();
      return false;
    }
    _userPass.sink.add('ok');
    return true;
  }

  @override
  void dispose() {
    _userEmail.close();
    _userPass.close();
  }
}
