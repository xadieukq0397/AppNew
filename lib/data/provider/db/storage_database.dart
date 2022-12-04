import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../../model/cart.dart';
import '../../model/category.dart';
import '../../model/district.dart';
import '../../model/order.dart';
import '../../model/product.dart';
import '../../model/province.dart';
import '../../model/ward.dart';

class StorageDatabase {
  StorageDatabase._init();
  //create singleton instance ProductDatabaset
  static final StorageDatabase instance = StorageDatabase._init();
  static Database? _database;
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB("address.db");
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    final name = 'TEXT NOT NULL';
    final productName = 'TEXT NOT NULL';
    final commentsCount = 'INTERGER NOT NULL';
    final createdAt = 'INTERGER NOT NULL';
    final code = 'TEXT NOT NULL';
    final type = 'TEXT NOT NULL';
    final slug = 'TEXT NOT NULL';
    final path = 'TEXT NOT NULL';
    final id = 'INTERGER PRIMARY KEY';
    final parent_id = 'TEXT NOT NULL';
    final userId = 'INTERGER NOT NULL';
    final totalPrice = 'INTERGER NOT NULL';
    final transportFee = 'INTERGER NOT NULL';
    final time = 'TEXT NOT NULL';
    final imageUrls = 'TEXT NOT NULL';
    final productImage = 'TEXT NOT NULL';
    final unitPrice = 'INTERGER NOT NULL';
    final price = 'INTERGER NOT NULL';
    final stock = 'INTERGER NOT NULL';
    final updatedAt = 'INTERGER NOT NULL';
    final productId = 'INTERGER NOT NULL';
    final orderId = 'INTERGER NOT NULL';
    final quantity = 'INTERGER NOT NULL';
    final weight = 'INTERGER NOT NULL';
    final customerName = 'TEXT NOT NULL';
    final phoneCustomer = 'TEXT NOT NULL';
    final addressCustomer = 'TEXT NOT NULL';
    final transportCode = 'INTERGER NOT NULL';
    final statusOrder = 'TEXT NOT NULL';
    final isExisted = 'TEXT NOT NULL';
    final provinceId = 'TEXT NOT NULL';
    final districtId = 'TEXT NOT NULL';
    final wardId = 'TEXT NOT NULL';

