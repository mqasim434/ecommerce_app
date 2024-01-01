import 'package:flutter/foundation.dart';

class SizeProvider with ChangeNotifier{
  String _selectedSize = "S";

  String get selectedSize => _selectedSize;

  void changeSize(String value){
    _selectedSize = value;
    notifyListeners();
  }
}