import 'package:bhealth/pages/home_page.dart';
import 'package:bhealth/view_models/login_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GoogleButtonWidget extends StatelessWidget {
  LoginViewModel _loginViewModel = LoginViewModel();

  Future<bool> _sigIn(BuildContext context) async {
    bool isLoggedIn = false;
    final userCredentials = await _loginViewModel.sigInGoogle();
    isLoggedIn = userCredentials != null;
    if (isLoggedIn) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
    }
    return isLoggedIn;
  }

  GoogleButtonWidget();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: OutlinedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.white),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
        onPressed: () {
          _sigIn(context);
        },
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image(
                image: AssetImage("assets/images/google_logo.png"),
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  'Sign in with Google',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black54,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