    await db.execute('''
CREATE TABLE $tableProvinces(
  ${ProvinceField.provinceId} $provinceId,
  ${ProvinceField.name} $name,
  ${ProvinceField.slug} $slug,
  ${ProvinceField.type} $type
  )''');
    await db.execute('''
CREATE TABLE $tableDistrict(
  ${DistrictField.districtId} $districtId,
  ${DistrictField.name} $name,
  ${DistrictField.type} $type,
  ${DistrictField.slug} $slug,
  ${DistrictField.path} $path,
  ${DistrictField.parent_id} $parent_id
  )''');
    await db.execute('''
CREATE TABLE $tableWard(
  ${WardField.wardId} $wardId,
  ${WardField.name} $name,
  ${WardField.type} $type,
  ${WardField.slug} $slug,
  ${WardField.path} $path,
  ${WardField.parent_id} $parent_id
  )''');
    await db.execute('''
CREATE TABLE $tableProduct(
  ${ProductField.id} $id,
  ${ProductField.code} $code,
  ${ProductField.commentsCount} $commentsCount,
  ${ProductField.createdAt} $createdAt,
  ${ProductField.imageUrls} $imageUrls,
  ${ProductField.name} $name,
  ${ProductField.price} $price,
  ${ProductField.slug} $slug,
  ${ProductField.stock} $stock,
  ${ProductField.updatedAt} $updatedAt,
  ${ProductField.weight} $weight
  )''');
    await db.execute('''
CREATE TABLE $tableCategory(
  ${CategoryField.id} $id,
  ${CategoryField.name} $name
  )''');
    await db.execute('''
CREATE TABLE $tableCart(
  ${CartField.id} $id,
  ${CartField.orderId} $orderId,
  ${CartField.productId} $productId,
  ${CartField.productName} $productName,
  ${CartField.productImage} $productImage,
  ${CartField.unitPrice} $unitPrice,
  ${CartField.quantity} $quantity,
  ${CartField.isExisted} $isExisted
  )''');
    await db.execute('''
CREATE TABLE $tableOrder(
  ${OrderField.id} $id,
  ${OrderField.userId} $userId,
  ${OrderField.totalPrice} $totalPrice,
  ${OrderField.transportFee} $transportFee,
  ${OrderField.time} $time,
  ${OrderField.customerName} $customerName,
  ${OrderField.phoneCustomer} $phoneCustomer,
  ${OrderField.addressCustomer} $addressCustomer,
  ${OrderField.transportCode} $transportCode,
  ${OrderField.statusOrder} $statusOrder
  )''');
  }

  // Province
  Future<void> createProvinceToDB(Province province) async {
    final db = await instance.database;
    final map = province.toJson();
    await db.insert(
      tableProvinces,
      map,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<Province?> readProvinceByIDFromDB(String? id) async {
    final db = await instance.database;
    final maps = await db.query(
      tableProvinces,
      columns: ProvinceField.values,
      where: '${ProvinceField.provinceId} = ?',
      whereArgs: [id],
    );
    if (maps.isNotEmpty) {
      return Province.fromJson(maps.first);
    } else {
      return null;
    }
  }

  Future<Province?> readProvinceByNameFromDB(String? name) async {
    final db = await instance.database;
    final maps = await db.query(
      tableProvinces,
      columns: ProvinceField.values,
      where: '${ProvinceField.name} = ?',
      whereArgs: [name],
    );
    if (maps.isNotEmpty) {
      return Province.fromJson(maps.first);
    } else {
      return null;
    }
  }

  Future<List<Province>?> readAllProvinceFromDB() async {
    final db = await instance.database;
    final results = await db.query(tableProvinces);
    if (results.isNotEmpty) {
      return results.map((json) => Province.fromJson(json)).toList();
    } else {
      return null;
    }
  }

  // District
  Future<void> createDistrictToDB(District district) async {
    final db = await instance.database;
    final map = district.toJson();
    await db.insert(
      tableDistrict,
      map,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<District?> readDistrictByIDFromDB(String? id) async {
    final db = await instance.database;
    final maps = await db.query(
      tableDistrict,
      columns: DistrictField.values,
      where: '${DistrictField.districtId} = ?',
      whereArgs: [id],
    );
    if (maps.isNotEmpty) {
      return District.fromJson(maps.first);
    } else {
      return null;
    }
  }

  Future<District?> readDistrictByNameFromDB(String? name) async {
    final db = await instance.database;
    final maps = await db.query(
      tableDistrict,
      columns: DistrictField.values,
      where: '${DistrictField.name} = ?',
      whereArgs: [name],
    );
    if (maps.isNotEmpty) {
      return District.fromJson(maps.first);
    } else {
      return null;
    }
  }

  Future<List<District>?> readAllDistrictByParentIDFromDB(
      String provinceID) async {
    final db = await instance.database;
    final results = await db.query(
      tableDistrict,
      columns: DistrictField.values,
      where: '${DistrictField.parent_id} = ?',
      whereArgs: [provinceID],
    );
    if (results.isNotEmpty) {
      return results.map((json) => District.fromJson(json)).toList();
    } else {
      return null;
    }
  }

  // Ward
  Future<void> createWardToDB(Ward district) async {
    final db = await instance.database;
    final map = district.toJson();
    await db.insert(
      tableWard,
      map,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<Ward?> readWardByIDFromDB(String? id) async {
    final db = await instance.database;
    final maps = await db.query(
      tableWard,
      columns: WardField.values,
      where: '${WardField.wardId} = ?',
      whereArgs: [id],
    );
    if (maps.isNotEmpty) {
      return Ward.fromJson(maps.first);
    } else {
      return null;
    }
  }

  Future<Ward?> readWardByNameFromDB(String? name) async {
    final db = await instance.database;
    final maps = await db.query(
      tableWard,
      columns: WardField.values,
      where: '${WardField.name} = ?',
      whereArgs: [name],
    );
    if (maps.isNotEmpty) {
      return Ward.fromJson(maps.first);
    } else {
      return null;
    }
  }

  Future<List<Ward>?> readAllWardByParentIDFromDB(String districtId) async {
    final db = await instance.database;
    final results = await db.query(tableWard,
        columns: WardField.values,
        where: '${WardField.parent_id} = ?',
        whereArgs: [districtId]);
    if (results.isNotEmpty) {
      return results.map((json) => Ward.fromJson(json)).toList();
    } else {
      return null;
    }
  }

  // Product
  Future<void> createProductToDB(Product product) async {
    final db = await instance.database;
    final map = product.toJson();
    await db.insert(
      tableProduct,
      map,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Product>?> readAllProductFromDB() async {
    final db = await instance.database;
    final results = await db.query(tableProduct);
    if (results.isNotEmpty) {
      return results.map((json) => Product.fromJson(json)).toList();
    } else {
      return null;
    }
  }

  Future<Product?> readProductByIDFromDB(int? id) async {
    final db = await instance.database;
    final maps = await db.query(
      tableProduct,
      columns: ProductField.values,
      where: '${ProductField.id} = ?',
      whereArgs: [id],
    );
    if (maps.isNotEmpty) {
      return Product.fromJson(maps.first);
    } else {
      return null;
    }
  }

  //Cart
  Future<void> createCartToDB(Cart cart) async {
    final db = await instance.database;
    final map = cart.toJson();
    await db.insert(
      tableCart,
      map,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Cart>?> readAllCartFromDB() async {
    final db = await instance.database;
    final results = await db.query(tableCart);
    if (results.isNotEmpty) {
      return results.map((json) => Cart.fromJson(json)).toList();
    } else {
      return null;
    }
  }

  Future<List<Cart>?> readAllCartIsNotExistedFromDB() async {
    final db = await instance.database;
    final results = await db.query(
      tableCart,
      columns: CartField.values,
      where: '${CartField.isExisted} = ?',
      whereArgs: [0],
    );
    if (results.isNotEmpty) {
      return results.map((json) => Cart.fromJson(json)).toList();
    } else {
      return null;
    }
  }

  Future<Cart?> readCartByIDFromDB(int? id) async {
    final db = await instance.database;
    final maps = await db.query(
      tableCart,
      columns: CartField.values,
      where: '${CartField.id} = ?',
      whereArgs: [id],
    );
    if (maps.isNotEmpty) {
      return Cart.fromJson(maps.first);
    } else {
      return null;
    }
  }

  Future<List<Cart>?> readAllCartByOrderIDFromDB(int? orderId) async {
    final db = await instance.database;
    final maps = await db.query(
      tableCart,
      columns: CartField.values,
      where: '${CartField.orderId} = ?',
      whereArgs: [orderId],
    );
    if (maps.isNotEmpty) {
      return maps.map((json) => Cart.fromJson(json)).toList();
    } else {
      return null;
    }
  }

  Future<void> updateCartToDB(Cart cart) async {
    final db = await instance.database;
    final map = await db.update(
      tableCart,
      cart.toJson(),
      where: '${CartField.id} = ?',
      whereArgs: [cart.id],
    );
  }

  Future<void> deleteCartByIdFromDb(int id) async {
    final db = await instance.database;
    await db.delete(
      tableCart,
      where: '${CartField.id} = ?',
      whereArgs: [id],
    );
  }

  // Order
  Future<void> createOrderToDB(Order order) async {
    final db = await instance.database;
    final map = order.toJson();
    await db.insert(
      tableOrder,
      map,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Order>?> readAllOrderFromDB() async {
    final db = await instance.database;
    final results = await db.query(tableOrder);
    if (results.isNotEmpty) {
      return results.map((json) => Order.fromJson(json)).toList();
    } else {
      return null;
    }
  }

  Future<Order?> readOrderByIDFromDB(int? id) async {
    final db = await instance.database;
    final maps = await db.query(
      tableOrder,
      columns: OrderField.values,
      where: '${OrderField.id} = ?',
      whereArgs: [id],
    );
    if (maps.isNotEmpty) {
      return Order.fromJson(maps.first);
    } else {
      return null;
    }
  }

  Future<List<Order>?> readAllOrderByUserIDFromDB(int? userId) async {
    final db = await instance.database;
    final maps = await db.query(
      tableOrder,
      columns: OrderField.values,
      where: '${OrderField.userId} = ?',
      whereArgs: [userId],
    );
    if (maps.isNotEmpty) {
      return maps.map((json) => Order.fromJson(json)).toList();
    } else {
      return null;
    }
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
