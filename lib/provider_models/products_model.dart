import 'package:flutter/material.dart';
import 'package:online_shop/model/data_store.dart';
import 'package:online_shop/model/product_model.dart';

class ProductsChangeModel extends ChangeNotifier {
  List<Product> _items = [];
  List<Product> get items => _items;

  ProductsChangeModel(List<Product> products){
    _items = products;
  }

  void reloadProducts(List<Product> products) {
    _items = products;
    notifyListeners();
  }
}