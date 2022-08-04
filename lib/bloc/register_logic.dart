import 'dart:async';

import '../event/event.dart';

class RegisterLogic {
  final StreamController _userName = StreamController();
  final StreamController _userPhone = StreamController();
  final StreamController _userEmail = StreamController();
  final StreamController _userPass = StreamController();

  Stream get userName => _userName.stream;
  Stream get userPhone => _userPhone.stream;
  Stream get userEmail => _userEmail.stream;
  Stream get userPass => _userPass.stream;

  bool isValidInfo(String name, phone, email, pass) {
    if (!RegisterEvent.isValidName(name)) {
      _userName.sink.addError('Tên không hợp lệ');
      return false;
    }
    _userName.sink.add('ok');
    if (!RegisterEvent.isValidPhone(phone)) {
      _userPhone.sink.addError('Số điện thoại không hợp lệ');
      return false;
    }
    _userPhone.sink.add('ok');
    if (!RegisterEvent.isValidEmail(email)) {
      _userEmail.sink.addError('Email không hợp lệ');
      return false;
    }
    _userEmail.sink.add('ok');
    if (!RegisterEvent.isValidPass(pass)) {
      _userPass.sink.addError('Mật khẩu phải lớn hơn 5 ký tự');
      return false;
    }
    _userPass.sink.add('ok');
    return true;
  }

  void dispose() {
    _userName.close();
    _userPhone.close();
    _userEmail.close();
    _userPass.close();
  }
}
