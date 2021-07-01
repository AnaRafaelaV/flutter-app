import 'package:bhealth/pages/login_page.dart';
import 'package:bhealth/utils/app_navigator.dart';
import 'package:bhealth/view_models/login_view_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
      home: ChangeNotifierProvider(
        create: (context) => LoginViewModel(),
        child: Wrapper(),
      ),
    );
  }
}

//if user had already logged in on app redirects to HomeScreen otherwise redirects to LogInPage
class Wrapper extends StatelessWidget {
  final AppNavivator _appNavivator = AppNavivator();
  final LoginViewModel _loginViewModel = LoginViewModel();
  late Widget initial = LogInPage();

  Future<Widget> _checkUserIsLogged(BuildContext context) async {
    bool isLogged = await _loginViewModel.isUserLoggedIn();
    if (isLogged) {
      return _appNavivator.navigateToHomeScreen(context);
    }
    return _appNavivator.navigateToLoginScreen(context);
  }

  void _setWidget(BuildContext context) async {
    initial = await _checkUserIsLogged(context);
  }

  @override
  Widget build(BuildContext context) {
    _setWidget(context);
    Provider.of<LoginViewModel>(context, listen: true).isUserLoggedIn();

    return initial;
  }
}
