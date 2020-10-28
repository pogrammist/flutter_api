import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_api/logic/models/token.dart';
import 'api_tokens.dart';

class ApiTokensImpl implements ApiTokens {
  final _host = 'node-mongo-jwt-api.herokuapp.com';
  final _path = 'signin';
  final Map<String, String> _headers = {'Accept': 'application/json'};

  Token _tokensCache;

  Future<Token> fetchTokens() async {
    if (_tokensCache == null) {
      print('getting tokens from the web');
      final uri = Uri.https(_host, _path);
      final results = await http.get(uri, headers: _headers);
      final jsonObject = json.decode(results.body);
      print(results.body);
      _tokensCache = _createTokensFromRawMap(jsonObject);
    } else {
      print('getting tokens from cache');
    }
    return _tokensCache;
  }

  Token _createTokensFromRawMap(Map jsonObject) {
    Token tokens = Token.fromJson(jsonObject);
    return tokens;
  }
}
