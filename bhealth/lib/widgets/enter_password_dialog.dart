/*this class body depends on if the email entered previously is already registered on firebase or not
if not asks the user to insert a password and confirm that and calls the view model function to register the user
otherwise only cheks if password is valid and logs user on the app*/

import 'package:bhealth/utils/app_navigator.dart';
import 'package:bhealth/view_models/login_view_model.dart';
import 'package:bhealth/view_models/register_view_model.dart';
import 'package:flutter/material.dart';

class EnterPasswordDialog extends StatefulWidget {
  final bool isRegistered;
  final String email;

  EnterPasswordDialog(this.isRegistered, this.email);

  @override
  _EnterPasswordDialogState createState() =>
      _EnterPasswordDialogState(this.isRegistered, this.email);
}

class _EnterPasswordDialogState extends State<EnterPasswordDialog> {
  final bool isRegistered;
  final String email;

  _EnterPasswordDialogState(this.isRegistered, this.email);

  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _confirmPass = TextEditingController();
  final AppNavivator _appNavivator = AppNavivator();

  String message = "";
  final RegisterViewModel _registerViewModel = RegisterViewModel();
  final LoginViewModel _loginViewModel = LoginViewModel();

  //validates the form and calls the register function
  Future<bool> _registerUser(BuildContext context) async {
    bool savedSuccess = false;
    if (!isRegistered) {
      if (_form.currentState!.validate()) {
        final email = this.email;
        final password = _pass.text;

        savedSuccess = await _registerViewModel.register(email, password);
        if (savedSuccess) {
          _appNavivator.navigateToHomeScreen(context);
        }
      }
    }
    return savedSuccess;
  }

  //validates the form and logs the user
  Future<bool> _loginUser(BuildContext context) async {
    bool isLoggedIn = false;
    if (_form.currentState!.validate()) {
      final email = this.email;
      final password = _pass.text;

      final result = await _loginViewModel.login(email, password);
      isLoggedIn = result;
      if (isLoggedIn) {
        _appNavivator.navigateToHomeScreen(context);
      } else {
        setState(() {
          message = "Wrong password";
        });
      }
    }
    return isLoggedIn;
  }

  @override
  Widget build(BuildContext context) {
    return isRegistered
        ? AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            title: Text("Please enter your password."),
            content: Container(
              height: 100,
              child: Form(
                key: _form,
                child: Column(children: <Widget>[
                  TextFormField(
                    obscureText: true,
                    onChanged: (value) {
                      message = "";
                    },
                    controller: _pass,
                    autofocus: true,
                    validator: (value) {
                      if (message.isNotEmpty) {
                        return message;
                      }
                    },
                    autocorrect: false,
                    decoration: new InputDecoration(labelText: "Password"),
                  ),
                ]),
              ),
            ),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    _loginUser(context);
                  },
                  child: Text("SignIn")),
            ],
          )
        : AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            title: Text("Please enter your password."),
            content: Container(
              height: 250,
              child: Form(
                  key: _form,
                  child: ListView(children: <Widget>[
                    TextFormField(
                      controller: _pass,
                      validator: (val) {
                        if (val != null && val.length < 6)
                          return 'Password is too short';
                        return null;
                      },
                      autocorrect: false,
                      obscureText: true,
                      autofocus: true,
                      decoration: new InputDecoration(labelText: "Password"),
                    ),
                    TextFormField(
                      controller: _confirmPass,
                      validator: (val) {
                        if (val != null && val.length < 6 || val != _pass.text)
                          return "Passwords don't match";
                        return null;
                      },
                      autocorrect: false,
                      obscureText: true,
                      autofocus: true,
                      decoration:
                          new InputDecoration(labelText: "Confirm password"),
                    ),
                  ])),
            ),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    _registerUser(context);
                  },
                  child: Text("SignUp")),
            ],
          );
  }
}
