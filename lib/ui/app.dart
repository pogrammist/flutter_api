import 'package:flutter/material.dart';
import 'package:flutter_api/logic/view_models/viewmodel_token.dart';
import 'package:flutter_api/ui/screens/screen_login.dart';
import 'package:provider/provider.dart';

import 'common/theme.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  TokenViewModel model = TokenViewModel();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TokenViewModel>(
      create: (context) => model,
      child: Consumer<TokenViewModel>(
        builder: (context, model, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Api',
          theme: appTheme,
          home: ScreenLogin(),
          // initialRoute: '/',
          // routes: {
          //   '/': (context) => LoginScreen(),
          //   '/products': (context) => ProductsScreen(),
          // },
        ),
      ),
    );
  }
}
