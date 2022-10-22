import '../model/order.dart';
import '../provider/db/storage_database.dart';

class Orderrepo {
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
