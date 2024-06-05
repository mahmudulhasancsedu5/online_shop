import 'package:online_shop/model/product_model.dart';

abstract class StoreDB {
  List<Product> getProducts();
  List<String> getProductCategories();
  List<Product> getProductsOf(String category);
}

class DataStoreModel implements StoreDB {
  String desc =
      "Bring a touch of tradition to your wardrobe with this Premium Panjabi. Made from 100% soft and breathable cotton, it is perfect for any occasion. The Panjabi features gorgeous designs, adding a touch of elegance to the simple yet sophisticated design. The beige color is neutral and versatile, making it easy to style. With a comfortable regular fit, it is both practical and stylish. Available in sizes 38 to 46, youre sure to find the perfect size for you.";
  String a = "";
  late List<Product> items = [];

  List<String> categories = [
    'All',
    'Shirt',
    'Pant',
    'Panjabi',
    'Polo Shirt',
    'Accessories',
    'Summer Collection',
    'Blazer',
    'Shoes',
    'Trousers',
  ];

  DataStoreModel() {
    var sampleProduct = Product(
      productCode: 'code-panjabi-01',
      name: 'Brown Color Panjabi Classic Fit',
      image: 'assets/images/panjabi/panjabi_brown.jpeg',
      category: 'Panjabi',
      description: desc,
      aditionalInformation: desc,
      price: 2000.0,
      discountPercent: 40.0,
      rating: 4.0,
      isInSale: true,
      availableSize: ['38', '40', '42', '44', '46'],
    );

    var shirt = Product(
      productCode: 'code-shirt-01',
      name: 'Casual Shirt Check Light Sky',
      image: 'assets/images/shirt/shirt_check.jpeg',
      category: 'Shirt',
      description: desc,
      aditionalInformation: desc,
      price: 1700.0,
      discountPercent: 40.0,
      rating: 4.0,
      isInSale: true,
      availableSize: ['38', '40', '42', '44', '46'],
    );

    var pant = Product(
      productCode: 'code-pant-01',
      name: 'Twill Chinos Black Slim Fit',
      image: 'assets/images/pant/pant_black.jpeg',
      category: 'Pant',
      description: desc,
      aditionalInformation: desc,
      price: 1500.0,
      discountPercent: 40.0,
      rating: 4.0,
      isInSale: true,
      availableSize: ['38', '40', '42', '44', '46'],
    );

    List<Product> panjabies = List.filled(20, sampleProduct);
    List<Product> shirts = List.filled(20, shirt);
    List<Product> pants = List.filled(20, pant);

    items.addAll(panjabies);
    items.addAll(shirts);
    items.addAll(pants);
    items.shuffle();
  }



  @override
  List<Product> getProducts() {
    return items;
  }

  @override
  List<String> getProductCategories() {
    return categories;
  }
  
  @override
  List<Product> getProductsOf(String category) {
    List<Product> newItemList = [];
    int numOfItem = items.length;
    for(int i = 0; i < numOfItem; i++) {
      if(items[i].category == category) {
        newItemList.add(items[i]);
      }
    }

    return newItemList;
  }
}
