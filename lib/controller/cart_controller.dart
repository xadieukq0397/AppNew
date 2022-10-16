import 'package:get/get.dart';
import 'package:responsive_login_ui/data/model/cart.dart';
import 'package:responsive_login_ui/data/repository/cart_repo.dart';

class CartController extends GetxController {
  final CartRepo cartRepo;

  List<Cart> _carts = [];
  List<Cart> get carts => _carts;

  CartController({
    required this.cartRepo,
  });

  Future<void> createCartToDB() async {
    List<Cart>? carts = [
      Cart(id: '1', productId: '2', orderId: '2', quantity: 12),
      Cart(id: '2', productId: '1', orderId: '1', quantity: 11),
      Cart(id: '3', productId: '3', orderId: '3', quantity: 9),
      Cart(id: '4', productId: '5', orderId: '2', quantity: 9),
      Cart(id: '5', productId: '1', orderId: '1', quantity: 9),
    ];

    if (carts.isNotEmpty) {
      await cartRepo.createCartToDB(carts: carts);
      print("Create cart to DB");
    }
  }

  Future<void> readAllCartByOrderIdFromDB(String orderId) async {
    List<Cart>? listCarts = await cartRepo.readAllCartByOrderIdFromDB(orderId);
    _carts = [];
    for (var cart in listCarts!) {
      _carts.add(cart);
    }
    for (var element in _carts) {
      print(element.productId);
    }
    update();
  }
}
