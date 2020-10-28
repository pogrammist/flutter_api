import 'package:flutter/material.dart';
import 'package:flutter_api/logic/view_models/viewmodel_tokens.dart';
import 'package:flutter_api/ui/screens/login.dart';
import 'package:flutter_api/ui/screens/products.dart';
import 'package:provider/provider.dart';

import 'common/theme.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TokensViewModel model = TokensViewModel();

  @override
  void initState() {
    model.loadTokens();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TokensViewModel>(
      create: (context) => model,
      child: Consumer<TokensViewModel>(
        builder: (context, model, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Api',
          theme: appTheme,
          home: (model.tokens != null) ? ProductsScreen() : LoginScreen(),
          // initialRoute: '/',
          // routes: {
          //   '/': (context) => Login(),
          //   '/products': (context) => ProductsScreen(),
          // },
        ),
      ),
    );
  }
}
