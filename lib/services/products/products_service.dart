import 'package:potsdamer_buergerstiftung/services/directus.dart';

class Product {
  String name;
  String status;

  Product({required this.name, required this.status});

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(name: map['name'], status: map['status']);
  }
}

class ProductsService {
  static Future<List<Product>> getProducts() async {
    var res = await directus.items("products").readMany();
    return res.data.map((e) => Product.fromMap(e)).toList();
  }
}
