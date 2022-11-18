import 'dart:convert';
import 'package:get/get.dart';
import 'package:responsive_login_ui/controller/cart_controller.dart';
import 'package:responsive_login_ui/data/model/transport_fee.dart';
import 'package:responsive_login_ui/data/repository/order_repo.dart';
import '../data/model/cart.dart';
import '../data/model/order.dart';

class OrderController extends GetxController {
  final OrderRepo orderRepo;

  List<Order> _orders = [];
  List<Order> get orders => _orders;

  Map<int, List<Cart>?> _mapListCart = {};
  Map<int, List<Cart>?> get mapListCart => _mapListCart;

  Map<String, dynamic> _query = {};

  bool _isChangeState = false;
  bool get isChangeState => _isChangeState;

  int _stateIndex = 0;
  int get stateIndex => _stateIndex;

  set query(Map<String, dynamic> value) {
    _query = value;
    update();
  }

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

  bool _isCreate = false;
  bool get isCreate => _isCreate;

  List<List<Cart>?> _listValuesMapOrder = [];
  List<List<Cart>?> get listValuesMapOrder => _listValuesMapOrder;

  OrderController({
    required this.orderRepo,
  });

  // Server GHTK
  Future<void> getDataTransportFee() async {
    _isCreate = true;
    Response response = await orderRepo.getDataTransportFee(_query);
    if (response.statusCode == 200) {
      Map<String, dynamic> result = jsonDecode(jsonEncode(response.body));
      print(result);
      if (result['success'] == true) {
        _transportFee = TransportFee.fromJson(result);
        print('got transport fee');
        print('------------------------' + _transportFee!.fee!.fee.toString());
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
    print(response);
    if (response.statusCode == 200) {
      Map<String, dynamic> result = jsonDecode(jsonEncode(response.body));
      print(result);
    }
    update();
  }

  // Database
  Future<void> createOrderToDB() async {
    int? maxId;
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
    _isCreate = false;
    update();
  }

  Future<void> createAnOrder() async {
    await getDataTransportFee();
    await createOrderToDB();
    await updateListCartIsNotExist();
  }

  Future<void> updateListCartIsNotExist() async {
    List<Cart>? listCarts =
        await Get.find<CartController>().readAllCartIsNotExitedFromDB();
    if (listCarts != null) {
      for (var cart in listCarts) {
        cart.isExisted = 'true';
        await Get.find<CartController>().updateCartToDB(cart);
      }
    }
  }

  Future<List<Order>?> readAllOrderFromDB() async {
    _isLoading = true;
    _mapListCart = {};
    List<Order>? listOrders = await orderRepo.readAllOrderFromDB();
    if (listOrders != null) {
      _orders = [];
      for (Order order in listOrders) {
        _orders.add(order);
        List<Cart>? listCart = await Get.find<CartController>()
            .readAllCartByOrderIdFromDB(order.id!);
        _mapListCart.putIfAbsent(int.parse(order.id!), () => listCart);
      }
      getProductFromOrder();
      _isLoading = false;
      update();
      return listOrders;
    } else {
      return null;
    }
  }

  void changeColor(int index) {
    if (_stateIndex != index) {
      _stateIndex = index;
      _isChangeState = !_isChangeState;
    }
    update();
  }

  void getProductFromOrder() {
    _listValuesMapOrder = [];
    _listValuesMapOrder = List<List<Cart>?>.from(_mapListCart.values);
  }
}
