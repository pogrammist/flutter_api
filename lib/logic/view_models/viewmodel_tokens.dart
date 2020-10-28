import 'package:flutter_api/logic/models/token.dart';
import 'package:flutter_api/services/api/api_tokens_implementation.dart';
import 'package:flutter/foundation.dart';

class TokensViewModel extends ChangeNotifier {
  final ApiTokensImpl _apiTokenstImpl = ApiTokensImpl();
  Token _tokens;

  Token get tokens => _tokens;

  void loadTokens() async {
    _tokens = await _apiTokenstImpl.fetchTokens();
    notifyListeners();
  }
}
