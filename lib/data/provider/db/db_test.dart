import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';

class Dog {
  final int id;
  final String name;
  final int age;
  const Dog({required this.id, required this.name, required this.age});
  Map<String, dynamic> toMap() {
    return {
      "id ": id,
      "name": name,
      "age": age,
    };
  }

  @override
  String toString() {
    return 'Dog(id: $id, name: $name, age: $age)';
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  String dataBasePath = await getDatabasesPath();
  print(dataBasePath);
  // Future<Database> database = openDatabase(
  //   join(dataBasePath, 'dog_database.db'),
  // );
  final database = openDatabase(
    join(dataBasePath, 'dog_database.db'),
    onCreate: (db, version) {
      return db.execute(
        'CREATE TABLE dogs(id INTEGER PRIMARY KEY, name TEXT, age INTEGER)',
      );
    },
    version: 1,
  );

  Future<void> insertDog(Dog dog) async {
    final db = await database;
    await db.insert(
      'dogs',
      dog.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  var ido = Dog(
    id: 0,
    name: "Micky",
    age: 15,
  );
  await insertDog(ido);
  Future<List<Dog>> dogs() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('dogs');
    return List.generate(maps.length, (index) {
      return Dog(
        id: maps[index]['id'],
        name: maps[index]['name'],
        age: maps[index]['age'],
      );
    });
  }

  print(await dogs());
  Future<void> updateDog(Dog dog) async {
    final db = await database;
    await db.update(
      'dogs',
      dog.toMap(),
      where: 'id = ?',
      whereArgs: [dog.id],
    );
  }

  ido = Dog(
    id: ido.id,
    name: ido.name,
    age: ido.age + 7,
  );
  await updateDog(ido);
  print(await dogs());
  Future<void> deleteDog(int id) async {
    final db = await database;
    await db.delete(
      'dogs',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  await deleteDog(0);
  print(await dogs());
}
