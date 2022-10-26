import 'package:get/get.dart';
import 'package:responsive_login_ui/config/app_constants.dart';
import 'package:responsive_login_ui/data/provider/api/api_ghtk.dart';

import '../model/order.dart';
import '../provider/db/storage_database.dart';

class OrderRepo {
  final ApiGHTK apiGHTK;

  OrderRepo({required this.apiGHTK});
  //Server GHTK
  Future<Response> getDataTransportFee(Map<String, dynamic> query) async {
    return await apiGHTK.getData(AppConstants.transportFeeGHTK, query: query);
  }

  Future<Response> getOrderStatus(String orderNumber) async {
    return await apiGHTK.getData(AppConstants.statusOrder + orderNumber);
  }

  //Database
  Future<void> createOrderToDB({List<Order>? orders}) async {
    for (int i = 0; i < orders!.length; i++) {
      if (orders[i] is Order) {
        Order? order;
        order = await readOrderByIDFromDB(id: orders[i].id);
        if (order == null) {
          await StorageDatabase.instance.createOrderToDB(orders[i]);
        }
      }
    }
  }

  Future<Order?> readOrderByIDFromDB({String? id}) async {
    Order? order = await StorageDatabase.instance.readOrderByIDFromDB(id);
    return order;
  }

  Future<List<Order>?> readAllOrderFromDB() async {
    List<Order>? orders = [];
    orders = await StorageDatabase.instance.readAllOrderFromDB();
    return orders;
  }

  Future<List<Order>?> readAllOrderByUserIdFromDB(String userId) async {
    List<Order>? orders;
    orders = await StorageDatabase.instance.readAllOrderByUserIDFromDB(userId);
    return orders;
  }
}
