
import 'package:online_shop/model/data_store.dart';
import 'package:online_shop/model/product_model.dart';

abstract class StoreManager{
  
}

class OnlineStoreManager {
  List<Product> _products = [];
  List<String> _categories= [];
  late StoreDB dataStore;


  OnlineShopManager(){
    dataStore = DataStoreModel();
  }

  List<Product> get products => dataStore.getProducts();
  
}