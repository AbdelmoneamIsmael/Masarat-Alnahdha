class ProductModel {
  final int productId;
  final String name;
  final num availableQuantity;
  final num price;
  final String? description;
  final String imageUrl;
  final String? size;
  final String? discount;
  final num? priceAfterDiscount;

  const ProductModel( {
    this.discount,
    this.priceAfterDiscount,
    this.size,
    this.description,
    required this.productId,
    required this.availableQuantity,
    required this.price,
    required this.imageUrl,
    required this.name,
  });
}
