import 'package:flutter/material.dart';

class SelectedCategoryModel extends ChangeNotifier {
  int _selectedCategoryIndex = 0;
  String _categoryName = "All";

  int get selectedCategoryIndex => _selectedCategoryIndex;
  String get category => _categoryName;

  void setCategory(int categoryIndex, String categoryName) {
    _selectedCategoryIndex = categoryIndex;
    _categoryName = categoryName;
    notifyListeners();
  }

}