final String tableOrder = 'orders';

class OrderField {
  static final List<String> values = [
    id,
    userId,
    totalPrice,
    transportFee,
    time,
    customerName,
    phoneCustomer,
    addressCustomer,
    transportCode,
    statusOrder
  ];
  static final String id = 'id';
  static final String userId = 'userId';
  static final String totalPrice = 'totalPrice';
  static final String transportFee = 'transportFee';
  static final String time = 'time';
  static final String customerName = 'customerName';
  static final String phoneCustomer = 'phoneCustomer';
  static final String addressCustomer = 'addressCustomer';
  static final String transportCode = 'transportCode';
  static final String statusOrder = 'statusOrder';
}

class Order {
  final int? id;
  final int? userId;
  final int? totalPrice;
  final int? transportFee;
  final String? time;
  final String? customerName;
  final String? phoneCustomer;
  final String? addressCustomer;
  final int? transportCode;
  String? statusOrder;

  Order({
    required this.id,
    required this.userId,
    required this.totalPrice,
    required this.time,
    required this.customerName,
    required this.phoneCustomer,
    required this.addressCustomer,
    required this.transportCode,
    required this.statusOrder,
    required this.transportFee,
  });

  static Order fromJson(Map<String, dynamic> json) => Order(
        id: json['id'],
        userId: json['userId'],
        totalPrice: json['totalPrice'],
        transportFee: json['transportFee'],
        time: json['time'],
        customerName: json['customerName'],
        phoneCustomer: json['phoneCustomer'],
        addressCustomer: json['addressCustomer'],
        transportCode: json['transportCode'],
        statusOrder: json['statusOrder'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'userId': userId,
        'totalPrice': totalPrice,
        'transportFee': transportFee,
        'time': time,
        'customerName': customerName,
        'phoneCustomer': phoneCustomer,
        'addressCustomer': addressCustomer,
        'transportCode': transportCode,
        'statusOrder': statusOrder,
      };
}
