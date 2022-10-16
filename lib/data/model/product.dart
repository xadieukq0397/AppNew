final String tableProduct = 'products';

class ProductField {
  static final List<String> values = [
    id,
    name,
    image,
    decription,
    price,
    inventory
  ];
  static final String name = 'name';
  static final String image = 'image';
  static final String decription = 'decription';
  static final String price = 'price';
  static final String id = 'id';
  static final String inventory = 'inventory';
}

class Product {
  final String? id;
  final String? name;
  final String? image;
  final String? decription;
  final num? price;
  final int? inventory;

  Product({
    required this.id,
    required this.name,
    required this.image,
    required this.decription,
    required this.price,
    required this.inventory,
  });
  static Product fromJson(Map<String, dynamic> json) => Product(
        id: json['id'],
        name: json['name'],
        image: json['image'],
        decription: json['decription'],
        price: json['price'],
        inventory: json['inventory'],
      );
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'image': image,
        'decription': decription,
        'price': price,
        'inventory': inventory,
      };
}
