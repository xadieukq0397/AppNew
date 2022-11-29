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

  ProductController({required this.productRepo});
  Future<List<Product>> getProducts() async {
    List<Product> listProducts = [];
    Response response = await productRepo
        .getProducts(pageQuery: {"page": "2", "page_size": "10"});
    if (response.statusCode == 200) {
      Map<String, dynamic> result =
          Map<String, dynamic>.from(jsonDecode(jsonEncode(response.body)));
      if (result["success"] == true) {
        print("got products");
        for (var element in result["products"]) {
          listProducts.add(Product.fromJson(element));
        }
      } else {
        print("Not got products");
      }
    } else {
      print("error");
    }
    return listProducts;
  }

  Future<void> createProductToDB() async {
    List<Product> listProducts = await getProducts();
    if (listProducts.isNotEmpty) {
      await productRepo.createProductToDB(products: listProducts);
      print("Create product to DB");
    }
  }

  Future<Product?> readProductByIdFromDB(int? id) async {
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
    _isLoading = false;
    update();
  }

  void removeProduct(int index) {
    _products.removeAt(index);
    update();
  }
}
