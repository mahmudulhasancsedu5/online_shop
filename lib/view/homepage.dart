import 'package:auto_height_grid_view/auto_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:online_shop/model/data_store.dart';
import 'package:online_shop/model/product_model.dart';
import 'package:online_shop/provider_models/category_model.dart';
import 'package:online_shop/provider_models/products_model.dart';
import 'package:online_shop/view/product_card.dart';
import 'package:online_shop/view/product_category_menu.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  late StoreDB storeDB;

  HomePage({super.key}) {
    storeDB = DataStoreModel();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => SelectedCategoryModel()),
          ChangeNotifierProvider(
              create: (context) => ProductsChangeModel(storeDB.getProducts()))
        ],
        child: Scaffold(
          appBar: AppBar(
            title: Text('OnlineShop'),
            leading: Builder(builder: (context) {
              return IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: Icon(Icons.menu),
              );
            }),
          ),
          body: _getProductsGridView(context),
          drawer: ProductCategoryDrawer(),
          bottomNavigationBar: BottomNavigationBar(
            onTap: (index) {
              print('Index: $index');
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart),
                label: 'Cart',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_box),
                label: 'Account',
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _getProductsGridView(BuildContext context) {
    return Consumer<ProductsChangeModel>(
        builder: (context, productsModel, child) {
      return AutoHeightGridView(
          itemCount: productsModel.items.length,
          builder: (context, index) {
            return ProductCard(
                product: productsModel.items[index], index: index);
          });
    });
  }
}
