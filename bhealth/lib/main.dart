import 'package:bhealth/pages/home_page.dart';
import 'package:bhealth/pages/login_page.dart';
import 'package:bhealth/view_models/login_view_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(BHealthApp());
}

class BHealthApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "BHealth",
      home: Wrapper(),
    );
  }
}

//if user had already logged in on app redirects to HomeScreen otherwise redirects to LogInPage
class Wrapper extends StatefulWidget {
  @override
  _WrapperSate createState() => _WrapperSate();
}

class _WrapperSate extends State<Wrapper> {
  late Widget initial = LogInPage();
  LoginViewModel _loginViewModel = LoginViewModel();

  //cheks if user is already logged in
  Future<Widget> _checkUserLoggedIn() async {
    bool isLogged = false;
    isLogged = await _loginViewModel.isUserrLoggedIn();
    if (isLogged) {
      setState(() {
        initial = HomeScreenPage();
      });
    } else {
      setState(() {
        initial = LogInPage();
      });
    }
    return initial;
  }

  @override
  Widget build(BuildContext context) {
    _checkUserLoggedIn();
    return initial;
  }
}
