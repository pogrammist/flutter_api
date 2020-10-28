import 'package:flutter_api/logic/models/token.dart';

abstract class ApiToken {
  Future<Token> fetchTokens(String email, String password);
}
