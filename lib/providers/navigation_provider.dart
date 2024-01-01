import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigationProvider with ChangeNotifier {
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  void changeScreen(int value, BuildContext context) {
    _currentIndex = value;
    notifyListeners();
  }
}
