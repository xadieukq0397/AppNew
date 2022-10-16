final String tableCart = 'carts';

class CartField {
  static final List<String> values = [
    id,
    productId,
    orderId,
    quantity,
  ];
  static final String id = 'id';
  static final String productId = 'productId';
  static final String orderId = 'orderId';
  static final String quantity = 'quantity';
}

class Cart {
  final String? id;
  final String? productId;
  final String? orderId;
  int? quantity;

  Cart({
    required this.id,
    required this.productId,
    required this.orderId,
    required this.quantity,
  });

  static Cart fromJson(Map<String, dynamic> json) => Cart(
      id: json['id'],
      productId: json['productId'],
      orderId: json['orderId'],
      quantity: json['quantity']);
  Map<String, dynamic> toJson() => {
        'id': id,
        'productId': productId,
        'orderId': orderId,
        'quantity': quantity,
      };
}
