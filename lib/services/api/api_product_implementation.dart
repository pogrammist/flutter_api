import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_api/logic/models/product.dart';
import 'api_product.dart';

class ApiProductImpl implements ApiProduct {
  final _host = 'node-mongo-jwt-api.herokuapp.com';
  final _path = 'products';
  final Map<String, String> _headers = {'Authorization': 'Bearer AccessToken'};

  List<Product> _productsCache;

  Future<List<Product>> fetchProducts() async {
    if (_productsCache == null) {
      print('getting products from the web');
      final uri = Uri.https(_host, _path);
      final results = await http.get(uri, headers: _headers);
      final jsonObject = json.decode(results.body);
      print(results.body);
      _productsCache = _createProductsListFromRawMap(jsonObject);
    } else {
      print('getting products from cache');
    }
    return _productsCache;
  }

  List<Product> _createProductsListFromRawMap(Map jsonObject) {
    List<Product> list = [];
    if (jsonObject != null) {
      jsonObject.forEach((key, value) {
        final product = Product.fromJson(value);
        list.add(product);
      });
    }
    return list;
  }
}
