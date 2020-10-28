import 'package:flutter_api/logic/models/product.dart';
import 'package:flutter_api/services/api/api_products_implementation.dart';
import 'package:flutter/foundation.dart';

class ProductsViewModel extends ChangeNotifier {
  final ApiProductsImpl _apiProductImpl = ApiProductsImpl();
  List<Product> _products = [];

  List<Product> get products => _products;

  void loadProducts() async {
    _products = await _apiProductImpl.fetchProducts();
    notifyListeners();
  }
}
