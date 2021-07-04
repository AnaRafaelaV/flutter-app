import 'package:bhealth/widgets/loading_screen.dart';
import 'package:bhealth/widgets/terms_web_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(BHealthApp());
}

class BHealthApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            Future.delayed(const Duration(seconds: 2), () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => Wrapper()));
            });
          }
          return LoadingScreen();
        },
      ),
    );
  }
}

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TermsAndConditionsWebView();
  }
} 
//if user had already logged in on app redirects to HomeScreen otherwise redirects to LogInPage
/*class Wrapper extends StatelessWidget {
  //final AppNavivator _appNavivator = AppNavivator();
  //final LoginViewModel _loginViewModel = LoginViewModel();
  //late Widget initial = LogInPage();

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
    //Provider.of<LoginViewModel>(context, listen: true).isUserLoggedIn();

    return initial;
  }
}*/
