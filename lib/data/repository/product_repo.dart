import 'package:responsive_login_ui/data/model/product.dart';
import '../provider/db/storage_database.dart';

class ProductRepo {
  Future<void> createProductToDB({List<Product>? products}) async {
    for (int i = 0; i < products!.length; i++) {
      if (products[i] is Product) {
        Product? product;
        product = await readProductByIDFromDB(id: products[i].id);
        if (product == null) {
          await StorageDatabase.instance.createProductToDB(products[i]);
        }
      }
    }
  }

  Future<Product?> readProductByIDFromDB({String? id}) async {
    Product? product = await StorageDatabase.instance.readProductByIDFromDB(id);
    return product;
  }

  Future<List<Product>?> readAllProductFromDB() async {
    List<Product>? products = [];
    products = await StorageDatabase.instance.readAllProductFromDB();
    return products;
  }
}
