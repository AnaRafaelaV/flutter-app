import 'package:bhealth/pages/home_screen_page.dart';
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
  String message = "";

  RegisterViewModel _registerViewModel = RegisterViewModel();
  LoginViewModel _loginViewModel = LoginViewModel();

  Future<bool> _registerUser(BuildContext context) async {
    bool savedSuccess = false;
    if (!isRegistered) {
      if (_form.currentState!.validate()) {
        final email = this.email;
        final password = _pass.text;

        savedSuccess = await _registerViewModel.register(email, password);
        if (savedSuccess) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => HomeScreenPage()));
        }
      }
    }
    return savedSuccess;
  }

  Future<bool> _loginUser(BuildContext context) async {
    bool isLoggedIn = false;
    if (_form.currentState!.validate()) {
      final email = this.email;
      final password = _pass.text;

      final result = await _loginViewModel.login(email, password);
      isLoggedIn = result;
      if (isLoggedIn) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomeScreenPage()));
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
                    controller: _pass,
                    autofocus: true,
                    autocorrect: false,
                    decoration: new InputDecoration(labelText: "Password"),
                  ),
                  Spacer(),
                  Text(
                    message,
                    style: TextStyle(fontSize: 11, color: Colors.red),
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