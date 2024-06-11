import 'package:flutter/material.dart';
import 'package:online_shop/model/data_store.dart';
import 'package:online_shop/provider_models/category_model.dart';
import 'package:online_shop/provider_models/products_model.dart';
import 'package:provider/provider.dart';



class ProductCategoryDrawer extends StatelessWidget {
  late List<String> categories;
  ProductCategoryDrawer({super.key}) {
    categories = DataStoreModel().getProductCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: _getCategoryWidgets(context),
      ),
    );
  }

  List<Widget> _getCategoryWidgets(BuildContext context) {
    Widget drawerHeader = const DrawerHeader(child: Text('Category'));
    List<Widget> categoryList = [drawerHeader];
    categoryList.addAll(categories.asMap().keys.map((index) {
      return _ProductCategoryWidget(
        categoryName: categories[index],
        index: index,
      );
    }));

    return categoryList;
  }
}


class _ProductCategoryWidget extends StatelessWidget {
  _ProductCategoryWidget({
    super.key,
    required this.categoryName,
    required this.index,
  });
  final String categoryName;
  final int index;

  @override
  Widget build(BuildContext context) {
    var selectModel = context.read<SelectedCategoryModel>();
    var productsModel = context.read<ProductsChangeModel>();
    return ListTile(
      title: Text(categoryName),
      selected: selectModel.selectedCategoryIndex == index,
      onTap: () {
        selectModel.setCategory(index, categoryName);
        productsModel.reloadProducts(DataStoreModel().getProductsOf(categoryName));
        Navigator.pop(context);
      },
    );
  }
}
