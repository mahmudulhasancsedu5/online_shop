class Product {
  final String productCode;
  final String name;
  final String image;
  final String category;
  final String description;
  final String aditionalInformation;
  final double price;
  final double discountPercent;
  final double rating;
  final bool isInSale;
  final List<String> availableSize;

  const Product({
    required this.productCode,
    required this.name,
    required this.image,
    required this.category,
    required this.description,
    required this.aditionalInformation,
    required this.price,
    required this.discountPercent,
    required this.rating,
    required this.isInSale,
    required this.availableSize,
  });
}
