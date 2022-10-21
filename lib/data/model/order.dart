final String tableOrder = 'orders';

class OrderField {
  static final List<String> values = [
    id,
    userId,
    totalPrice,
    time,
    customerName,
    phoneCustomer,
    addressCustomer,
    transportCode,
  ];
  static final String id = 'id';
  static final String userId = 'userId';
  static final String totalPrice = 'totalPrice';
  static final String time = 'time';
  static final String customerName = 'customerName';
  static final String phoneCustomer = 'phoneCustomer';
  static final String addressCustomer = 'addressCustomer';
  static final String transportCode = 'transportCode';
}

class Order {
  final String? id;
  final String? userId;
  final int? totalPrice;
  final String? time;
  final String? customerName;
  final String? phoneCustomer;
  final String? addressCustomer;
  final int? transportCode;

  Order({
    required this.id,
    required this.userId,
    required this.totalPrice,
    required this.time,
    required this.customerName,
    required this.phoneCustomer,
    required this.addressCustomer,
    required this.transportCode,
  });

  static Order fromJson(Map<String, dynamic> json) => Order(
        id: json['id'],
        userId: json['userId'],
        totalPrice: json['totalPrice'],
        time: json['time'],
        customerName: json['customerName'],
        phoneCustomer: json['phoneCustomer'],
        addressCustomer: json['addressCustomer'],
        transportCode: json['transportCode'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'userId': userId,
        'totalPrice': totalPrice,
        'time': time,
        'customerName': customerName,
        'phoneCustomer': phoneCustomer,
        'addressCustomer': addressCustomer,
        'transportCode': transportCode,
      };
}
