import 'package:flutter_api/logic/models/token.dart';

abstract class StorageToken {
  Future cacheTokenData(Token data);

  Future<Token> getTokenData();

  Future<bool> isExpiredToken();
}
