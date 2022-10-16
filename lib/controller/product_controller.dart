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

  Future<void> createProductToDB() async {
    List<Product>? products = [
      Product(
          id: '1',
          name: "Bộ Quần Áo Mưa Chống Thấm Nước Đi Xe Máy Dành Cho Nam Và Nữ",
          image:
              "https://cf.shopee.vn/file/4d6ca89f6bf93fa3997357451f78f097_tn",
          decription:
              "Include the URL for your main product image with the image link [image_link] attribute. This image appears to potential customers in ads and free listings for your product.",
          price: 152000,
          inventory: 125),
      Product(
          id: '2',
          name: "Đồng hồ thông minh Samsung Galaxy Watch 5/ Watch 5",
          image: "https://cf.shopee.vn/file/77a05996c39ac02f7f4b3bd8441d098d",
          decription:
              "Include the URL for your main product image with the image link [image_link] attribute. This image appears to potential customers in ads and free listings for your product.",
          price: 3150000,
          inventory: 15),
      Product(
          id: '3',
          name: "Apple iPhone 14 Plus 512 GB - Hàng chính hãng",
          image: "https://cf.shopee.vn/file/0982de1d517eed28495a9bbcaced5881",
          decription:
              "Include the URL for your main product image with the image link [image_link] attribute. This image appears to potential customers in ads and free listings for your product.",
          price: 30000000,
          inventory: 25),
      Product(
          id: '4',
          name:
              "[Galaxy S22 Ultra] Điện thoại Samsung Galaxy S22 Ultra - Hàng chính hãng",
          image: "https://cf.shopee.vn/file/26635c69cd0f47fbd86150bbb8a43aa3",
          decription:
              "Include the URL for your main product image with the image link [image_link] attribute. This image appears to potential customers in ads and free listings for your product.",
          price: 21000000,
          inventory: 30),
      Product(
        id: '5',
        name:
            "[Galaxy Buds 2 Pro ] Tai nghe Samsung Galaxy Buds 2 Pro - Hàng chính hãng",
        image: "https://cf.shopee.vn/file/eec429a0d94f03ae15a821228e009c87",
        decription:
            "Include the URL for your main product image with the image link [image_link] attribute. This image appears to potential customers in ads and free listings for your product.",
        price: 2500000,
        inventory: 10,
      ),
    ];

    if (products.isNotEmpty) {
      await productRepo.createProductToDB(products: products);
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
    _isLoading = false;
    update();
  }
}
