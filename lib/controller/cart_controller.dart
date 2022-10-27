import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_login_ui/controller/product_controller.dart';
import 'package:responsive_login_ui/data/model/cart.dart';
import 'package:responsive_login_ui/data/model/product.dart';
import 'package:responsive_login_ui/data/repository/cart_repo.dart';

class CartController extends GetxController {
  final CartRepo cartRepo;

  bool _isLoading = true;
  bool get isLoading => _isLoading;

  List<Cart>? _carts = [];
  List<Cart>? get carts => _carts;

  int _totalPrice = 0;
  int get totalPrice => _totalPrice;

  CartController({
    required this.cartRepo,
  });

  Future<bool> addToCart(Product product) async {
    _carts ??= [];
    int? maxId;
    for (int i = 0; i < _carts!.length; i++) {
      if (_carts![i].productId == product.id) {
        if (_carts![i].quantity == product.inventory) {
          Get.snackbar(
            "Can't add",
            "Product is not enough",
            backgroundColor: Colors.red,
            colorText: Colors.white,
          );
          return false;
        } else {
          _carts![i].quantity += 1;
          await cartRepo.updateCartToDB(_carts![i]);
          await getTotalPrice(_carts);
          return true;
        }
      }
    }
    List<Cart>? listCarts = await cartRepo.readAllCartFromDB();
    if (listCarts != null) {
      listCarts.sort((a, b) => int.parse(a.id!) - int.parse(b.id!));
      maxId = int.parse(listCarts.last.id!);
    }
    Cart cart = Cart(
      id: _carts!.isEmpty ? '${carts!.length + 1}' : '${maxId! + 1}',
      productId: product.id,
      orderId: '1',
      productName: product.name,
      unitPrice: product.price,
      quantity: 1,
    );
    _carts!.add(cart);
    if (carts!.isNotEmpty) {
      await cartRepo.createCartToDB(carts: carts);
      await getTotalPrice(_carts);
      print("Create cart to DB");
    }
    update();
    return true;
  }

  Future<void> readAllCartByOrderIdFromDB(String orderId) async {
    List<Cart>? listCarts = await cartRepo.readAllCartByOrderIdFromDB(orderId);
    _carts = [];
    for (var cart in listCarts!) {
      _carts!.add(cart);
    }
    update();
  }

  Future<void> readAllCartFromDB() async {
    _isLoading = true;
    _carts = [];
    _carts = await cartRepo.readAllCartFromDB();
    if (_carts != null) {
      await getTotalPrice(_carts);
    }
    _isLoading = false;
    update();
  }

  Future<void> getTotalPrice(List<Cart>? carts) async {
    _totalPrice = 0;
    for (var element in carts!) {
      _totalPrice += element.unitPrice! * element.quantity;
    }
    update();
  }

  Future<void> increment(int index) async {
    Product? product = await Get.find<ProductController>()
        .readProductByIdFromDB(_carts![index].productId);
    if (_carts![index].quantity == product!.inventory) {
      Get.snackbar(
        "Can't add",
        "Product is not enough",
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }
    _carts![index].quantity += 1;
    _totalPrice += _carts![index].unitPrice!;
    await cartRepo.updateCartToDB(_carts![index]);
    update();
  }

  Future<void> decrement(int index) async {
    _carts![index].quantity -= 1;
    _totalPrice -= _carts![index].unitPrice!;
    if (_carts![index].quantity == 0) {
      await cartRepo.deleteCartByIdFromDb(_carts![index].id!);
      _carts!.removeAt(index);
      print("Delete product");
    } else {
      await cartRepo.updateCartToDB(_carts![index]);
    }
    update();
  }
}
