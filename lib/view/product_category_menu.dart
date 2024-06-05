import 'package:flutter/material.dart';
import 'package:online_shop/model/data_store.dart';

typedef ProductCategorySelectCallback = Function(int);
typedef ProductCategoryMenuSelectCallback = Function(int, String);

class ProductCategoryDrawer extends StatefulWidget {
  late List<String> categories;
  final int selectedCategory;
  final ProductCategoryMenuSelectCallback onMenuSelect;
  ProductCategoryDrawer({super.key, required this.selectedCategory, required this.onMenuSelect}) {
    categories = DataStoreModel().getProductCategories();
  }

  @override
  State<ProductCategoryDrawer> createState() => _ProductCategoryDrawerState();
}

class _ProductCategoryDrawerState extends State<ProductCategoryDrawer> {
  int _selectedItem = -1;

  void _onItemSelect(int index){
    setState(() {
      _selectedItem = index;
      widget.onMenuSelect(_selectedItem, widget.categories[index]);
    });
  }
  @override
  Widget build(BuildContext context) {
    if(_selectedItem == -1) _selectedItem = widget.selectedCategory;

    return Drawer(
      child: ListView(
        children: _getCategoryWidgets(),
      ),
    );
  }

  List<Widget> _getCategoryWidgets() {
    Widget drawerHeader = const DrawerHeader(child: Text('Category'));
    List<Widget> categoryList = [drawerHeader];
    categoryList.addAll(widget.categories.asMap().keys.map((index) {
      return _ProductCategoryWidget(
        categoryName: widget.categories[index],
        isSelected: _selectedItem == index,
        index: index,
        onTapItem: _onItemSelect,
      );
    }));

    return categoryList;
  }
}

class _ProductCategoryWidget extends StatelessWidget {
  _ProductCategoryWidget({
    super.key,
    required this.categoryName,
    required this.isSelected,
    required this.index,
    required this.onTapItem,
  });
  final String categoryName;
  final int index;
  final bool isSelected;
  ProductCategorySelectCallback onTapItem;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(categoryName),
      selected: isSelected,
      onTap: () {
        onTapItem(index);
        Navigator.pop(context);
      },
    );
  }
}
