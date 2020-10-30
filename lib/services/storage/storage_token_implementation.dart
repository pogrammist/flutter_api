import 'dart:convert';

import 'package:flutter_api/logic/models/token.dart';
import 'package:flutter_api/services/storage/storage_token.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class StorageTokenImpl implements StorageToken {
  static const sharedPrefTokenKey = 'token_key';

  // Write Token
  @override
  Future cacheTokenData(Token data) {
    String jsonString = jsonEncode(data);
    _saveToPreferences(sharedPrefTokenKey, jsonString);
    return null;
  }

  Future<void> _saveToPreferences(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  // Read Token
  @override
  Future<Token> getTokenData() async {
    String data = await _getStringFromPreferences(sharedPrefTokenKey);
    Token token = _deserializeToken(data);
    return Future<Token>.value(token);
  }

  Future<String> _getStringFromPreferences(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return Future<String>.value(prefs.getString(key) ?? '');
  }

  Token _deserializeToken(String data) {
    Map token = jsonDecode(data);
    return Token.fromJson(token);
  }

  // Check Token
  @override
  Future<bool> isExpiredToken() async {
    String data = await getTokenData().then((value) => value.accessToken);
    bool hasExpired = JwtDecoder.isExpired(data);
    return Future<bool>.value(hasExpired);
  }
}
