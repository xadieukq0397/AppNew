import 'package:get/get.dart';
import 'package:responsive_login_ui/data/repository/order_repo.dart';

import '../data/model/order.dart';

class OrderController extends GetxController {
  final Orderrepo orderRepo;

  List<Order> _orders = [];
  List<Order> get orders => _orders;

  OrderController({
    required this.orderRepo,
  });

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
    //       transportCode: 11315),
    //   Order(
    //       id: '2',
    //       userId: '1',
    //       totalPrice: 20000000,
    //       time: '10-10-2022',
    //       addressCustomer: 'Ha Noi',
    //       customerName: 'Giang',
    //       phoneCustomer: '21541',
    //       transportCode: 15651),
    //   Order(
    //       id: '3',
    //       userId: '2',
    //       totalPrice: 15000000,
    //       time: '12-10-2022',
    //       addressCustomer: 'Xuan Truong',
    //       customerName: 'Trang',
    //       phoneCustomer: '6465153',
    //       transportCode: 31316),
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
      print(element.addressCustomer);
    }
    update();
  }
}
