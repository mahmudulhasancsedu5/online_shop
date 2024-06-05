import 'package:auto_height_grid_view/auto_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:online_shop/model/data_store.dart';
import 'package:online_shop/model/product_model.dart';
import 'package:online_shop/view/product_card.dart';
import 'package:online_shop/view/product_category_menu.dart';

class HomePage extends StatefulWidget {
  late List<Product> items;
  late StoreDB storeDB;

  HomePage({super.key}) {
    storeDB = DataStoreModel();
    items = storeDB.getProducts();
  }

  @override
  State<HomePage> createState() => _HomePageState();

  
}

class _HomePageState extends State<HomePage> {
  int _selectedCategoryIndex = 0;
  String _selectedCategory = 'All';

  void _onSelectMenu(int index, String category){
    setState(() {
      _selectedCategoryIndex = index;
      _selectedCategory = category;
      if( _selectedCategory== 'All') widget.items = widget.storeDB.getProducts();
      else widget.items = widget.storeDB.getProductsOf(_selectedCategory);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
        drawer: ProductCategoryDrawer(selectedCategory: _selectedCategoryIndex, onMenuSelect: _onSelectMenu,),
      ),
    );
  }

  Widget _getProductsGridView(BuildContext context) {
    // return GridView.builder(
    //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    //       crossAxisCount: 2,
    //       mainAxisSpacing: 8.0,
    //       crossAxisSpacing: 8.0,
    //       // mainAxisExtent: 400,
    //     ),
    //     padding: const EdgeInsets.all(8.0),
    //     itemCount: items.length,
    //     itemBuilder: (context, index) {
    //       return ProductCard(
    //         product: items[index],
    //         index: index,
    //       );
    //     });

    return AutoHeightGridView(
        itemCount: widget.items.length,
        builder: (context, index) {
          return ProductCard(product: widget.items[index], index: index);
        });
  }
}
