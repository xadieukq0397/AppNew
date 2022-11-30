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
  Future<void> createOrderToDB({Order? order}) async {
    Order? orderCa = await readOrderByIDFromDB(id: order!.id);
    if (orderCa == null) {
      await StorageDatabase.instance.createOrderToDB(order);
    }
  }

  Future<Order?> readOrderByIDFromDB({int? id}) async {
    Order? order = await StorageDatabase.instance.readOrderByIDFromDB(id);
    return order;
  }

  Future<List<Order>?> readAllOrderFromDB() async {
    List<Order>? orders = [];
    orders = await StorageDatabase.instance.readAllOrderFromDB();
    return orders;
  }
}
