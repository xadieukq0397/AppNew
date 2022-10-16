import 'dart:ffi';
import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:responsive_login_ui/constants.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Product {
  final int id;
  final String name;
  final String urlImage;
  final int priceProduct;
  final String saledProduct;
  Product({
    required this.id,
    required this.name,
    required this.urlImage,
    required this.priceProduct,
    required this.saledProduct,
  });
  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "name": name,
      "urlImage": urlImage,
      "priceProduct": priceProduct,
      "saledProduct": saledProduct,
    };
  }

  @override
  String toString() {
    return '{id:$id,name:$name,urlImage:$urlImage,priceProduct:$priceProduct,saledProduct:$saledProduct}';
  }
}

class ProductDataBase {
  Future<Database> creatDatabase() async {
    final database = openDatabase(join(await getDatabasesPath(), 'product.db'),
        onCreate: (db, version) {
      return db.execute(
          'CREATE TABLE products (id INTEGER PRIMARY KEY, name TEXT, urlImage TEXT, priceProduct INTEGER, saledProduct TEXT)');
    }, version: 1);
    return database;
  }

  Future<void> insertProduct(Database database) async {
    final db = database;
    for (int i = 0; i < lNameProduct.length; i++) {
      Product product = Product(
        id: i,
        name: lNameProduct[i],
        urlImage: lImgProduct[i],
        priceProduct: lPriceProduct[i],
        saledProduct: lSaledProduct[i],
      );
      await db.insert("products", product.toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace);
    }
  }

  Future<List<Product>> products(Database database) async {
    final db = database;
    List<Map> lsMaps = await db.query("products");
    List<Product> lsProduct = [];
    print(lsMaps[0]['priceProduct'].runtimeType);
    for (var mProduct in lsMaps) {
      Product product = Product(
        id: mProduct['id'],
        name: mProduct['name'],
        urlImage: mProduct['urlImage'],
        priceProduct: mProduct['priceProduct'],
        saledProduct: mProduct['saledProduct'],
      );
      lsProduct.add(product);
    }
    return lsProduct;
  }

  Future<void> update(Product product, Database database) async {
    final db = database;
    await db.update(
      "products",
      product.toMap(),
      where: 'id= ?',
      whereArgs: [product.id],
    );
  }

  Future<void> deleteProduct(int id, Database database) async {
    // Get a reference to the database.
    final db = database;

    // Remove the Dog from the database.
    await db.delete(
      'products',
      // Use a `where` clause to delete a specific dog.
      where: 'id = ?',
      // Pass the Dog's id as a whereArg to prevent SQL injection.
      whereArgs: [id],
    );
  }
}
