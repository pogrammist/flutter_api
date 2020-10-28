import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_api/logic/models/token.dart';
import 'api_token.dart';

class ApiTokenImpl implements ApiToken {
  final _host = 'node-mongo-jwt-api.herokuapp.com';
  final _path = 'signin';
  final Map<String, String> _headers = {
    'Content-Type': 'application/json; charset=UTF-8'
  };

  Token _tokensCache;

  Future<Token> fetchTokens(String email, String password) async {
    if (_tokensCache == null) {
      print('getting tokens from the web');
      final uri = Uri.https(_host, _path);
      final results = await http.post(
        uri,
        headers: _headers,
        body: jsonEncode(
          <String, String>{'email': email, 'password': password},
        ),
      );
      final jsonObject = json.decode(results.body);
      _tokensCache = _createTokensFromRawMap(jsonObject);
      print(_tokensCache.accessToken);
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
