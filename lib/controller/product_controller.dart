import 'dart:convert';
import 'package:get/get.dart';
import 'package:responsive_login_ui/config/app_constants.dart';
import 'package:responsive_login_ui/data/model/product.dart';
import 'package:responsive_login_ui/data/repository/product_repo.dart';

class ProductController extends GetxController {
  final ProductRepo productRepo;
  bool _isLoading = true;
  bool get isLoading => _isLoading;

  bool _isFilter = false;
  bool get isFilter => _isFilter;

  String _nextPage = '';
  String _currentPage = '';

  bool _isNotHasData = false;
  bool get isNotHasData => _isNotHasData;

  List<dynamic> _products = [];
  List<dynamic> get products => _products;

  ProductController({required this.productRepo});

  Future<void> scrollProduct() async {
    await readAllProductFromDB(nextPage: _nextPage);
    update();
  }

  Future<List<Product>> getProducts({required String? page}) async {
    List<Product> listProducts = [];
    Response response = await productRepo.getProducts(
        pageQuery: {"page": page, "page_size": AppConstants.page_size});
    if (response.statusCode == 200) {
      Map<String, dynamic> result =
          Map<String, dynamic>.from(jsonDecode(jsonEncode(response.body)));
      if (result["success"] == true) {
        print("got products");
        _nextPage = result['page_meta']['next_page_number'].toString();
        if (result['page_meta']['has_next_page'] == false) {
          _isNotHasData = true;
        }
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

  Future<void> createProductToDB({required String? page}) async {
    List<Product> listProducts = await getProducts(page: page);
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

  Future<void> readAllProductFromDB({String? nextPage}) async {
    _isLoading = true;
    List<Product>? listProducts = await productRepo.readAllProductFromDB();
    listProducts != null
        ? _currentPage =
            (listProducts.length ~/ int.parse(AppConstants.page_size))
                .toString()
        : _currentPage = "1";
    await createProductToDB(page: nextPage ?? _currentPage);
    List<Product>? storageProducts = await productRepo.readAllProductFromDB();
    _products = [];
    for (var product in storageProducts!) {
      _products.add(product);
    }
    _isLoading = false;
    update();
  }

  Future<void> noFilterProduct() async {
    _isLoading = true;
    List<Product>? listProducts = await productRepo.readAllProductFromDB();
    _products = [];

    for (var product in listProducts!) {
      _products.add(product);
    }
    _isFilter = false;
    _isLoading = false;
    update();
  }

  Future<void> filterProduct(String value) async {
    _isLoading = true;
    _isFilter = true;
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
