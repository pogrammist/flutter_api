import 'package:flutter_api/logic/models/token.dart';
import 'package:flutter_api/services/api/api_token_implementation.dart';
import 'package:flutter/foundation.dart';

class TokenViewModel extends ChangeNotifier {
  final ApiTokenImpl _apiTokenstImpl = ApiTokenImpl();
  Token _tokens;

  Token get tokens => _tokens;

  void loadTokens(String email, String password) async {
    _tokens = await _apiTokenstImpl.fetchTokens(email, password);
    notifyListeners();
  }

  void removeTokens() async {
    _tokens = null;
    notifyListeners();
  }
}
