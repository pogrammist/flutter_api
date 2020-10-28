import 'package:flutter_api/logic/models/product.dart';

abstract class StorageProduct {
  Future cacheProductData(List<Product> data);

  Future<List<Product>> getProductData();

  Future<bool> isExpiredCache();
}
