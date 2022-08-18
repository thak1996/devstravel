import 'package:flutter/material.dart';

class AppData with ChangeNotifier {
  var data = [];

  void setData(newData) {
    data = newData;
    notifyListeners();
  }
}
