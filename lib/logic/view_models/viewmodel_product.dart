import 'package:flutter_api/logic/models/product.dart';
import 'package:flutter_api/services/api/api_product_implementation.dart';
import 'package:flutter/foundation.dart';

class ProductViewModel extends ChangeNotifier {
  final ApiProductImpl _apiProductImpl = ApiProductImpl();
  List<Product> _products = [];

  List<Product> get products => _products;

  void loadProducts() async {
    _products = await _apiProductImpl.fetchProducts();
    notifyListeners();
  }
}
