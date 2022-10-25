import 'dart:convert';

import 'package:get/get.dart';
import 'package:responsive_login_ui/data/model/transport_fee.dart';
import 'package:responsive_login_ui/data/repository/order_repo.dart';

import '../data/model/order.dart';

class OrderController extends GetxController {
  final OrderRepo orderRepo;

  List<Order> _orders = [];
  List<Order> get orders => _orders;

  OrderController({
    required this.orderRepo,
  });

  // Server GHTK
  Future<void> getDataTransportFee(Map<String, dynamic> query) async {
    Response response = await orderRepo.getDataTransportFee(query);
    if (response.statusCode == 200) {
      Map<String, dynamic> result = jsonDecode(jsonEncode(response.body));
      print(result);
      if (result['success'] == true) {
        TransportFee transportFee = TransportFee.fromJson(result);
        print('got transport fee');
        print('------------------------' + transportFee.fee!.fee.toString());
      } else {
        print("Not got transport Free");
      }
    } else {
      print("error");
    }
  }

  // Database
  Future<void> createOrderToDB() async {
    // List<Order>? orders = [
    //   Order(
    //       id: '1',
    //       userId: '2',
    //       totalPrice: 12000000,
    //       time: '16-10-2022',
    //       addressCustomer: 'Nam Dinh',
    //       customerName: 'Long',
    //       phoneCustomer: '1234',
    //       transportCode: 11315,
    //       statusOrder: "pending"),
    //   Order(
    //       id: '2',
    //       userId: '1',
    //       totalPrice: 20000000,
    //       time: '10-10-2022',
    //       addressCustomer: 'Ha Noi',
    //       customerName: 'Giang',
    //       phoneCustomer: '21541',
    //       transportCode: 15651,
    //       statusOrder: 'confirm'),
    //   Order(
    //       id: '3',
    //       userId: '2',
    //       totalPrice: 15000000,
    //       time: '12-10-2022',
    //       addressCustomer: 'Xuan Truong',
    //       customerName: 'Trang',
    //       phoneCustomer: '6465153',
    //       transportCode: 31316,
    //       statusOrder: 'pending'),
    // ];

    // if (orders.isNotEmpty) {
    //   await orderRepo.createOrderToDB(orders: orders);
    //   print("Create order to DB");
    // }
  }

  Future<void> readAllOrderByUserIdFromDB(String userId) async {
    List<Order>? listOrders =
        await orderRepo.readAllOrderByUserIdFromDB(userId);
    _orders = [];
    for (var order in listOrders!) {
      _orders.add(order);
    }
    for (var element in _orders) {
      print(element.statusOrder);
    }
    update();
  }
}
