import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  String _firstName = '';
  String _lastName = '';

  String get fullName {
    if (_firstName.isEmpty && _lastName.isEmpty) {
      return 'Selected User Name';
    } else {
      return '$_firstName $_lastName';
    }
  }

  void setUserName(String firstName, String lastName) {
    _firstName = firstName;
    _lastName = lastName;
    notifyListeners();
  }
}
