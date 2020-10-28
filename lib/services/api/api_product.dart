import 'package:flutter_api/logic/models/product.dart';

abstract class ApiProduct {
  Future<List<Product>> fetchProducts();
}
