import 'dart:convert';

import 'package:flutter_api/logic/models/token.dart';
import 'package:flutter_api/services/storage/storage_token.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageTokenImpl implements StorageToken {
  static const sharedPrefTokenKey = 'token_key';

  @override
  Future cacheTokenData(Token data) {
    String jsonString = jsonEncode(data);
    _saveToPreferences(sharedPrefTokenKey, jsonString);
    return null;
  }

  @override
  Future<Token> getTokenData() {
    // TODO: implement getTokenData
    throw UnimplementedError();
  }

  @override
  Future<bool> isExpiredToken() {
    // TODO: implement isExpiredToken
    throw UnimplementedError();
  }

  Future<void> _saveToPreferences(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }
}
