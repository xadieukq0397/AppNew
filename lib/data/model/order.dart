final String tableOrder = 'orders';

class OrderField {
  static final List<String> values = [
    id,
    userId,
    totalPrice,
    time,
  ];
  static final String id = 'id';
  static final String userId = 'userId';
  static final String totalPrice = 'totalPrice';
  static final String time = 'time';
}

class Order {
  final String? id;
  final String? userId;
  final int? totalPrice;
  final String? time;

  Order({
    required this.id,
    required this.userId,
    required this.totalPrice,
    required this.time,
  });

  static Order fromJson(Map<String, dynamic> json) => Order(
        id: json['id'],
        userId: json['userId'],
        totalPrice: json['totalPrice'],
        time: json['time'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'userId': userId,
        'totalPrice': totalPrice,
        'time': time,
      };
}
