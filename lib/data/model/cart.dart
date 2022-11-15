final String tableCart = 'carts';

class CartField {
  static final List<String> values = [
    id,
    productId,
    orderId,
    productName,
    productImage,
    unitPrice,
    quantity,
    isExisted,
  ];
  static final String id = 'id';
  static final String productId = 'productId';
  static final String orderId = 'orderId';
  static final String productName = 'productName';
  static final String productImage = 'productImage';
  static final String unitPrice = 'unitPrice';
  static final String quantity = 'quantity';
  static final String isExisted = 'isExisted';
}

class Cart {
  final String? id;
  final String? productId;
  final String? orderId;
  final String? productName;
  final String? productImage;
  final int? unitPrice;
  int quantity;
  String? isExisted;

  Cart({
    required this.id,
    required this.productId,
    required this.orderId,
    required this.productName,
    required this.productImage,
    required this.unitPrice,
    required this.quantity,
    required this.isExisted,
  });

  static Cart fromJson(Map<String, dynamic> json) => Cart(
        id: json['id'],
        productId: json['productId'],
        orderId: json['orderId'],
        productName: json['productName'],
        productImage: json['productImage'],
        unitPrice: json['unitPrice'],
        quantity: json['quantity'],
        isExisted: json['isExisted'],
      );
  Map<String, dynamic> toJson() => {
        'id': id,
        'productId': productId,
        'orderId': orderId,
        'productName': productName,
        'productImage': productImage,
        'unitPrice': unitPrice,
        'quantity': quantity,
        'isExisted': isExisted,
      };
}
