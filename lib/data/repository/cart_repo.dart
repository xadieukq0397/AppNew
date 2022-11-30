import '../model/cart.dart';
import '../provider/db/storage_database.dart';

class CartRepo {
  Future<void> createCartToDB({List<Cart>? carts}) async {
    for (int i = 0; i < carts!.length; i++) {
      if (carts[i] is Cart) {
        Cart? cart;
        cart = await readCartByIDFromDB(id: carts[i].id);
        if (cart == null) {
          await StorageDatabase.instance.createCartToDB(carts[i]);
        }
      }
    }
  }

  Future<Cart?> readCartByIDFromDB({int? id}) async {
    Cart? cart = await StorageDatabase.instance.readCartByIDFromDB(id);
    return cart;
  }

  Future<List<Cart>?> readAllCartFromDB() async {
    List<Cart>? carts = [];
    carts = await StorageDatabase.instance.readAllCartFromDB();
    return carts;
  }

  Future<List<Cart>?> readAllCartIsNotExistedFromDB() async {
    List<Cart>? carts = [];
    carts = await StorageDatabase.instance.readAllCartIsNotExistedFromDB();
    return carts;
  }

  Future<List<Cart>?> readAllCartByOrderIdFromDB(int orderId) async {
    List<Cart>? carts;
    carts = await StorageDatabase.instance.readAllCartByOrderIDFromDB(orderId);
    return carts;
  }

  Future<void> updateCartToDB(Cart cart) async {
    await StorageDatabase.instance.updateCartToDB(cart);
  }

  Future<void> deleteCartByIdFromDb(int id) async {
    await StorageDatabase.instance.deleteCartByIdFromDb(id);
  }
}
