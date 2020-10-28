import 'package:flutter/material.dart';
import 'package:flutter_api/logic/view_models/viewmodel_token.dart';
import 'package:flutter_api/ui/screens/products.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TokenViewModel model = TokenViewModel();
  final _userNameTextController = TextEditingController();
  final _passwordTextController = TextEditingController();

  double _formProgress = 0;

  void _updateFormProgress() {
    var progress = 0.0;
    var controllers = [
      _userNameTextController,
      _passwordTextController,
    ];

    for (var controller in controllers) {
      if (controller.value.text.isNotEmpty) {
        progress += 1 / controllers.length;
      }
    }

    setState(() {
      _formProgress = progress;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Api'),
      ),
      body: SingleChildScrollView(
        child: Form(
          onChanged: _updateFormProgress,
          child: Center(
            child: Container(
              padding: EdgeInsets.all(80.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Welcome',
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  TextFormField(
                    controller: _userNameTextController,
                    decoration: InputDecoration(
                      hintText: 'Username',
                      suffix: Icon(Icons.person, color: Colors.grey),
                    ),
                  ),
                  TextFormField(
                    controller: _passwordTextController,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      suffix: Icon(
                        Icons.visibility,
                        color: Colors.grey,
                      ),
                    ),
                    obscureText: true,
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  RaisedButton(
                    color: Colors.yellow,
                    child: Text('ENTER'),
                    onPressed: _formProgress == 1 ? _showProductsScreen : null,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showProductsScreen() async {
    // Navigator.of(context).pushNamed('/products');
    // Navigator.pushReplacementNamed(context, '/products');
    // _fetchTokens(_userNameTextController.text, _passwordTextController.text);
    // _fetchTokens('user@test.com', 'password');

    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ProductScreen()),
    );
    model.loadTokens(
        _userNameTextController.text, _passwordTextController.text);
  }
}

// final url = 'https://node-mongo-jwt-api.herokuapp.com/signin';
// // final url = 'http://localhost:3000/signin';

// Future<Token> _fetchTokens(String email, String password) async {
//   final http.Response response = await http.post(
//     url,
//     headers: <String, String>{
//       'Content-Type': 'application/json; charset=UTF-8',
//     },
//     body: jsonEncode(<String, String>{'email': email, 'password': password}),
//   );
//   if (response.statusCode == 201) {
//     // print(response.body);
//     final tokens = Token.fromJson(jsonDecode(response.body));
//     return tokens;
//   } else {
//     print(response.body);
//     // throw Exception('Failed auth');
//     return null;
//   }
// }
