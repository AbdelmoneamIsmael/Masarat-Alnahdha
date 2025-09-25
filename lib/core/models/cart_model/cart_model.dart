class CartModel {
  num productId;
  String title;
  num availableQuantity;
  num price;
  String imageUrl;
  num quantity;
  num productSizeId;
  String size;

  CartModel({
    required this.size,
    required this.productId,
    required this.title,
    required this.availableQuantity,
    required this.price,
    required this.imageUrl,
    required this.quantity,
    required this.productSizeId,
  });
  Map<String, dynamic> toJson() => {
        "productId": productId,
        "title": title,
        "availableQuantity": availableQuantity,
        "price": price,
        "imageUrl": imageUrl,
        "quantity": quantity,
        "productSizeId": productSizeId,
        "size": size,
      };
  CartModel clone() => CartModel(
        productId: productId,
        title: title,
        availableQuantity: availableQuantity,
        price: price,
        imageUrl: imageUrl,
        quantity: quantity,
        productSizeId: productSizeId,
        size: size,
      );
}
