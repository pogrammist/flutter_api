import 'package:flutter_api/logic/models/product.dart';

// This is the contract that all storage services must follow. Using an abstract
// class like this allows you to swap concrete implementations. This is useful
// for separating architectural layers. It also makes testing and development
// easier because you can provide a mock implementation or fake data.
abstract class StorageProduct {
  Future cacheProductData(List<Product> data);

  Future<List<Product>> getProductData();

  Future<bool> isExpiredCache();
}
