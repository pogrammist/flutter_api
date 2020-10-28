import 'package:flutter_api/logic/models/token.dart';

abstract class ApiTokens {
  Future<Token> fetchTokens();
}
