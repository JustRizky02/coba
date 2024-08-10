import 'package:flutter/material.dart';

class UserFirstPageProvider extends ChangeNotifier {
  String _name = '';

  String get name => _name;

  void setName(String name) {
    _name = name;
    notifyListeners();
  }
}
