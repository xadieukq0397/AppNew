import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_login_ui/controller/order_controller.dart';
import 'package:responsive_login_ui/controller/product_controller.dart';
import 'package:responsive_login_ui/data/model/cart.dart';
import 'package:responsive_login_ui/data/model/product.dart';
import 'package:responsive_login_ui/data/repository/cart_repo.dart';

import '../data/model/order.dart';

class CartController extends GetxController {
  final CartRepo cartRepo;

  bool _isLoading = true;
  bool get isLoading => _isLoading;

  List<Cart>? _carts = [];
  List<Cart>? get carts => _carts;

  int _subTotalPrice = 0;
  int get subTotalPrice => _subTotalPrice;

  int _totalWeight = 0;
  int get totalWeight => _totalWeight;

  String? _orderId;
  String? get orderId => _orderId;

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
          await updateCartToDB(_carts![i]);
          await getTotalWeight(_carts);
          getTotalPrice(_carts);
          return true;
        }
      }
    }
    await getOrderIdFromDB();
    List<Cart>? listCarts = await cartRepo.readAllCartFromDB();
    if (listCarts != null) {
      listCarts.sort((a, b) => int.parse(a.id!) - int.parse(b.id!));
      maxId = int.parse(listCarts.last.id!);
    } else {
      listCarts = [];
    }
    Cart cart = Cart(
      id: listCarts.isEmpty ? '${listCarts.length + 1}' : '${maxId! + 1}',
      productId: product.id,
      orderId: _orderId,
      productName: product.name,
      unitPrice: product.price,
      quantity: 1,
      isExisted: 'false',
    );
    _carts!.add(cart);
    if (carts!.isNotEmpty) {
      await cartRepo.createCartToDB(carts: carts);
      await getTotalWeight(_carts);
      getTotalPrice(_carts);
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

  Future<List<Cart>?> readAllCartIsNotExitedFromDB() async {
    _isLoading = true;
    _carts = [];
    _carts = await cartRepo.readAllCartIsNotExistedFromDB();
    if (_carts != null) {
      await getTotalWeight(_carts);
      getTotalPrice(_carts);
    }
    await getOrderIdFromDB();
    _isLoading = false;
    update();
    return _carts;
  }

  Future<void> updateCartToDB(Cart cart) async {
    await cartRepo.updateCartToDB(cart);
    update();
  }

  void getTotalPrice(List<Cart>? carts) {
    _subTotalPrice = 0;
    for (var element in carts!) {
      _subTotalPrice += element.unitPrice! * element.quantity;
    }
    update();
  }

  Future<void> getTotalWeight(List<Cart>? carts) async {
    _totalWeight = 0;
    for (var element in carts!) {
      Product? product = await Get.find<ProductController>()
          .readProductByIdFromDB(element.productId);
      _totalWeight += product!.weight! * element.quantity;
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
    _subTotalPrice += _carts![index].unitPrice!;
    await updateCartToDB(_carts![index]);
    _totalWeight += product.weight!;
    update();
  }

  Future<void> decrement(int index) async {
    Product? product = await Get.find<ProductController>()
        .readProductByIdFromDB(_carts![index].productId);
    _carts![index].quantity -= 1;
    _subTotalPrice -= _carts![index].unitPrice!;
    _totalWeight -= product!.weight!;
    if (_carts![index].quantity == 0) {
      await cartRepo.deleteCartByIdFromDb(_carts![index].id!);
      _carts!.removeAt(index);
      print("Delete product");
    } else {
      await updateCartToDB(_carts![index]);
    }
    update();
  }

  Future<void> getOrderIdFromDB() async {
    List<Order>? listOrders =
        await Get.find<OrderController>().readAllOrderFromDB();
    if (listOrders != null) {
      listOrders.sort((a, b) => int.parse(a.id!) - int.parse(b.id!));
      _orderId = "${int.parse(listOrders.last.id!) + 1}";
    } else {
      listOrders = [];
      _orderId = "${listOrders.length + 1}";
    }
    update();
  }
}
