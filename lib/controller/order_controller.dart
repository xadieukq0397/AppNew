import 'dart:convert';
import 'package:get/get.dart';
import 'package:responsive_login_ui/controller/cart_controller.dart';
import 'package:responsive_login_ui/data/model/transport_fee.dart';
import 'package:responsive_login_ui/data/repository/order_repo.dart';

import '../data/model/order.dart';

class OrderController extends GetxController {
  final OrderRepo orderRepo;

  List<Order> _orders = [];
  List<Order> get orders => _orders;

  Map<String, dynamic> _query = {};

  bool _isChangeState = false;
  bool get isChangeState => _isChangeState;

  int _stateIndex = 0;
  int get stateIndex => _stateIndex;

  set query(Map<String, dynamic> value) {
    _query = value;
    update();
  }

  bool _isCreated = false;
  bool get isCreated => _isCreated;

  String? _customerName;
  set customerName(String value) {
    _customerName = value;
    update();
  }

  String? _phoneCustomer;
  set phoneCustomer(String value) {
    _phoneCustomer = value;
    update();
  }

  String? _addressCustomer;
  set addressCustomer(String value) {
    _addressCustomer = value;
    update();
  }

  TransportFee? _transportFee;
  TransportFee? get transportFee => _transportFee;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  OrderController({
    required this.orderRepo,
  });

  // Server GHTK
  Future<void> getDataTransportFee() async {
    _isLoading = true;
    Response response = await orderRepo.getDataTransportFee(_query);
    if (response.statusCode == 200) {
      Map<String, dynamic> result = jsonDecode(jsonEncode(response.body));
      print(result);
      if (result['success'] == true) {
        _transportFee = TransportFee.fromJson(result);
        print('got transport fee');
        print('------------------------' + _transportFee!.fee!.fee.toString());
        clear();
      } else {
        print("Not got transport Free");
      }
    } else {
      print("error");
    }
    update();
  }

  Future<void> getStatusOrder(String orderNumber) async {
    print('orderNumber: ' + orderNumber);
    Response response = await orderRepo.getOrderStatus(orderNumber);
    if (response.statusCode == 200) {
      Map<String, dynamic> result = jsonDecode(jsonEncode(response.body));
      print(result);
    }
    update();
  }

  // Database
  Future<void> createOrderToDB() async {
    int? maxId;
    await readAllOrderFromDB();
    Order order = Order(
      id: Get.find<CartController>().orderId,
      userId: '1',
      totalPrice:
          Get.find<CartController>().subTotalPrice + _transportFee!.fee!.fee!,
      transportFee: _transportFee!.fee!.fee!,
      time: '${DateTime.now()}',
      customerName: _customerName,
      phoneCustomer: _phoneCustomer,
      addressCustomer: _addressCustomer,
      transportCode: 123456,
      statusOrder: "Đơn tạm",
    );
    await orderRepo.createOrderToDB(order: order);
    print("Create order to DB");
    _isLoading = false;
    _isCreated = true;
    update();
  }

  Future<List<Order>?> readAllOrderFromDB() async {
    List<Order>? listOrders = await orderRepo.readAllOrderFromDB();
    if (listOrders != null) {
      _orders = [];
      for (Order order in listOrders) {
        _orders.add(order);
      }
      update();
      return listOrders;
    } else {
      return null;
    }
  }

  void clear() {
    _query = {};
    update();
  }

  void changeColor(int index) {
    if (_stateIndex != index) {
      _stateIndex = index;
      _isChangeState = !_isChangeState;
    }
    update();
  }
}
