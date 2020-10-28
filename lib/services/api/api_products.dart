import 'package:flutter_api/logic/models/product.dart';

abstract class ApiProducts {
  Future<List<Product>> fetchProducts();
}
