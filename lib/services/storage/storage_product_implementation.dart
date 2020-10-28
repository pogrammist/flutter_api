import 'dart:convert';
import 'package:flutter_api/logic/models/product.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'storage_product.dart';

// This class is the concrete implementation of [StorageService]. Internally
// it uses shared preferences to save and retrieve data, but that is an
// implementation detail that no other class in the app knows about. Swapping
// out shared preferences with a SQL database would be as simple as creating
// a new [StorageService] implementation.
class StorageProductImpl implements StorageProduct {
  static const sharedPrefProductKey = 'product_key';
  static const sharedPrefLastCacheTimeKey = 'cache_time_key';

  @override
  Future cacheProductData(List<Product> data) {
    String jsonString = jsonEncode(data);
    _saveToPreferences(sharedPrefProductKey, jsonString);
    _resetCacheTimeToNow();
    return null;
  }

  Future<void> _saveToPreferences(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  Future<void> _resetCacheTimeToNow() async {
    int timestamp = DateTime.now().millisecondsSinceEpoch;
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt(sharedPrefLastCacheTimeKey, timestamp);
  }

  @override
  Future<List<Product>> getProductData() async {
    String data = await _getStringFromPreferences(sharedPrefProductKey);
    List<Product> rates = _deserializeRates(data);
    return Future<List<Product>>.value(rates);
  }

  Future<String> _getStringFromPreferences(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return Future<String>.value(prefs.getString(key) ?? '');
  }

  List<Product> _deserializeRates(String data) {
    List<Map> rateList = jsonDecode(data);
    return rateList.map((rateMap) {
      Product.fromJson(rateMap);
    }).toList();
  }

  @override
  Future<bool> isExpiredCache() async {
    final now = DateTime.now();
    DateTime lastUpdate = await _getLastRatesCacheTime();
    Duration difference = now.difference(lastUpdate);
    return difference.inMinutes > 10;
  }

  Future<DateTime> _getLastRatesCacheTime() async {
    final prefs = await SharedPreferences.getInstance();
    int timestamp = prefs.getInt(sharedPrefLastCacheTimeKey) ?? 0;
    return DateTime.fromMillisecondsSinceEpoch(timestamp);
  }
}
