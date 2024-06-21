import 'package:flutter/material.dart';
import 'package:online_shop/model/product_model.dart';
import 'package:online_shop/view/product_card.dart';
import 'package:online_shop/view/product_order_count.dart';

typedef PreviewImageCallback = Function(String);

class ProductDetailInfo extends StatefulWidget {
  final Product product;
  const ProductDetailInfo({super.key, required this.product});

  @override
  State<ProductDetailInfo> createState() => _ProductDetailInfoState();
}

class _ProductDetailInfoState extends State<ProductDetailInfo> {
  int _selectedSize = 0;
  String? _selectedImage = null;

  void _onSelectImage(String image) {
    print('image: $image');
    setState(() {
      _selectedImage = image;
    });
  }

  @override
  void _onTapAvilableSize(int index) {
    setState(() {
      _selectedSize = index;
    });
  }

  Widget build(BuildContext context) {
    if (_selectedImage == null) _selectedImage = widget.product.image;

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
                  _selectedImage!,
                  fit: BoxFit.cover,
                ),
              ),
              PreviewProductImages(
                images: widget.product.previewImages,
                callback: _onSelectImage,
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
                            style: ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(
                                    (_selectedSize == index)
                                        ? Colors.blue
                                        : Colors.white)),
                            onPressed: () {
                              _onTapAvilableSize(index);
                            },
                            child: Text(widget.product.availableSize[index]));
                      }).toList(),
                    ),
                  ],
                ),
              ),
              ProductOrderCount(callback: (val) {
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

class PreviewProductImages extends StatefulWidget {
  final List<String> images;
  final PreviewImageCallback callback;
  const PreviewProductImages(
      {super.key, required this.images, required this.callback});

  @override
  State<PreviewProductImages> createState() => _PreviewProductImagesState();
}

class _PreviewProductImagesState extends State<PreviewProductImages> {
  String? _selectedImage = null;

  void _onSelectPreviewImage(String image) {
    print(image);
    setState(() {
      _selectedImage = image;
      widget.callback(image);
    });
  }

  @override
  Widget build(BuildContext context) {
    Color previewImageBorderColor = Theme.of(context).colorScheme.secondary;
    if (_selectedImage == null) _selectedImage = widget.images.first;

    List<Widget> previeqImages = widget.images.map((imagePath) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        child: GestureDetector(
          onTap: () {
            _onSelectPreviewImage(imagePath);
          },
          child: Container(
            height: 100,
            width: 100,
            padding: EdgeInsets.all(2),
            decoration: BoxDecoration(
              border: (_selectedImage == imagePath)
                  ? Border.all(width: 2, color: previewImageBorderColor)
                  : null,
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Image.asset(
              imagePath,
              fit: BoxFit.fill,
            ),
          ),
        ),
      );
    }).toList();
    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: previeqImages,
      ),
    );
  }
}
