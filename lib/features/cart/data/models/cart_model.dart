class CartModel {
  num productId;
  String title;
  num availableQuantity;
  num price;
  String imageUrl;
  num quantity;
  num selectedQuantity = 1;
  String? category;
  String? description;
  // String size;

  CartModel({
    // required this.size,
    required this.productId,
    required this.title,
    required this.availableQuantity,
    required this.price,
    required this.imageUrl,
    required this.quantity,
    this.description,
    this.selectedQuantity = 1,
    required this.category,
  });
  Map<String, dynamic> toJson() => {
    "productId": productId,
    "title": title,
    "availableQuantity": availableQuantity,
    "price": price,
    "imageUrl": imageUrl,
    "quantity": quantity,
    "productSizeId": category,
    // "size": size,
  };
  CartModel clone() => CartModel(
    productId: productId,
    title: title,
    availableQuantity: availableQuantity,
    price: price,
    imageUrl: imageUrl,
    quantity: quantity,
    category: category,
    // size: size,
  );

  updateQuantity(bool increase) {
    if (increase) {
      selectedQuantity++;
    } else {
      selectedQuantity--;
    }
  }
}
