import 'package:flutter/material.dart';
import 'package:online_shop/model/product_model.dart';
import 'package:online_shop/view/product_card.dart';
import 'package:online_shop/view/product_order_count.dart';

class ProductDetailInfo extends StatefulWidget {
  final Product product;
  const ProductDetailInfo({super.key, required this.product});

  @override
  State<ProductDetailInfo> createState() => _ProductDetailInfoState();
}

class _ProductDetailInfoState extends State<ProductDetailInfo> {
  int _selectedSize = 0;
  @override
  void _onTapAvilableSize(int index) {
    setState(() {
      _selectedSize = index;
    });
  }

  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text('OnlineShop'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                clipBehavior: Clip.antiAlias,
                child: Image.asset(
                  widget.product.image,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${widget.product.name}',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.w400),
                    ),
                    Text(
                      '${widget.product.price}',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                    ),
                    Text('${widget.product.productCode}')
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Select Size',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: widget.product.availableSize
                          .asMap()
                          .keys
                          .toList()
                          .map((index) {
                        return OutlinedButton(
                            style: ButtonStyle(backgroundColor: MaterialStatePropertyAll((_selectedSize == index)?Colors.blue:Colors.white)),
                            onPressed: () {
                              _onTapAvilableSize(index);
                            },
                            child: Text(widget.product.availableSize[index]));
                      }).toList(),
                    ),
                  ],
                ),
              ),
              ProductOrderCount(callback: (val){
                print('Number of order: $val');
              }),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Descreption',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                    ),
                    Text(
                      widget.product.description,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
