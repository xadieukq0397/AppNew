import 'dart:convert';

import 'package:get/get.dart';
import 'package:responsive_login_ui/data/model/product.dart';
import 'package:responsive_login_ui/data/repository/product_repo.dart';

class ProductController extends GetxController {
  final ProductRepo productRepo;
  bool _isLoading = true;
  bool get isLoading => _isLoading;

  List<Product> _products = [];
  List<Product> get products => _products;

  bool _isFilter = true;
  bool get isFilter => _isFilter;
  ProductController({required this.productRepo});
  Future<void> getProducts() async {
    Response response = await productRepo.getProducts();
    if (response.statusCode == 200) {
      for (var element in response.body) {
        Product product = Product(
          id: element["id"].toString(),
          name: element["title"],
          image: element["image"],
          decription: element["description"],
          price: element["price"].toInt(),
          inventory: element["rating"]["count"],
          weight: element["rating"]["count"],
        );
        _products.add(product);
      }
    } else {
      print("error");
    }
    update();
  }

  Future<void> createProductToDB() async {
    await getProducts();
    List<Product>? listProducts = _products;
    if (listProducts.isNotEmpty) {
      await productRepo.createProductToDB(products: listProducts);
      print("Create product to DB");
    }
  }

  Future<Product?> readProductByIdFromDB(String? id) async {
    Product? product = await productRepo.readProductByIDFromDB(id: id);
    if (product != null) {
      return product;
    } else {
      return null;
    }
  }

  Future<void> readAllProductFromDB() async {
    await createProductToDB();
    _isLoading = true;
    List<Product>? listProducts = await productRepo.readAllProductFromDB();
    _products = [];
    for (var product in listProducts!) {
      _products.add(product);
    }
    _isFilter = true;
    _isLoading = false;
    update();
  }

  Future<void> filterProduct(String value) async {
    _isLoading = true;
    _products = [];
    List<Product>? products = await productRepo.readAllProductFromDB();
    if (products!.isNotEmpty) {
      _products = products
          .where((Product product) =>
              product.name!.toLowerCase().startsWith(value.toLowerCase()))
          .toList();
    }
    _isFilter = false;
    _isLoading = false;
    update();
  }

  void removeProduct(int index) {
    _products.removeAt(index);
    update();
  }
}
