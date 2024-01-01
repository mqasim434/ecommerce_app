import 'package:flutter/foundation.dart';

class CategoryProvider with ChangeNotifier {
  String _selectedCategory = 'ALL';

  String get selectedCategory => _selectedCategory;

  void onCategoryPressed(String category) {
    _selectedCategory = category;
    notifyListeners();
  }
}
