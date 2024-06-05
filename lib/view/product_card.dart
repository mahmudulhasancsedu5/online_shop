import 'package:flutter/material.dart';
import 'package:online_shop/model/product_model.dart';
import 'package:online_shop/view/product_detail.dart';

class ProductCard extends StatefulWidget {
  final Product product;
  final int index;
  const ProductCard({super.key, required this.product, required this.index});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            child: GestureDetector(
              onTap: () {
                // to product detail page
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            ProductDetailInfo(product: widget.product)));
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Card(
                    clipBehavior: Clip.antiAlias,
                    child: Image.asset(
                      height: 300,
                      widget.product.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      widget.product.name,
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '${widget.product.price}',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(width: 2),
                  borderRadius: BorderRadius.circular(5)),
              height: 50,
              width: double.maxFinite,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(onPressed: null, child: Text('Buy')),
                  ElevatedButton(onPressed: null, child: Text('Add'))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
